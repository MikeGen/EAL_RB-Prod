-- =============================================
-- View: vw_TS_EnsembleForecasting
-- Description: Combines multiple forecasting models using ensemble techniques for improved accuracy
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_TS_EnsembleForecasting]
AS
WITH CurrentForecasts AS (
    -- Gather current forecasts from all models
    SELECT 
        es.TeamID,
        es.TeamName,
        es.AreaID,
        es.WeekStartDate AS ForecastDate,
        es.Actual AS LastActual,
        
        -- Exponential Smoothing Models
        es.SES_Conservative,
        es.SES_Balanced,
        es.SES_Adaptive,
        es.Holt_1Week,
        es.HoltWinters_1Week,
        es.Damped_1Week,
        
        -- Confidence bounds
        es.Forecast_Lower_1Week,
        es.Forecast_Upper_1Week,
        
        -- ARIMA Models
        ar.AR1_Forecast,
        ar.MA1_Forecast,
        ar.ARMA11_Forecast,
        ar.DailyReferrals AS AR_LastActual,
        
        -- Moving averages from data prep
        dp.MA7_Referrals,
        dp.MA28_Referrals,
        dp.MA90_Referrals,
        
        -- Seasonal decomposition
        sd.NextPeriod_Forecast_Additive AS Seasonal_Additive,
        sd.NextPeriod_Forecast_Multiplicative AS Seasonal_Multiplicative,
        sd.Trend + sd.TrendSlope AS Trend_Linear
        
    FROM pbi.vw_TS_ExponentialSmoothing es
    LEFT JOIN pbi.vw_TS_ARIMAComponents ar ON es.TeamID = ar.TeamID 
        AND CAST(ar.DateValue AS DATE) = CAST(es.WeekStartDate AS DATE)
    LEFT JOIN pbi.vw_TS_DataPreparation dp ON es.TeamID = dp.TeamID 
        AND CAST(dp.DateValue AS DATE) = CAST(es.WeekStartDate AS DATE)
    LEFT JOIN pbi.vw_TS_SeasonalDecomposition sd ON es.TeamID = sd.TeamID 
        AND YEAR(es.WeekStartDate) = sd.Year 
        AND MONTH(es.WeekStartDate) = sd.Month
    WHERE es.WeekStartDate >= DATEADD(WEEK, -12, GETDATE())
),
ModelWeights AS (
    -- Get model weights based on recent accuracy
    SELECT 
        TeamID,
        
        -- Inverse error weighting (better models get higher weights)
        1.0 / NULLIF(MAE_SimpleExp, 0) AS Weight_SES,
        1.0 / NULLIF(MAE_HoltWinters, 0) AS Weight_HW,
        1.0 / NULLIF(MAE_ARMA, 0) AS Weight_ARMA,
        
        -- Normalized weights (sum to 1)
        (1.0 / NULLIF(MAE_SimpleExp, 0)) / 
            NULLIF((1.0 / NULLIF(MAE_SimpleExp, 0)) + 
                   (1.0 / NULLIF(MAE_HoltWinters, 0)) + 
                   (1.0 / NULLIF(MAE_ARMA, 0)), 0) AS NormWeight_SES,
                   
        (1.0 / NULLIF(MAE_HoltWinters, 0)) / 
            NULLIF((1.0 / NULLIF(MAE_SimpleExp, 0)) + 
                   (1.0 / NULLIF(MAE_HoltWinters, 0)) + 
                   (1.0 / NULLIF(MAE_ARMA, 0)), 0) AS NormWeight_HW,
                   
        (1.0 / NULLIF(MAE_ARMA, 0)) / 
            NULLIF((1.0 / NULLIF(MAE_SimpleExp, 0)) + 
                   (1.0 / NULLIF(MAE_HoltWinters, 0)) + 
                   (1.0 / NULLIF(MAE_ARMA, 0)), 0) AS NormWeight_ARMA,
        
        -- Rank-based weights
        CASE Rank_SimpleExp 
            WHEN 1 THEN 0.5 
            WHEN 2 THEN 0.3 
            WHEN 3 THEN 0.2 
            ELSE 0.1 
        END AS RankWeight_SES,
        
        CASE Rank_HoltWinters 
            WHEN 1 THEN 0.5 
            WHEN 2 THEN 0.3 
            WHEN 3 THEN 0.2 
            ELSE 0.1 
        END AS RankWeight_HW,
        
        -- Accuracy scores for weighting
        MAE_SimpleExp,
        MAE_HoltWinters,
        MAE_ARMA,
        DirectionalAccuracy_SimpleExp,
        DirectionalAccuracy_HoltWinters
        
    FROM pbi.vw_TS_ForecastAccuracy
),
EnsembleCalculations AS (
    -- Calculate various ensemble forecasts
    SELECT 
        cf.*,
        mw.NormWeight_SES,
        mw.NormWeight_HW,
        mw.NormWeight_ARMA,
        
        -- Simple Average (Equal weights)
        (ISNULL(cf.SES_Balanced, 0) + 
         ISNULL(cf.HoltWinters_1Week, 0) + 
         ISNULL(cf.ARMA11_Forecast, 0)) / 
        NULLIF(
            CASE WHEN cf.SES_Balanced IS NOT NULL THEN 1 ELSE 0 END +
            CASE WHEN cf.HoltWinters_1Week IS NOT NULL THEN 1 ELSE 0 END +
            CASE WHEN cf.ARMA11_Forecast IS NOT NULL THEN 1 ELSE 0 END, 0
        ) AS Ensemble_SimpleAverage,
        
        -- Weighted Average (using accuracy weights)
        ISNULL(cf.SES_Balanced * mw.NormWeight_SES, 0) +
        ISNULL(cf.HoltWinters_1Week * mw.NormWeight_HW, 0) +
        ISNULL(cf.ARMA11_Forecast * mw.NormWeight_ARMA, 0) AS Ensemble_WeightedAverage,
        
        -- Median forecast (robust to outliers)
        (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY value) 
         FROM (VALUES 
            (cf.SES_Balanced),
            (cf.HoltWinters_1Week),
            (cf.ARMA11_Forecast)
         ) AS v(value)
         WHERE value IS NOT NULL
        ) AS Ensemble_Median,
        
        -- Trimmed Mean (exclude min and max)
        CASE 
            WHEN cf.SES_Balanced IS NOT NULL AND 
                 cf.HoltWinters_1Week IS NOT NULL AND 
                 cf.ARMA11_Forecast IS NOT NULL
            THEN (cf.SES_Balanced + cf.HoltWinters_1Week + cf.ARMA11_Forecast - 
                  GREATEST(cf.SES_Balanced, cf.HoltWinters_1Week, cf.ARMA11_Forecast) - 
                  LEAST(cf.SES_Balanced, cf.HoltWinters_1Week, cf.ARMA11_Forecast))
            ELSE (ISNULL(cf.SES_Balanced, 0) + ISNULL(cf.HoltWinters_1Week, 0)) / 2
        END AS Ensemble_TrimmedMean,
        
        -- Bayesian Model Average (simplified)
        CASE 
            WHEN mw.DirectionalAccuracy_SimpleExp > 60 AND mw.DirectionalAccuracy_HoltWinters > 60
            THEN (cf.SES_Balanced * (mw.DirectionalAccuracy_SimpleExp / 100.0) + 
                  cf.HoltWinters_1Week * (mw.DirectionalAccuracy_HoltWinters / 100.0)) /
                 ((mw.DirectionalAccuracy_SimpleExp / 100.0) + (mw.DirectionalAccuracy_HoltWinters / 100.0))
            ELSE (ISNULL(cf.SES_Balanced, 0) + ISNULL(cf.HoltWinters_1Week, 0)) / 2
        END AS Ensemble_Bayesian,
        
        -- Optimal combination (minimize historical error)
        ISNULL(cf.SES_Balanced, 0) * 
            CASE WHEN mw.MAE_SimpleExp <= mw.MAE_HoltWinters AND mw.MAE_SimpleExp <= mw.MAE_ARMA THEN 0.6 ELSE 0.2 END +
        ISNULL(cf.HoltWinters_1Week, 0) * 
            CASE WHEN mw.MAE_HoltWinters <= mw.MAE_SimpleExp AND mw.MAE_HoltWinters <= mw.MAE_ARMA THEN 0.6 ELSE 0.2 END +
        ISNULL(cf.ARMA11_Forecast, 0) * 
            CASE WHEN mw.MAE_ARMA <= mw.MAE_SimpleExp AND mw.MAE_ARMA <= mw.MAE_HoltWinters THEN 0.6 ELSE 0.2 END 
            AS Ensemble_Optimal,
            
        -- Conservative forecast (use most conservative model)
        LEAST(
            ISNULL(cf.SES_Conservative, cf.LastActual),
            ISNULL(cf.Damped_1Week, cf.LastActual),
            ISNULL(cf.MA28_Referrals, cf.LastActual)
        ) AS Ensemble_Conservative,
        
        -- Aggressive forecast (use most optimistic model)
        GREATEST(
            ISNULL(cf.HoltWinters_1Week, 0),
            ISNULL(cf.Holt_1Week, 0),
            ISNULL(cf.Seasonal_Multiplicative, 0)
        ) AS Ensemble_Aggressive
        
    FROM CurrentForecasts cf
    LEFT JOIN ModelWeights mw ON cf.TeamID = mw.TeamID
),
ConfidenceIntervals AS (
    -- Calculate ensemble confidence intervals
    SELECT 
        *,
        
        -- Standard deviation across models
        SQRT(
            POWER(ISNULL(SES_Balanced - Ensemble_WeightedAverage, 0), 2) * ISNULL(NormWeight_SES, 0.33) +
            POWER(ISNULL(HoltWinters_1Week - Ensemble_WeightedAverage, 0), 2) * ISNULL(NormWeight_HW, 0.33) +
            POWER(ISNULL(ARMA11_Forecast - Ensemble_WeightedAverage, 0), 2) * ISNULL(NormWeight_ARMA, 0.34)
        ) AS Ensemble_StDev,
        
        -- Model agreement score (0-100)
        CASE 
            WHEN STDEV(v.value) IS NOT NULL AND AVG(v.value) > 0
            THEN 100 * (1 - STDEV(v.value) / AVG(v.value))
            ELSE 50
        END AS ModelAgreement
        
    FROM EnsembleCalculations
    CROSS APPLY (
        SELECT value FROM (VALUES 
            (SES_Balanced),
            (HoltWinters_1Week),
            (ARMA11_Forecast)
        ) AS t(value)
        WHERE value IS NOT NULL
    ) AS v
    GROUP BY 
        TeamID, TeamName, AreaID, ForecastDate, LastActual,
        SES_Conservative, SES_Balanced, SES_Adaptive, Holt_1Week,
        HoltWinters_1Week, Damped_1Week, Forecast_Lower_1Week,
        Forecast_Upper_1Week, AR1_Forecast, MA1_Forecast,
        ARMA11_Forecast, AR_LastActual, MA7_Referrals,
        MA28_Referrals, MA90_Referrals, Seasonal_Additive,
        Seasonal_Multiplicative, Trend_Linear, NormWeight_SES,
        NormWeight_HW, NormWeight_ARMA, Ensemble_SimpleAverage,
        Ensemble_WeightedAverage, Ensemble_Median, Ensemble_TrimmedMean,
        Ensemble_Bayesian, Ensemble_Optimal, Ensemble_Conservative,
        Ensemble_Aggressive
),
FinalEnsemble AS (
    -- Final ensemble predictions with confidence intervals
    SELECT 
        TeamID,
        TeamName,
        AreaID,
        ForecastDate,
        LastActual,
        
        -- Individual model forecasts
        ROUND(SES_Balanced, 2) AS Model_SimpleExp,
        ROUND(HoltWinters_1Week, 2) AS Model_HoltWinters,
        ROUND(ARMA11_Forecast, 2) AS Model_ARMA,
        ROUND(MA28_Referrals, 2) AS Model_MovingAvg,
        
        -- Ensemble forecasts
        ROUND(Ensemble_SimpleAverage, 2) AS Ensemble_Simple,
        ROUND(Ensemble_WeightedAverage, 2) AS Ensemble_Weighted,
        ROUND(Ensemble_Median, 2) AS Ensemble_Median,
        ROUND(Ensemble_Optimal, 2) AS Ensemble_Optimal,
        
        -- Selected ensemble (based on historical performance)
        ROUND(Ensemble_WeightedAverage, 2) AS Ensemble_Primary,
        
        -- Confidence intervals (95%)
        GREATEST(0, ROUND(Ensemble_WeightedAverage - 1.96 * Ensemble_StDev, 2)) AS Ensemble_Lower95,
        ROUND(Ensemble_WeightedAverage + 1.96 * Ensemble_StDev, 2) AS Ensemble_Upper95,
        
        -- Confidence intervals (80%)
        GREATEST(0, ROUND(Ensemble_WeightedAverage - 1.28 * Ensemble_StDev, 2)) AS Ensemble_Lower80,
        ROUND(Ensemble_WeightedAverage + 1.28 * Ensemble_StDev, 2) AS Ensemble_Upper80,
        
        -- Prediction ranges
        ROUND(Ensemble_Conservative, 2) AS Forecast_Conservative,
        ROUND(Ensemble_Aggressive, 2) AS Forecast_Aggressive,
        
        -- Model weights used
        ROUND(NormWeight_SES * 100, 1) AS Weight_SimpleExp_Pct,
        ROUND(NormWeight_HW * 100, 1) AS Weight_HoltWinters_Pct,
        ROUND(NormWeight_ARMA * 100, 1) AS Weight_ARMA_Pct,
        
        -- Confidence metrics
        ROUND(ModelAgreement, 1) AS ModelAgreement_Pct,
        CASE 
            WHEN ModelAgreement > 80 THEN 'High'
            WHEN ModelAgreement > 60 THEN 'Medium'
            ELSE 'Low'
        END AS PredictionConfidence,
        
        -- Forecast interpretation
        CASE 
            WHEN Ensemble_WeightedAverage > LastActual * 1.2 THEN 'Significant Increase'
            WHEN Ensemble_WeightedAverage > LastActual * 1.05 THEN 'Moderate Increase'
            WHEN Ensemble_WeightedAverage < LastActual * 0.8 THEN 'Significant Decrease'
            WHEN Ensemble_WeightedAverage < LastActual * 0.95 THEN 'Moderate Decrease'
            ELSE 'Stable'
        END AS TrendDirection,
        
        -- Alert flags
        CASE 
            WHEN ModelAgreement < 50 THEN 'Model Disagreement - Review Required'
            WHEN Ensemble_WeightedAverage > Ensemble_Upper95 THEN 'Forecast Exceeds Normal Range'
            WHEN Ensemble_WeightedAverage < Ensemble_Lower95 THEN 'Forecast Below Normal Range'
            ELSE 'Normal'
        END AS AlertStatus,
        
        GETDATE() AS ForecastGeneratedDate
        
    FROM ConfidenceIntervals
)
SELECT 
    *,
    
    -- Additional business context
    DATEPART(WEEK, ForecastDate) AS ForecastWeek,
    DATEPART(MONTH, ForecastDate) AS ForecastMonth,
    DATEPART(QUARTER, ForecastDate) AS ForecastQuarter,
    
    -- Forecast horizon labels
    CASE 
        WHEN DATEDIFF(DAY, GETDATE(), ForecastDate) <= 7 THEN '1 Week Ahead'
        WHEN DATEDIFF(DAY, GETDATE(), ForecastDate) <= 14 THEN '2 Weeks Ahead'
        WHEN DATEDIFF(DAY, GETDATE(), ForecastDate) <= 30 THEN '1 Month Ahead'
        ELSE 'Long Term'
    END AS ForecastHorizon
    
FROM FinalEnsemble
WHERE ForecastDate >= GETDATE()  -- Only future forecasts

GO