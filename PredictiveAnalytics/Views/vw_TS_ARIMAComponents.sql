-- =============================================
-- View: vw_TS_ARIMAComponents
-- Description: Calculates ARIMA components including autocorrelation, differencing, and stationarity tests
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_TS_ARIMAComponents]
AS
WITH DailyTimeSeries AS (
    -- Get daily time series data
    SELECT 
        TeamID,
        TeamName,
        DateValue,
        DailyReferrals,
        MA7_Referrals,
        MA28_Referrals,
        ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY DateValue) AS TimeIndex
    FROM pbi.vw_TS_DataPreparation
    WHERE DateValue >= DATEADD(YEAR, -2, GETDATE())
        AND DailyReferrals IS NOT NULL
),
SeriesStatistics AS (
    -- Calculate mean and variance for stationarity analysis
    SELECT 
        TeamID,
        AVG(CAST(DailyReferrals AS FLOAT)) AS SeriesMean,
        STDEV(DailyReferrals) AS SeriesStDev,
        MIN(DailyReferrals) AS SeriesMin,
        MAX(DailyReferrals) AS SeriesMax,
        COUNT(*) AS ObservationCount
    FROM DailyTimeSeries
    GROUP BY TeamID
),
Differencing AS (
    -- Calculate various orders of differencing for stationarity
    SELECT 
        dts.*,
        ss.SeriesMean,
        ss.SeriesStDev,
        
        -- First order differencing (removes trend)
        DailyReferrals - LAG(DailyReferrals, 1) OVER (PARTITION BY dts.TeamID ORDER BY DateValue) AS Diff_1,
        
        -- Second order differencing (removes quadratic trend)
        (DailyReferrals - LAG(DailyReferrals, 1) OVER (PARTITION BY dts.TeamID ORDER BY DateValue)) -
        LAG(DailyReferrals - LAG(DailyReferrals, 1) OVER (PARTITION BY dts.TeamID ORDER BY DateValue), 1) 
            OVER (PARTITION BY dts.TeamID ORDER BY DateValue) AS Diff_2,
        
        -- Seasonal differencing (lag 7 for weekly pattern)
        DailyReferrals - LAG(DailyReferrals, 7) OVER (PARTITION BY dts.TeamID ORDER BY DateValue) AS Diff_Seasonal7,
        
        -- Seasonal differencing (lag 30 for monthly pattern)
        DailyReferrals - LAG(DailyReferrals, 30) OVER (PARTITION BY dts.TeamID ORDER BY DateValue) AS Diff_Seasonal30,
        
        -- Combined differencing (first + seasonal)
        (DailyReferrals - LAG(DailyReferrals, 1) OVER (PARTITION BY dts.TeamID ORDER BY DateValue)) -
        (LAG(DailyReferrals, 7) OVER (PARTITION BY dts.TeamID ORDER BY DateValue) - 
         LAG(DailyReferrals, 8) OVER (PARTITION BY dts.TeamID ORDER BY DateValue)) AS Diff_Combined,
         
        -- Log transformation for variance stabilization
        CASE 
            WHEN DailyReferrals > 0 
            THEN LOG(DailyReferrals) 
            ELSE NULL 
        END AS LogReferrals,
        
        -- Square root transformation
        SQRT(CAST(DailyReferrals AS FLOAT)) AS SqrtReferrals
        
    FROM DailyTimeSeries dts
    CROSS JOIN SeriesStatistics ss
    WHERE dts.TeamID = ss.TeamID
),
AutocorrelationBase AS (
    -- Prepare data for autocorrelation calculation
    SELECT 
        d1.TeamID,
        d1.DateValue,
        d1.DailyReferrals,
        d1.Diff_1,
        d1.SeriesMean,
        d1.SeriesStDev,
        -- Lag values for correlation
        d2.DailyReferrals AS Lag1_Value,
        d3.DailyReferrals AS Lag2_Value,
        d7.DailyReferrals AS Lag7_Value,
        d14.DailyReferrals AS Lag14_Value,
        d30.DailyReferrals AS Lag30_Value
    FROM Differencing d1
    LEFT JOIN Differencing d2 ON d1.TeamID = d2.TeamID 
        AND d1.DateValue = DATEADD(DAY, 1, d2.DateValue)
    LEFT JOIN Differencing d3 ON d1.TeamID = d3.TeamID 
        AND d1.DateValue = DATEADD(DAY, 2, d3.DateValue)
    LEFT JOIN Differencing d7 ON d1.TeamID = d7.TeamID 
        AND d1.DateValue = DATEADD(DAY, 7, d7.DateValue)
    LEFT JOIN Differencing d14 ON d1.TeamID = d14.TeamID 
        AND d1.DateValue = DATEADD(DAY, 14, d14.DateValue)
    LEFT JOIN Differencing d30 ON d1.TeamID = d30.TeamID 
        AND d1.DateValue = DATEADD(DAY, 30, d30.DateValue)
),
Autocorrelations AS (
    -- Calculate autocorrelation coefficients
    SELECT 
        TeamID,
        
        -- ACF calculations (simplified Pearson correlation)
        (SUM((DailyReferrals - SeriesMean) * (Lag1_Value - SeriesMean)) / COUNT(*)) /
            NULLIF(POWER(SeriesStDev, 2), 0) AS ACF_Lag1,
        (SUM((DailyReferrals - SeriesMean) * (Lag2_Value - SeriesMean)) / COUNT(*)) /
            NULLIF(POWER(SeriesStDev, 2), 0) AS ACF_Lag2,
        (SUM((DailyReferrals - SeriesMean) * (Lag7_Value - SeriesMean)) / COUNT(*)) /
            NULLIF(POWER(SeriesStDev, 2), 0) AS ACF_Lag7,
        (SUM((DailyReferrals - SeriesMean) * (Lag14_Value - SeriesMean)) / COUNT(*)) /
            NULLIF(POWER(SeriesStDev, 2), 0) AS ACF_Lag14,
        (SUM((DailyReferrals - SeriesMean) * (Lag30_Value - SeriesMean)) / COUNT(*)) /
            NULLIF(POWER(SeriesStDev, 2), 0) AS ACF_Lag30,
            
        -- Count of observations for significance testing
        COUNT(*) AS N,
        
        -- Standard error for significance bounds
        1.0 / SQRT(CAST(COUNT(*) AS FLOAT)) AS StandardError
        
    FROM AutocorrelationBase
    WHERE Lag30_Value IS NOT NULL
    GROUP BY TeamID, SeriesMean, SeriesStDev
),
StationarityTests AS (
    -- Perform stationarity tests
    SELECT 
        TeamID,
        
        -- Rolling window statistics for stationarity check
        AVG(CASE WHEN TimeIndex <= ObservationCount/2 THEN DailyReferrals END) AS FirstHalfMean,
        AVG(CASE WHEN TimeIndex > ObservationCount/2 THEN DailyReferrals END) AS SecondHalfMean,
        STDEV(CASE WHEN TimeIndex <= ObservationCount/2 THEN DailyReferrals END) AS FirstHalfStDev,
        STDEV(CASE WHEN TimeIndex > ObservationCount/2 THEN DailyReferrals END) AS SecondHalfStDev,
        
        -- Trend strength (linear regression slope)
        (COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * DailyReferrals) - 
         SUM(CAST(TimeIndex AS FLOAT)) * SUM(DailyReferrals)) /
        NULLIF(COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * CAST(TimeIndex AS FLOAT)) - 
         POWER(SUM(CAST(TimeIndex AS FLOAT)), 2), 0) AS TrendSlope,
         
        -- Check differenced series stationarity
        STDEV(Diff_1) AS Diff1_StDev,
        AVG(ABS(Diff_1)) AS Diff1_MAD,
        
        ObservationCount
        
    FROM Differencing
    GROUP BY TeamID, ObservationCount
),
MovingWindowStats AS (
    -- Calculate moving window statistics for time-varying parameters
    SELECT 
        d.TeamID,
        d.DateValue,
        d.DailyReferrals,
        d.Diff_1,
        
        -- 30-day rolling statistics
        AVG(d.DailyReferrals) OVER (
            PARTITION BY d.TeamID 
            ORDER BY d.DateValue 
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS RollingMean30,
        
        STDEV(d.DailyReferrals) OVER (
            PARTITION BY d.TeamID 
            ORDER BY d.DateValue 
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS RollingStDev30,
        
        -- Check for variance changes (heteroskedasticity)
        STDEV(d.DailyReferrals) OVER (
            PARTITION BY d.TeamID 
            ORDER BY d.DateValue 
            ROWS BETWEEN 89 PRECEDING AND 60 PRECEDING
        ) AS StDev_3MonthsAgo,
        
        STDEV(d.DailyReferrals) OVER (
            PARTITION BY d.TeamID 
            ORDER BY d.DateValue 
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS StDev_Recent
        
    FROM Differencing d
),
ARIMAParameters AS (
    -- Suggest ARIMA parameters based on analysis
    SELECT 
        a.TeamID,
        
        -- Suggested p (AR order) based on PACF cutoff
        CASE 
            WHEN ABS(a.ACF_Lag1) > 2 * a.StandardError AND ABS(a.ACF_Lag2) < 2 * a.StandardError THEN 1
            WHEN ABS(a.ACF_Lag2) > 2 * a.StandardError THEN 2
            ELSE 0
        END AS Suggested_p,
        
        -- Suggested d (differencing order) based on stationarity
        CASE 
            WHEN ABS(st.TrendSlope) > 0.1 AND st.Diff1_StDev < st.SecondHalfStDev THEN 1
            WHEN ABS(st.TrendSlope) > 0.5 THEN 2
            ELSE 0
        END AS Suggested_d,
        
        -- Suggested q (MA order) based on ACF cutoff
        CASE 
            WHEN ABS(a.ACF_Lag1) > 2 * a.StandardError AND ABS(a.ACF_Lag2) > 2 * a.StandardError THEN 2
            WHEN ABS(a.ACF_Lag1) > 2 * a.StandardError THEN 1
            ELSE 0
        END AS Suggested_q,
        
        -- Seasonal parameters (for weekly pattern)
        CASE 
            WHEN ABS(a.ACF_Lag7) > 2 * a.StandardError THEN 1
            ELSE 0
        END AS Suggested_P_seasonal,
        
        7 AS Seasonal_Period,
        
        -- Model type recommendation
        CASE 
            WHEN ABS(st.TrendSlope) < 0.01 AND ABS(a.ACF_Lag1) < 2 * a.StandardError THEN 'White Noise'
            WHEN ABS(a.ACF_Lag7) > 3 * a.StandardError THEN 'Seasonal ARIMA'
            WHEN ABS(st.TrendSlope) > 0.1 THEN 'ARIMA with differencing'
            ELSE 'Simple ARIMA'
        END AS ModelRecommendation
        
    FROM Autocorrelations a
    INNER JOIN StationarityTests st ON a.TeamID = st.TeamID
),
FinalOutput AS (
    -- Combine all components for output
    SELECT 
        d.TeamID,
        d.TeamName,
        d.DateValue,
        d.DailyReferrals,
        d.MA7_Referrals,
        d.MA28_Referrals,
        
        -- Differenced series
        d.Diff_1,
        d.Diff_2,
        d.Diff_Seasonal7,
        d.Diff_Seasonal30,
        
        -- Transformations
        d.LogReferrals,
        d.SqrtReferrals,
        
        -- Autocorrelations
        ROUND(a.ACF_Lag1, 4) AS ACF_Lag1,
        ROUND(a.ACF_Lag2, 4) AS ACF_Lag2,
        ROUND(a.ACF_Lag7, 4) AS ACF_Lag7,
        ROUND(a.ACF_Lag14, 4) AS ACF_Lag14,
        ROUND(a.ACF_Lag30, 4) AS ACF_Lag30,
        
        -- Significance bounds
        ROUND(2 * a.StandardError, 4) AS ACF_SignificanceBound,
        
        -- Stationarity indicators
        CASE 
            WHEN ABS(st.FirstHalfMean - st.SecondHalfMean) / NULLIF(st.FirstHalfMean, 0) < 0.1 
                AND ABS(st.FirstHalfStDev - st.SecondHalfStDev) / NULLIF(st.FirstHalfStDev, 0) < 0.2
            THEN 'Stationary'
            WHEN st.TrendSlope > 0.1 THEN 'Trending Up'
            WHEN st.TrendSlope < -0.1 THEN 'Trending Down'
            ELSE 'Non-Stationary'
        END AS StationarityStatus,
        
        -- Moving statistics
        mw.RollingMean30,
        mw.RollingStDev30,
        
        -- Variance stability
        CASE 
            WHEN ABS(mw.StDev_Recent - mw.StDev_3MonthsAgo) / NULLIF(mw.StDev_3MonthsAgo, 0) > 0.5
            THEN 'Variance Changing'
            ELSE 'Variance Stable'
        END AS VarianceStability,
        
        -- ARIMA parameters
        ap.Suggested_p AS ARIMA_p,
        ap.Suggested_d AS ARIMA_d,
        ap.Suggested_q AS ARIMA_q,
        ap.Suggested_P_seasonal AS ARIMA_P_seasonal,
        ap.Seasonal_Period,
        ap.ModelRecommendation,
        
        -- Simple AR(1) forecast
        d.DailyReferrals + (a.ACF_Lag1 * (d.DailyReferrals - d.SeriesMean)) AS AR1_Forecast,
        
        -- Simple MA(1) forecast using error term approximation
        d.SeriesMean + (d.DailyReferrals - d.MA7_Referrals) * 0.5 AS MA1_Forecast,
        
        -- ARMA(1,1) combination
        d.SeriesMean + 
            (a.ACF_Lag1 * (d.DailyReferrals - d.SeriesMean)) + 
            ((d.DailyReferrals - d.MA7_Referrals) * 0.3) AS ARMA11_Forecast
        
    FROM Differencing d
    LEFT JOIN Autocorrelations a ON d.TeamID = a.TeamID
    LEFT JOIN StationarityTests st ON d.TeamID = st.TeamID
    LEFT JOIN MovingWindowStats mw ON d.TeamID = mw.TeamID AND d.DateValue = mw.DateValue
    LEFT JOIN ARIMAParameters ap ON d.TeamID = ap.TeamID
)
SELECT * FROM FinalOutput
WHERE DateValue >= DATEADD(MONTH, -6, GETDATE())  -- Last 6 months for display

GO