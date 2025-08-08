-- =============================================
-- View: vw_PA_ServiceDemandForecast
-- Description: Provides service demand forecasting data with historical trends and predictions
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_PA_ServiceDemandForecast]
AS
WITH HistoricalDemand AS (
    -- Calculate historical monthly demand by team
    SELECT 
        t.TeamID,
        t.TeamName,
        t.AreaID,
        YEAR(r.ReferralReceivedDate) AS Year,
        MONTH(r.ReferralReceivedDate) AS Month,
        COUNT(DISTINCT r.ReferralID) AS ReferralCount,
        COUNT(DISTINCT r.PersonID) AS UniqueClients
    FROM dl.FactReferral r
    INNER JOIN dl.DimTeam t ON r.TeamID = t.TeamID
    WHERE r.ReferralReferralType = 'InboundReferral'
        AND r.ReferralReceivedDate >= DATEADD(YEAR, -3, GETDATE())
    GROUP BY 
        t.TeamID,
        t.TeamName,
        t.AreaID,
        YEAR(r.ReferralReceivedDate),
        MONTH(r.ReferralReceivedDate)
),
MovingAverages AS (
    -- Calculate moving averages for trend analysis
    SELECT 
        TeamID,
        TeamName,
        AreaID,
        Year,
        Month,
        ReferralCount,
        UniqueClients,
        -- 3-month moving average
        AVG(ReferralCount) OVER (
            PARTITION BY TeamID 
            ORDER BY Year, Month 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS MA3_ReferralCount,
        -- 12-month moving average
        AVG(ReferralCount) OVER (
            PARTITION BY TeamID 
            ORDER BY Year, Month 
            ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
        ) AS MA12_ReferralCount,
        -- Year-over-year growth rate
        LAG(ReferralCount, 12) OVER (
            PARTITION BY TeamID 
            ORDER BY Year, Month
        ) AS ReferralCount_PrevYear
    FROM HistoricalDemand
),
SeasonalFactors AS (
    -- Calculate seasonal adjustment factors
    SELECT 
        TeamID,
        Month,
        AVG(ReferralCount) AS AvgMonthlyDemand,
        AVG(ReferralCount) / NULLIF(AVG(AVG(ReferralCount)) OVER (PARTITION BY TeamID), 0) AS SeasonalFactor
    FROM HistoricalDemand
    GROUP BY TeamID, Month
),
ActivityIntensity AS (
    -- Calculate service intensity metrics
    SELECT 
        t.TeamID,
        YEAR(a.ActivityStartDate) AS Year,
        MONTH(a.ActivityStartDate) AS Month,
        COUNT(DISTINCT a.ActivityID) AS TotalActivities,
        COUNT(DISTINCT ap.EntityID) AS ClientsServed,
        SUM(DATEDIFF(HOUR, a.ActivityStartDate, a.ActivityEndDate)) AS TotalServiceHours
    FROM dl.FactActivity a
    INNER JOIN dl.DimTeam t ON a.TeamID = t.TeamID
    INNER JOIN dl.FactActivityParticipant ap ON a.ActivityID = ap.ActivityID
    WHERE ap.ActivityParticipantEntityType = 'Person'
        AND a.ActivityStartDate >= DATEADD(YEAR, -3, GETDATE())
    GROUP BY 
        t.TeamID,
        YEAR(a.ActivityStartDate),
        MONTH(a.ActivityStartDate)
)
SELECT 
    m.TeamID,
    m.TeamName,
    m.AreaID,
    a.AreaName,
    m.Year,
    m.Month,
    DATEFROMPARTS(m.Year, m.Month, 1) AS PeriodDate,
    
    -- Historical metrics
    m.ReferralCount,
    m.UniqueClients,
    m.MA3_ReferralCount,
    m.MA12_ReferralCount,
    
    -- Growth metrics
    CASE 
        WHEN m.ReferralCount_PrevYear > 0 
        THEN ((m.ReferralCount - m.ReferralCount_PrevYear) * 100.0) / m.ReferralCount_PrevYear
        ELSE NULL 
    END AS YoYGrowthRate,
    
    -- Seasonal factors
    sf.SeasonalFactor,
    
    -- Service intensity
    ai.TotalActivities,
    ai.TotalServiceHours,
    CASE 
        WHEN ai.ClientsServed > 0 
        THEN ai.TotalServiceHours * 1.0 / ai.ClientsServed 
        ELSE 0 
    END AS AvgHoursPerClient,
    
    -- Capacity metrics
    t.TeamCapacity,
    CASE 
        WHEN t.TeamCapacity > 0 
        THEN (m.UniqueClients * 100.0) / t.TeamCapacity 
        ELSE NULL 
    END AS CapacityUtilization,
    
    -- Simple linear forecast (next month)
    m.MA12_ReferralCount * sf.SeasonalFactor AS ForecastNextMonth,
    
    -- Forecast confidence (simplified)
    CASE 
        WHEN m.MA12_ReferralCount IS NOT NULL 
        THEN m.MA12_ReferralCount * sf.SeasonalFactor * 0.8  -- Lower bound
        ELSE NULL 
    END AS ForecastLowerBound,
    CASE 
        WHEN m.MA12_ReferralCount IS NOT NULL 
        THEN m.MA12_ReferralCount * sf.SeasonalFactor * 1.2  -- Upper bound
        ELSE NULL 
    END AS ForecastUpperBound
    
FROM MovingAverages m
INNER JOIN dl.DimTeam t ON m.TeamID = t.TeamID
INNER JOIN dl.DimArea a ON m.AreaID = a.AreaID
LEFT JOIN SeasonalFactors sf ON m.TeamID = sf.TeamID AND m.Month = sf.Month
LEFT JOIN ActivityIntensity ai ON m.TeamID = ai.TeamID AND m.Year = ai.Year AND m.Month = ai.Month
WHERE m.Year >= YEAR(DATEADD(YEAR, -2, GETDATE()))  -- Last 2 years for reporting

GO