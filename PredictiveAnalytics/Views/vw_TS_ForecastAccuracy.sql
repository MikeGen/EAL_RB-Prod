-- =============================================
-- View: vw_TS_ForecastAccuracy
-- Description: Calculates forecast accuracy metrics for model evaluation and selection
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_TS_ForecastAccuracy]
AS
WITH HistoricalForecasts AS (
    -- Get historical forecasts from different models
    SELECT 
        es.TeamID,
        es.TeamName,
        es.WeekStartDate,
        es.Actual AS ActualValue,
        
        -- Exponential Smoothing forecasts
        LAG(es.SES_Conservative, 1) OVER (PARTITION BY es.TeamID ORDER BY es.WeekStartDate) AS SES_Forecast,
        LAG(es.Holt_1Week, 1) OVER (PARTITION BY es.TeamID ORDER BY es.WeekStartDate) AS Holt_Forecast,
        LAG(es.HoltWinters_1Week, 1) OVER (PARTITION BY es.TeamID ORDER BY es.WeekStartDate) AS HW_Forecast,
        LAG(es.Damped_1Week, 1) OVER (PARTITION BY es.TeamID ORDER BY es.WeekStartDate) AS Damped_Forecast,
        
        -- ARIMA forecasts
        LAG(ar.AR1_Forecast, 7) OVER (PARTITION BY ar.TeamID ORDER BY ar.DateValue) AS AR1_Forecast,
        LAG(ar.MA1_Forecast, 7) OVER (PARTITION BY ar.TeamID ORDER BY ar.DateValue) AS MA1_Forecast,
        LAG(ar.ARMA11_Forecast, 7) OVER (PARTITION BY ar.TeamID ORDER BY ar.DateValue) AS ARMA_Forecast,
        
        -- Seasonal decomposition forecast
        LAG(sd.NextPeriod_Forecast_Multiplicative, 1) OVER (PARTITION BY sd.TeamID ORDER BY sd.MonthDate) AS Seasonal_Forecast,
        
        -- Simple benchmarks
        LAG(es.Actual, 1) OVER (PARTITION BY es.TeamID ORDER BY es.WeekStartDate) AS Naive_Forecast,
        AVG(es.Actual) OVER (
            PARTITION BY es.TeamID 
            ORDER BY es.WeekStartDate 
            ROWS BETWEEN 5 PRECEDING AND 2 PRECEDING
        ) AS MovingAvg_Forecast
        
    FROM pbi.vw_TS_ExponentialSmoothing es
    LEFT JOIN pbi.vw_TS_ARIMAComponents ar ON es.TeamID = ar.TeamID 
        AND CAST(ar.DateValue AS DATE) = CAST(es.WeekStartDate AS DATE)
    LEFT JOIN pbi.vw_TS_SeasonalDecomposition sd ON es.TeamID = sd.TeamID 
        AND YEAR(es.WeekStartDate) = sd.Year 
        AND MONTH(es.WeekStartDate) = sd.Month
),
ForecastErrors AS (
    -- Calculate errors for each forecasting method
    SELECT 
        *,
        
        -- Absolute errors
        ABS(ActualValue - ISNULL(SES_Forecast, ActualValue)) AS AE_SES,
        ABS(ActualValue - ISNULL(Holt_Forecast, ActualValue)) AS AE_Holt,
        ABS(ActualValue - ISNULL(HW_Forecast, ActualValue)) AS AE_HW,
        ABS(ActualValue - ISNULL(Damped_Forecast, ActualValue)) AS AE_Damped,
        ABS(ActualValue - ISNULL(AR1_Forecast, ActualValue)) AS AE_AR1,
        ABS(ActualValue - ISNULL(ARMA_Forecast, ActualValue)) AS AE_ARMA,
        ABS(ActualValue - ISNULL(Naive_Forecast, ActualValue)) AS AE_Naive,
        ABS(ActualValue - ISNULL(MovingAvg_Forecast, ActualValue)) AS AE_MA,
        
        -- Squared errors
        POWER(ActualValue - ISNULL(SES_Forecast, ActualValue), 2) AS SE_SES,
        POWER(ActualValue - ISNULL(Holt_Forecast, ActualValue), 2) AS SE_Holt,
        POWER(ActualValue - ISNULL(HW_Forecast, ActualValue), 2) AS SE_HW,
        POWER(ActualValue - ISNULL(Damped_Forecast, ActualValue), 2) AS SE_Damped,
        POWER(ActualValue - ISNULL(AR1_Forecast, ActualValue), 2) AS SE_AR1,
        POWER(ActualValue - ISNULL(ARMA_Forecast, ActualValue), 2) AS SE_ARMA,
        POWER(ActualValue - ISNULL(Naive_Forecast, ActualValue), 2) AS SE_Naive,
        POWER(ActualValue - ISNULL(MovingAvg_Forecast, ActualValue), 2) AS SE_MA,
        
        -- Percentage errors (avoiding division by zero)
        CASE 
            WHEN ActualValue > 0 
            THEN ABS((ActualValue - ISNULL(SES_Forecast, ActualValue)) * 100.0 / ActualValue)
            ELSE NULL 
        END AS APE_SES,
        CASE 
            WHEN ActualValue > 0 
            THEN ABS((ActualValue - ISNULL(Holt_Forecast, ActualValue)) * 100.0 / ActualValue)
            ELSE NULL 
        END AS APE_Holt,
        CASE 
            WHEN ActualValue > 0 
            THEN ABS((ActualValue - ISNULL(HW_Forecast, ActualValue)) * 100.0 / ActualValue)
            ELSE NULL 
        END AS APE_HW,
        CASE 
            WHEN ActualValue > 0 
            THEN ABS((ActualValue - ISNULL(Naive_Forecast, ActualValue)) * 100.0 / ActualValue)
            ELSE NULL 
        END AS APE_Naive,
        
        -- Directional accuracy (1 if direction correct, 0 otherwise)
        CASE 
            WHEN SIGN(SES_Forecast - LAG(ActualValue, 1) OVER (PARTITION BY TeamID ORDER BY WeekStartDate)) = 
                 SIGN(ActualValue - LAG(ActualValue, 1) OVER (PARTITION BY TeamID ORDER BY WeekStartDate))
            THEN 1 ELSE 0 
        END AS DA_SES,
        CASE 
            WHEN SIGN(HW_Forecast - LAG(ActualValue, 1) OVER (PARTITION BY TeamID ORDER BY WeekStartDate)) = 
                 SIGN(ActualValue - LAG(ActualValue, 1) OVER (PARTITION BY TeamID ORDER BY WeekStartDate))
            THEN 1 ELSE 0 
        END AS DA_HW
        
    FROM HistoricalForecasts
    WHERE ActualValue IS NOT NULL
),
AggregatedMetrics AS (
    -- Aggregate error metrics by team and model
    SELECT 
        TeamID,
        TeamName,
        COUNT(*) AS ForecastCount,
        
        -- Mean Absolute Error (MAE)
        AVG(AE_SES) AS MAE_SES,
        AVG(AE_Holt) AS MAE_Holt,
        AVG(AE_HW) AS MAE_HW,
        AVG(AE_Damped) AS MAE_Damped,
        AVG(AE_AR1) AS MAE_AR1,
        AVG(AE_ARMA) AS MAE_ARMA,
        AVG(AE_Naive) AS MAE_Naive,
        AVG(AE_MA) AS MAE_MovingAvg,
        
        -- Root Mean Squared Error (RMSE)
        SQRT(AVG(SE_SES)) AS RMSE_SES,
        SQRT(AVG(SE_Holt)) AS RMSE_Holt,
        SQRT(AVG(SE_HW)) AS RMSE_HW,
        SQRT(AVG(SE_Damped)) AS RMSE_Damped,
        SQRT(AVG(SE_AR1)) AS RMSE_AR1,
        SQRT(AVG(SE_ARMA)) AS RMSE_ARMA,
        SQRT(AVG(SE_Naive)) AS RMSE_Naive,
        SQRT(AVG(SE_MA)) AS RMSE_MovingAvg,
        
        -- Mean Absolute Percentage Error (MAPE)
        AVG(APE_SES) AS MAPE_SES,
        AVG(APE_Holt) AS MAPE_Holt,
        AVG(APE_HW) AS MAPE_HW,
        AVG(APE_Naive) AS MAPE_Naive,
        
        -- Directional Accuracy
        AVG(CAST(DA_SES AS FLOAT)) * 100 AS DirectionalAccuracy_SES,
        AVG(CAST(DA_HW AS FLOAT)) * 100 AS DirectionalAccuracy_HW,
        
        -- Median Absolute Error
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY AE_SES) OVER (PARTITION BY TeamID) AS MdAE_SES,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY AE_HW) OVER (PARTITION BY TeamID) AS MdAE_HW
        
    FROM ForecastErrors
    GROUP BY TeamID, TeamName
),
RelativeMetrics AS (
    -- Calculate relative performance metrics
    SELECT 
        *,
        
        -- Mean Absolute Scaled Error (MASE) - relative to naive forecast
        CASE 
            WHEN MAE_Naive > 0 
            THEN MAE_SES / MAE_Naive 
            ELSE NULL 
        END AS MASE_SES,
        CASE 
            WHEN MAE_Naive > 0 
            THEN MAE_HW / MAE_Naive 
            ELSE NULL 
        END AS MASE_HW,
        CASE 
            WHEN MAE_Naive > 0 
            THEN MAE_ARMA / MAE_Naive 
            ELSE NULL 
        END AS MASE_ARMA,
        
        -- Relative RMSE (compared to naive)
        CASE 
            WHEN RMSE_Naive > 0 
            THEN RMSE_SES / RMSE_Naive 
            ELSE NULL 
        END AS RelRMSE_SES,
        CASE 
            WHEN RMSE_Naive > 0 
            THEN RMSE_HW / RMSE_Naive 
            ELSE NULL 
        END AS RelRMSE_HW,
        
        -- Theil's U statistic
        CASE 
            WHEN RMSE_Naive > 0 
            THEN RMSE_HW / RMSE_Naive 
            ELSE NULL 
        END AS TheilU_HW
        
    FROM AggregatedMetrics
),
ModelRanking AS (
    -- Rank models by performance
    SELECT 
        *,
        
        -- Rank by MAE (lower is better)
        RANK() OVER (PARTITION BY TeamID ORDER BY MAE_SES) AS Rank_MAE_SES,
        RANK() OVER (PARTITION BY TeamID ORDER BY MAE_Holt) AS Rank_MAE_Holt,
        RANK() OVER (PARTITION BY TeamID ORDER BY MAE_HW) AS Rank_MAE_HW,
        RANK() OVER (PARTITION BY TeamID ORDER BY MAE_ARMA) AS Rank_MAE_ARMA,
        RANK() OVER (PARTITION BY TeamID ORDER BY MAE_Naive) AS Rank_MAE_Naive,
        
        -- Overall ranking (average of different metrics)
        (RANK() OVER (PARTITION BY TeamID ORDER BY MAE_SES) + 
         RANK() OVER (PARTITION BY TeamID ORDER BY RMSE_SES) + 
         RANK() OVER (PARTITION BY TeamID ORDER BY MAPE_SES)) / 3.0 AS OverallRank_SES,
         
        (RANK() OVER (PARTITION BY TeamID ORDER BY MAE_HW) + 
         RANK() OVER (PARTITION BY TeamID ORDER BY RMSE_HW) + 
         RANK() OVER (PARTITION BY TeamID ORDER BY MAPE_HW)) / 3.0 AS OverallRank_HW
        
    FROM RelativeMetrics
),
TimeVaryingAccuracy AS (
    -- Track accuracy over time to detect model degradation
    SELECT 
        TeamID,
        WeekStartDate,
        
        -- Rolling 4-week accuracy metrics
        AVG(AE_SES) OVER (
            PARTITION BY TeamID 
            ORDER BY WeekStartDate 
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ) AS Rolling4W_MAE_SES,
        
        AVG(AE_HW) OVER (
            PARTITION BY TeamID 
            ORDER BY WeekStartDate 
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ) AS Rolling4W_MAE_HW,
        
        -- Trend in errors (increasing = degrading performance)
        AVG(AE_SES) OVER (
            PARTITION BY TeamID 
            ORDER BY WeekStartDate 
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ) - 
        AVG(AE_SES) OVER (
            PARTITION BY TeamID 
            ORDER BY WeekStartDate 
            ROWS BETWEEN 7 PRECEDING AND 4 PRECEDING
        ) AS ErrorTrend_SES
        
    FROM ForecastErrors
)
SELECT 
    mr.TeamID,
    mr.TeamName,
    mr.ForecastCount AS SampleSize,
    
    -- Best performing model
    CASE 
        WHEN mr.MAE_SES <= mr.MAE_Holt AND mr.MAE_SES <= mr.MAE_HW AND mr.MAE_SES <= mr.MAE_ARMA 
        THEN 'Simple Exponential'
        WHEN mr.MAE_Holt <= mr.MAE_HW AND mr.MAE_Holt <= mr.MAE_ARMA 
        THEN 'Holt Method'
        WHEN mr.MAE_HW <= mr.MAE_ARMA 
        THEN 'Holt-Winters'
        ELSE 'ARMA'
    END AS BestModel_MAE,
    
    -- Accuracy metrics for top models
    ROUND(mr.MAE_SES, 2) AS MAE_SimpleExp,
    ROUND(mr.MAE_HW, 2) AS MAE_HoltWinters,
    ROUND(mr.MAE_ARMA, 2) AS MAE_ARMA,
    ROUND(mr.MAE_Naive, 2) AS MAE_Naive,
    
    ROUND(mr.RMSE_SES, 2) AS RMSE_SimpleExp,
    ROUND(mr.RMSE_HW, 2) AS RMSE_HoltWinters,
    ROUND(mr.RMSE_ARMA, 2) AS RMSE_ARMA,
    
    ROUND(mr.MAPE_SES, 1) AS MAPE_SimpleExp,
    ROUND(mr.MAPE_HW, 1) AS MAPE_HoltWinters,
    
    -- Relative performance
    ROUND(mr.MASE_SES, 3) AS MASE_SimpleExp,
    ROUND(mr.MASE_HW, 3) AS MASE_HoltWinters,
    
    -- Directional accuracy
    ROUND(mr.DirectionalAccuracy_SES, 1) AS DirAccuracy_SimpleExp,
    ROUND(mr.DirectionalAccuracy_HW, 1) AS DirAccuracy_HoltWinters,
    
    -- Model rankings
    mr.Rank_MAE_SES AS Rank_SimpleExp,
    mr.Rank_MAE_HW AS Rank_HoltWinters,
    mr.Rank_MAE_ARMA AS Rank_ARMA,
    
    -- Performance interpretation
    CASE 
        WHEN mr.MAPE_HW < 10 THEN 'Excellent'
        WHEN mr.MAPE_HW < 20 THEN 'Good'
        WHEN mr.MAPE_HW < 30 THEN 'Acceptable'
        ELSE 'Poor'
    END AS ForecastAccuracy,
    
    -- Model recommendation
    CASE 
        WHEN mr.MASE_HW < 1 AND mr.DirectionalAccuracy_HW > 60 THEN 'Use Holt-Winters'
        WHEN mr.MASE_SES < 1 THEN 'Use Simple Exponential'
        WHEN mr.DirectionalAccuracy_HW > 70 THEN 'Use Holt-Winters for Direction'
        WHEN mr.MAE_MovingAvg < mr.MAE_HW THEN 'Use Simple Moving Average'
        ELSE 'Review Model Selection'
    END AS Recommendation,
    
    -- Recent performance trend
    CASE 
        WHEN tv.ErrorTrend_SES > 0 THEN 'Degrading'
        WHEN tv.ErrorTrend_SES < -1 THEN 'Improving'
        ELSE 'Stable'
    END AS PerformanceTrend,
    
    GETDATE() AS EvaluationDate
    
FROM ModelRanking mr
LEFT JOIN (
    SELECT TeamID, MAX(ErrorTrend_SES) AS ErrorTrend_SES
    FROM TimeVaryingAccuracy
    GROUP BY TeamID
) tv ON mr.TeamID = tv.TeamID

GO