-- =============================================
-- View: vw_TS_ExponentialSmoothing
-- Description: Implements exponential smoothing methods including Holt-Winters for forecasting
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_TS_ExponentialSmoothing]
AS
WITH WeeklyData AS (
    -- Aggregate to weekly level for smoother patterns
    SELECT 
        TeamID,
        TeamName,
        AreaID,
        DATEPART(YEAR, DateValue) AS Year,
        DATEPART(WEEK, DateValue) AS WeekNum,
        MIN(DateValue) AS WeekStartDate,
        SUM(DailyReferrals) AS WeeklyReferrals,
        SUM(DailyNewClients) AS WeeklyNewClients,
        SUM(DailyActivities) AS WeeklyActivities,
        AVG(CAST(DailyReferrals AS FLOAT)) AS AvgDailyReferrals,
        COUNT(*) AS DaysInWeek
    FROM pbi.vw_TS_DataPreparation
    WHERE DateValue >= DATEADD(YEAR, -2, GETDATE())  -- Last 2 years for performance
    GROUP BY 
        TeamID,
        TeamName,
        AreaID,
        DATEPART(YEAR, DateValue),
        DATEPART(WEEK, DateValue)
),
SimpleExponentialSmoothing AS (
    -- Simple Exponential Smoothing (SES) - Level only
    SELECT 
        *,
        -- Using recursive calculation approximation with window functions
        -- Alpha = 0.3 (smoothing parameter)
        AVG(WeeklyReferrals * POWER(0.7, ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY WeekStartDate DESC) - 1))
            OVER (PARTITION BY TeamID ORDER BY WeekStartDate ROWS UNBOUNDED PRECEDING) 
            / NULLIF(
                SUM(POWER(0.7, ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY WeekStartDate DESC) - 1))
                OVER (PARTITION BY TeamID ORDER BY WeekStartDate ROWS UNBOUNDED PRECEDING), 0
            ) AS SES_Alpha03,
            
        -- Alpha = 0.5
        AVG(WeeklyReferrals * POWER(0.5, ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY WeekStartDate DESC) - 1))
            OVER (PARTITION BY TeamID ORDER BY WeekStartDate ROWS UNBOUNDED PRECEDING) 
            / NULLIF(
                SUM(POWER(0.5, ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY WeekStartDate DESC) - 1))
                OVER (PARTITION BY TeamID ORDER BY WeekStartDate ROWS UNBOUNDED PRECEDING), 0
            ) AS SES_Alpha05,
            
        -- Alpha = 0.7 (more responsive to recent changes)
        AVG(WeeklyReferrals * POWER(0.3, ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY WeekStartDate DESC) - 1))
            OVER (PARTITION BY TeamID ORDER BY WeekStartDate ROWS UNBOUNDED PRECEDING) 
            / NULLIF(
                SUM(POWER(0.3, ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY WeekStartDate DESC) - 1))
                OVER (PARTITION BY TeamID ORDER BY WeekStartDate ROWS UNBOUNDED PRECEDING), 0
            ) AS SES_Alpha07
    FROM WeeklyData
),
DoubleExponentialSmoothing AS (
    -- Double Exponential Smoothing (Holt's method) - Level and Trend
    SELECT 
        *,
        -- Level component (alpha = 0.3)
        SES_Alpha03 AS Level_Holt,
        
        -- Trend component approximation using differences
        (SES_Alpha03 - LAG(SES_Alpha03, 1) OVER (PARTITION BY TeamID ORDER BY WeekStartDate)) * 0.2 +
        LAG(SES_Alpha03 - LAG(SES_Alpha03, 1) OVER (PARTITION BY TeamID ORDER BY WeekStartDate), 1) 
            OVER (PARTITION BY TeamID ORDER BY WeekStartDate) * 0.8 AS Trend_Holt,
            
        -- Linear trend from regression
        ROW_NUMBER() OVER (PARTITION BY TeamID ORDER BY WeekStartDate) AS TimeIndex
    FROM SimpleExponentialSmoothing
),
TrendParameters AS (
    -- Calculate trend parameters for Holt's method
    SELECT 
        TeamID,
        (COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * WeeklyReferrals) - 
         SUM(CAST(TimeIndex AS FLOAT)) * SUM(WeeklyReferrals)) /
        NULLIF(COUNT(*) * SUM(CAST(TimeIndex AS FLOAT) * CAST(TimeIndex AS FLOAT)) - 
         POWER(SUM(CAST(TimeIndex AS FLOAT)), 2), 0) AS Beta_Trend
    FROM DoubleExponentialSmoothing
    GROUP BY TeamID
),
HoltWithTrend AS (
    -- Combine level and trend for Holt's forecast
    SELECT 
        des.*,
        tp.Beta_Trend,
        des.Level_Holt + ISNULL(des.Trend_Holt, tp.Beta_Trend) AS Holt_Forecast_1,
        des.Level_Holt + 2 * ISNULL(des.Trend_Holt, tp.Beta_Trend) AS Holt_Forecast_2,
        des.Level_Holt + 4 * ISNULL(des.Trend_Holt, tp.Beta_Trend) AS Holt_Forecast_4
    FROM DoubleExponentialSmoothing des
    LEFT JOIN TrendParameters tp ON des.TeamID = tp.TeamID
),
SeasonalFactors AS (
    -- Calculate seasonal factors for Holt-Winters
    SELECT 
        TeamID,
        WeekNum,
        AVG(WeeklyReferrals) AS AvgWeeklyValue,
        AVG(WeeklyReferrals) / NULLIF(AVG(AVG(WeeklyReferrals)) OVER (PARTITION BY TeamID), 0) AS SeasonalFactor,
        STDEV(WeeklyReferrals) AS StDevWeekly
    FROM WeeklyData
    GROUP BY TeamID, WeekNum
),
HoltWinters AS (
    -- Triple Exponential Smoothing (Holt-Winters) - Level, Trend, and Seasonal
    SELECT 
        hwt.*,
        sf.SeasonalFactor,
        
        -- Multiplicative Holt-Winters
        hwt.Level_Holt * ISNULL(sf.SeasonalFactor, 1) AS HW_Level,
        hwt.Level_Holt * ISNULL(sf.SeasonalFactor, 1) + hwt.Trend_Holt AS HW_Multiplicative_1,
        (hwt.Level_Holt + 2 * hwt.Trend_Holt) * ISNULL(sf.SeasonalFactor, 1) AS HW_Multiplicative_2,
        (hwt.Level_Holt + 4 * hwt.Trend_Holt) * ISNULL(sf.SeasonalFactor, 1) AS HW_Multiplicative_4,
        
        -- Additive Holt-Winters
        hwt.Level_Holt + ISNULL(sf.AvgWeeklyValue - AVG(sf.AvgWeeklyValue) OVER (PARTITION BY hwt.TeamID), 0) AS HW_Additive_Level,
        hwt.Level_Holt + hwt.Trend_Holt + 
            ISNULL(sf.AvgWeeklyValue - AVG(sf.AvgWeeklyValue) OVER (PARTITION BY hwt.TeamID), 0) AS HW_Additive_1,
        hwt.Level_Holt + 2 * hwt.Trend_Holt + 
            ISNULL(sf.AvgWeeklyValue - AVG(sf.AvgWeeklyValue) OVER (PARTITION BY hwt.TeamID), 0) AS HW_Additive_2,
        hwt.Level_Holt + 4 * hwt.Trend_Holt + 
            ISNULL(sf.AvgWeeklyValue - AVG(sf.AvgWeeklyValue) OVER (PARTITION BY hwt.TeamID), 0) AS HW_Additive_4,
            
        sf.StDevWeekly
    FROM HoltWithTrend hwt
    LEFT JOIN SeasonalFactors sf ON hwt.TeamID = sf.TeamID AND hwt.WeekNum = sf.WeekNum
),
DampedTrend AS (
    -- Damped trend method (reduces trend over time)
    SELECT 
        *,
        -- Damping parameter phi = 0.95
        Level_Holt + (Trend_Holt * (1 - POWER(0.95, 1))) / (1 - 0.95) AS Damped_Forecast_1,
        Level_Holt + (Trend_Holt * (1 - POWER(0.95, 2))) / (1 - 0.95) AS Damped_Forecast_2,
        Level_Holt + (Trend_Holt * (1 - POWER(0.95, 4))) / (1 - 0.95) AS Damped_Forecast_4,
        Level_Holt + (Trend_Holt * (1 - POWER(0.95, 8))) / (1 - 0.95) AS Damped_Forecast_8
    FROM HoltWinters
),
AdaptiveSmoothing AS (
    -- Adaptive smoothing that adjusts alpha based on error
    SELECT 
        *,
        -- Calculate errors for different alpha values
        ABS(WeeklyReferrals - SES_Alpha03) AS Error_Alpha03,
        ABS(WeeklyReferrals - SES_Alpha05) AS Error_Alpha05,
        ABS(WeeklyReferrals - SES_Alpha07) AS Error_Alpha07,
        
        -- Choose best alpha based on recent performance
        CASE 
            WHEN ABS(WeeklyReferrals - SES_Alpha03) <= ABS(WeeklyReferrals - SES_Alpha05) 
                AND ABS(WeeklyReferrals - SES_Alpha03) <= ABS(WeeklyReferrals - SES_Alpha07) 
            THEN SES_Alpha03
            WHEN ABS(WeeklyReferrals - SES_Alpha05) <= ABS(WeeklyReferrals - SES_Alpha07) 
            THEN SES_Alpha05
            ELSE SES_Alpha07
        END AS Adaptive_ES,
        
        -- Calculate optimal alpha (simplified)
        CASE 
            WHEN STDEV(WeeklyReferrals) OVER (
                PARTITION BY TeamID 
                ORDER BY WeekStartDate 
                ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
            ) > 5 THEN 0.7  -- High volatility, use high alpha
            WHEN STDEV(WeeklyReferrals) OVER (
                PARTITION BY TeamID 
                ORDER BY WeekStartDate 
                ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
            ) < 2 THEN 0.3  -- Low volatility, use low alpha
            ELSE 0.5  -- Medium volatility
        END AS Optimal_Alpha
    FROM DampedTrend
),
ConfidenceIntervals AS (
    -- Calculate prediction intervals
    SELECT 
        *,
        -- Standard error of residuals
        STDEV(WeeklyReferrals - SES_Alpha05) OVER (
            PARTITION BY TeamID 
            ORDER BY WeekStartDate 
            ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
        ) AS StdError,
        
        -- 95% Confidence intervals for forecasts
        -- Lower bounds
        GREATEST(0, HW_Multiplicative_1 - 1.96 * ISNULL(StDevWeekly, 0)) AS HW_Lower_1,
        GREATEST(0, HW_Multiplicative_2 - 1.96 * ISNULL(StDevWeekly, 0) * SQRT(2)) AS HW_Lower_2,
        GREATEST(0, HW_Multiplicative_4 - 1.96 * ISNULL(StDevWeekly, 0) * SQRT(4)) AS HW_Lower_4,
        
        -- Upper bounds
        HW_Multiplicative_1 + 1.96 * ISNULL(StDevWeekly, 0) AS HW_Upper_1,
        HW_Multiplicative_2 + 1.96 * ISNULL(StDevWeekly, 0) * SQRT(2) AS HW_Upper_2,
        HW_Multiplicative_4 + 1.96 * ISNULL(StDevWeekly, 0) * SQRT(4) AS HW_Upper_4
        
    FROM AdaptiveSmoothing
)
SELECT 
    TeamID,
    TeamName,
    AreaID,
    Year,
    WeekNum,
    WeekStartDate,
    WeeklyReferrals AS Actual,
    WeeklyNewClients,
    WeeklyActivities,
    
    -- Simple Exponential Smoothing
    ROUND(SES_Alpha03, 2) AS SES_Conservative,
    ROUND(SES_Alpha05, 2) AS SES_Balanced,
    ROUND(SES_Alpha07, 2) AS SES_Responsive,
    ROUND(Adaptive_ES, 2) AS SES_Adaptive,
    
    -- Double Exponential Smoothing (Holt)
    ROUND(Level_Holt, 2) AS Holt_Level,
    ROUND(Trend_Holt, 2) AS Holt_Trend,
    ROUND(Holt_Forecast_1, 2) AS Holt_1Week,
    ROUND(Holt_Forecast_2, 2) AS Holt_2Week,
    ROUND(Holt_Forecast_4, 2) AS Holt_4Week,
    
    -- Triple Exponential Smoothing (Holt-Winters)
    ROUND(SeasonalFactor, 3) AS Seasonal_Factor,
    ROUND(HW_Multiplicative_1, 2) AS HoltWinters_1Week,
    ROUND(HW_Multiplicative_2, 2) AS HoltWinters_2Week,
    ROUND(HW_Multiplicative_4, 2) AS HoltWinters_4Week,
    
    -- Damped Trend
    ROUND(Damped_Forecast_1, 2) AS Damped_1Week,
    ROUND(Damped_Forecast_2, 2) AS Damped_2Week,
    ROUND(Damped_Forecast_4, 2) AS Damped_4Week,
    
    -- Confidence Intervals
    ROUND(HW_Lower_1, 2) AS Forecast_Lower_1Week,
    ROUND(HW_Upper_1, 2) AS Forecast_Upper_1Week,
    ROUND(HW_Lower_4, 2) AS Forecast_Lower_4Week,
    ROUND(HW_Upper_4, 2) AS Forecast_Upper_4Week,
    
    -- Error Metrics
    ROUND(Error_Alpha03, 2) AS Error_Conservative,
    ROUND(Error_Alpha05, 2) AS Error_Balanced,
    ROUND(Error_Alpha07, 2) AS Error_Responsive,
    
    -- Model Selection Recommendation
    CASE 
        WHEN ABS(Beta_Trend) < 0.5 AND SeasonalFactor BETWEEN 0.9 AND 1.1 
        THEN 'Simple Exponential'
        WHEN SeasonalFactor NOT BETWEEN 0.8 AND 1.2 
        THEN 'Holt-Winters'
        WHEN ABS(Beta_Trend) > 2 
        THEN 'Damped Trend'
        ELSE 'Holt Method'
    END AS RecommendedModel,
    
    Optimal_Alpha AS SuggestedAlpha
    
FROM ConfidenceIntervals
WHERE WeekStartDate >= DATEADD(WEEK, -52, GETDATE())  -- Last year for display

GO