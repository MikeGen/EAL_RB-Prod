-- =============================================
-- View: vw_TS_SeasonalDecomposition
-- Description: Decomposes time series into trend, seasonal, and residual components using STL-like approach
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_TS_SeasonalDecomposition]
AS
WITH MonthlyAggregates AS (
    -- Aggregate to monthly level for cleaner seasonal patterns
    SELECT 
        TeamID,
        TeamName,
        AreaID,
        YEAR(DateValue) AS Year,
        MONTH(DateValue) AS Month,
        DATEFROMPARTS(YEAR(DateValue), MONTH(DateValue), 1) AS MonthDate,
        SUM(DailyReferrals) AS MonthlyReferrals,
        AVG(DailyReferrals) AS AvgDailyReferrals,
        SUM(DailyNewClients) AS MonthlyNewClients,
        SUM(DailyActivities) AS MonthlyActivities,
        SUM(DailyActivityMinutes) AS MonthlyActivityMinutes,
        COUNT(DISTINCT DateValue) AS DaysInMonth
    FROM pbi.vw_TS_DataPreparation
    GROUP BY 
        TeamID,
        TeamName,
        AreaID,
        YEAR(DateValue),
        MONTH(DateValue)
),
TrendComponent AS (
    -- Calculate trend using centered moving average
    SELECT 
        *,
        -- Simple centered moving average for trend (12-month for monthly data)
        AVG(MonthlyReferrals) OVER (
            PARTITION BY TeamID 
            ORDER BY MonthDate 
            ROWS BETWEEN 5 PRECEDING AND 6 FOLLOWING
        ) AS Trend_CMA12,
        
        -- Weighted moving average giving more weight to recent observations
        SUM(MonthlyReferrals * 
            CASE 
                WHEN ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY MonthDate DESC) <= 3 THEN 0.3
                WHEN ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY MonthDate DESC) <= 6 THEN 0.2
                WHEN ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY MonthDate DESC) <= 12 THEN 0.1
                ELSE 0.05
            END
        ) OVER (
            PARTITION BY TeamID 
            ORDER BY MonthDate 
            ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
        ) AS Trend_WMA,
        
        -- Linear trend using regression coefficients
        ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY MonthDate) AS TimeIndex
    FROM MonthlyAggregates
),
LinearTrend AS (
    -- Calculate linear trend parameters
    SELECT 
        TeamID,
        -- Simple linear regression coefficients
        (COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * MonthlyReferrals) - 
         SUM(CAST(TimeIndex AS FLOAT)) * SUM(MonthlyReferrals)) /
        NULLIF(COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * CAST(TimeIndex AS FLOAT)) - 
         POWER(SUM(CAST(TimeIndex AS FLOAT)), 2), 0) AS TrendSlope,
        
        (SUM(MonthlyReferrals) - 
         ((COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * MonthlyReferrals) - 
           SUM(CAST(TimeIndex AS FLOAT)) * SUM(MonthlyReferrals)) /
          NULLIF(COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * CAST(TimeIndex AS FLOAT)) - 
           POWER(SUM(CAST(TimeIndex AS FLOAT)), 2), 0)) * 
         SUM(CAST(TimeIndex AS FLOAT))) / NULLIF(COUNT(*), 0) AS TrendIntercept
    FROM TrendComponent
    GROUP BY TeamID
),
TrendWithLinear AS (
    -- Add linear trend to the data
    SELECT 
        tc.*,
        lt.TrendSlope,
        lt.TrendIntercept,
        lt.TrendIntercept + (lt.TrendSlope * tc.TimeIndex) AS Trend_Linear,
        
        -- Polynomial trend (quadratic)
        lt.TrendIntercept + 
        (lt.TrendSlope * tc.TimeIndex) + 
        (0.001 * POWER(tc.TimeIndex, 2)) AS Trend_Polynomial
    FROM TrendComponent tc
    LEFT JOIN LinearTrend lt ON tc.TeamID = lt.TeamID
),
DetrendedSeries AS (
    -- Remove trend to isolate seasonal + residual
    SELECT 
        *,
        MonthlyReferrals - ISNULL(Trend_CMA12, Trend_Linear) AS Detrended_CMA,
        MonthlyReferrals - Trend_Linear AS Detrended_Linear,
        
        -- Calculate ratio to trend (multiplicative decomposition)
        CASE 
            WHEN ISNULL(Trend_CMA12, Trend_Linear) > 0 
            THEN MonthlyReferrals / ISNULL(Trend_CMA12, Trend_Linear)
            ELSE 1
        END AS SeasonalRatio
    FROM TrendWithLinear
),
SeasonalIndices AS (
    -- Calculate average seasonal pattern
    SELECT 
        TeamID,
        Month,
        AVG(Detrended_CMA) AS AvgSeasonalEffect_Additive,
        AVG(SeasonalRatio) AS AvgSeasonalIndex_Multiplicative,
        STDEV(Detrended_CMA) AS StDevSeasonal,
        COUNT(*) AS ObservationCount
    FROM DetrendedSeries
    WHERE Trend_CMA12 IS NOT NULL  -- Only use complete observations
    GROUP BY TeamID, Month
),
NormalizedSeasonalIndices AS (
    -- Normalize seasonal indices to sum to 0 (additive) or average to 1 (multiplicative)
    SELECT 
        TeamID,
        Month,
        AvgSeasonalEffect_Additive - 
            AVG(AvgSeasonalEffect_Additive) OVER (PARTITION BY TeamID) AS SeasonalEffect_Normalized,
        AvgSeasonalIndex_Multiplicative / 
            NULLIF(AVG(AvgSeasonalIndex_Multiplicative) OVER (PARTITION BY TeamID), 0) AS SeasonalIndex_Normalized,
        StDevSeasonal,
        ObservationCount
    FROM SeasonalIndices
),
DecomposedComponents AS (
    -- Combine all components
    SELECT 
        ds.TeamID,
        ds.TeamName,
        ds.AreaID,
        ds.MonthDate,
        ds.Year,
        ds.Month,
        ds.MonthlyReferrals AS Observed,
        
        -- Trend components
        ISNULL(ds.Trend_CMA12, ds.Trend_Linear) AS Trend,
        ds.Trend_Linear,
        ds.Trend_Polynomial,
        ds.TrendSlope,
        
        -- Seasonal components
        nsi.SeasonalEffect_Normalized AS Seasonal_Additive,
        nsi.SeasonalIndex_Normalized AS Seasonal_Multiplicative,
        
        -- Calculate residuals
        ds.MonthlyReferrals - 
            ISNULL(ds.Trend_CMA12, ds.Trend_Linear) - 
            ISNULL(nsi.SeasonalEffect_Normalized, 0) AS Residual_Additive,
        
        CASE 
            WHEN ISNULL(ds.Trend_CMA12, ds.Trend_Linear) * ISNULL(nsi.SeasonalIndex_Normalized, 1) > 0
            THEN ds.MonthlyReferrals - (ISNULL(ds.Trend_CMA12, ds.Trend_Linear) * ISNULL(nsi.SeasonalIndex_Normalized, 1))
            ELSE 0
        END AS Residual_Multiplicative,
        
        -- Reconstructed values
        ISNULL(ds.Trend_CMA12, ds.Trend_Linear) + 
            ISNULL(nsi.SeasonalEffect_Normalized, 0) AS Fitted_Additive,
        ISNULL(ds.Trend_CMA12, ds.Trend_Linear) * 
            ISNULL(nsi.SeasonalIndex_Normalized, 1) AS Fitted_Multiplicative,
        
        -- Component strengths
        CASE 
            WHEN ds.MonthlyReferrals > 0 
            THEN ABS(ISNULL(ds.Trend_CMA12, ds.Trend_Linear)) * 100.0 / ds.MonthlyReferrals
            ELSE 0
        END AS TrendStrength,
        
        CASE 
            WHEN ds.MonthlyReferrals > 0 
            THEN ABS(ISNULL(nsi.SeasonalEffect_Normalized, 0)) * 100.0 / ds.MonthlyReferrals
            ELSE 0
        END AS SeasonalStrength,
        
        -- Additional metrics
        ds.MonthlyNewClients,
        ds.MonthlyActivities,
        ds.MonthlyActivityMinutes,
        ds.DaysInMonth
        
    FROM DetrendedSeries ds
    LEFT JOIN NormalizedSeasonalIndices nsi ON ds.TeamID = nsi.TeamID AND ds.Month = nsi.Month
),
ComponentStatistics AS (
    -- Calculate statistics for each component
    SELECT 
        TeamID,
        
        -- Trend statistics
        AVG(Trend) AS AvgTrend,
        STDEV(Trend) AS StDevTrend,
        MIN(Trend) AS MinTrend,
        MAX(Trend) AS MaxTrend,
        
        -- Seasonal statistics
        AVG(ABS(Seasonal_Additive)) AS AvgSeasonalMagnitude,
        MAX(Seasonal_Additive) AS MaxSeasonalPeak,
        MIN(Seasonal_Additive) AS MinSeasonalTrough,
        
        -- Residual statistics (for model quality)
        AVG(Residual_Additive) AS AvgResidual,
        STDEV(Residual_Additive) AS StDevResidual,
        AVG(ABS(Residual_Additive)) AS MAE_Residual,
        SQRT(AVG(POWER(Residual_Additive, 2))) AS RMSE_Residual,
        
        -- Model fit statistics
        1 - (SUM(POWER(Residual_Additive, 2)) / 
             NULLIF(SUM(POWER(Observed - AVG(Observed) OVER (PARTITION BY TeamID), 2)), 0)) AS R_Squared
             
    FROM DecomposedComponents
    GROUP BY TeamID
)
SELECT 
    dc.*,
    
    -- Seasonal pattern classification
    CASE 
        WHEN dc.Month IN (12, 1, 2) THEN 'Summer'
        WHEN dc.Month IN (3, 4, 5) THEN 'Autumn'
        WHEN dc.Month IN (6, 7, 8) THEN 'Winter'
        WHEN dc.Month IN (9, 10, 11) THEN 'Spring'
    END AS Season_NZ,
    
    -- Anomaly detection based on residuals
    CASE 
        WHEN ABS(dc.Residual_Additive) > 2 * cs.StDevResidual THEN 'Anomaly'
        WHEN ABS(dc.Residual_Additive) > cs.StDevResidual THEN 'Unusual'
        ELSE 'Normal'
    END AS ResidualClassification,
    
    -- Forecast components for next period
    dc.Trend + (dc.TrendSlope * 1) AS NextPeriod_Trend,
    dc.Seasonal_Additive AS NextPeriod_Seasonal,
    (dc.Trend + (dc.TrendSlope * 1)) + dc.Seasonal_Additive AS NextPeriod_Forecast_Additive,
    (dc.Trend + (dc.TrendSlope * 1)) * ISNULL(dc.Seasonal_Multiplicative, 1) AS NextPeriod_Forecast_Multiplicative,
    
    -- Model quality metrics
    cs.R_Squared AS Model_R_Squared,
    cs.MAE_Residual AS Model_MAE,
    cs.RMSE_Residual AS Model_RMSE,
    
    -- Decomposition type recommendation
    CASE 
        WHEN cs.StDevResidual < cs.AvgTrend * 0.1 THEN 'Use Additive'
        WHEN dc.SeasonalStrength > 20 THEN 'Use Multiplicative'
        ELSE 'Either Method'
    END AS RecommendedDecomposition
    
FROM DecomposedComponents dc
LEFT JOIN ComponentStatistics cs ON dc.TeamID = cs.TeamID

GO