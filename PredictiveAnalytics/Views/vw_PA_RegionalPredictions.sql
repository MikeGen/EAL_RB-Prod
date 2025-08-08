-- =============================================
-- View: vw_PA_RegionalPredictions
-- Description: Regional analytics and predictions for service planning
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_PA_RegionalPredictions]
AS
WITH RegionalMetrics AS (
    -- Current regional client distribution
    SELECT 
        a.AreaID,
        a.AreaName,
        ar.RegionID,
        r.RegionName,
        COUNT(DISTINCT p.PersonID) AS TotalClients,
        COUNT(DISTINCT CASE 
            WHEN fr.ReferralEndDate IS NULL 
            THEN p.PersonID 
        END) AS ActiveClients,
        AVG(DATEDIFF(YEAR, p.PersonDateOfBirth, GETDATE())) AS AvgClientAge
    FROM dl.FactAddress fa
    INNER JOIN dl.DimPerson p ON fa.EntityID = p.PersonID AND fa.AddressEntityType = 'Person'
    INNER JOIN dl.DimArea a ON fa.CountryID = a.AreaID  -- Assuming area mapping through address
    LEFT JOIN dl.DimRegion r ON a.AreaParentID = r.RegionID
    LEFT JOIN dl.FactReferral fr ON p.PersonID = fr.PersonID 
        AND fr.ReferralReferralType = 'InboundReferral'
    LEFT JOIN dl.DimArea ar ON fa.CountryID = ar.AreaID
    WHERE fa.AddressIsPrimaryAddress = 1
    GROUP BY 
        a.AreaID,
        a.AreaName,
        ar.RegionID,
        r.RegionName
),
RegionalGrowth AS (
    -- Calculate growth trends by region
    SELECT 
        t.AreaID,
        YEAR(r.ReferralReceivedDate) AS Year,
        MONTH(r.ReferralReceivedDate) AS Month,
        COUNT(DISTINCT r.ReferralID) AS MonthlyReferrals,
        COUNT(DISTINCT r.PersonID) AS NewClients
    FROM dl.FactReferral r
    INNER JOIN dl.DimTeam t ON r.TeamID = t.TeamID
    WHERE r.ReferralReferralType = 'InboundReferral'
        AND r.ReferralReceivedDate >= DATEADD(YEAR, -2, GETDATE())
    GROUP BY 
        t.AreaID,
        YEAR(r.ReferralReceivedDate),
        MONTH(r.ReferralReceivedDate)
),
ServiceIntensityByRegion AS (
    -- Service intensity metrics by region
    SELECT 
        t.AreaID,
        COUNT(DISTINCT a.ActivityID) AS TotalActivities,
        COUNT(DISTINCT ap.EntityID) AS UniqueClientsServed,
        SUM(DATEDIFF(HOUR, a.ActivityStartDate, a.ActivityEndDate)) AS TotalServiceHours,
        AVG(DATEDIFF(HOUR, a.ActivityStartDate, a.ActivityEndDate)) AS AvgActivityDuration
    FROM dl.FactActivity a
    INNER JOIN dl.DimTeam t ON a.TeamID = t.TeamID
    INNER JOIN dl.FactActivityParticipant ap ON a.ActivityID = ap.ActivityID
    WHERE ap.ActivityParticipantEntityType = 'Person'
        AND a.ActivityStartDate >= DATEADD(MONTH, -3, GETDATE())
    GROUP BY t.AreaID
),
TeamCapacityByRegion AS (
    -- Aggregate team capacity by region
    SELECT 
        AreaID,
        COUNT(DISTINCT TeamID) AS TeamCount,
        SUM(TeamCapacity) AS TotalCapacity,
        COUNT(DISTINCT CASE 
            WHEN TeamIsEmploymentTeam = 1 
            THEN TeamID 
        END) AS EmploymentTeams,
        COUNT(DISTINCT CASE 
            WHEN TeamIsFosterCarerTeam = 1 
            THEN TeamID 
        END) AS FosterCareTeams
    FROM dl.DimTeam
    WHERE TeamEndDate IS NULL OR TeamEndDate > GETDATE()
    GROUP BY AreaID
),
IncidentRatesByRegion AS (
    -- Calculate incident rates by region
    SELECT 
        t.AreaID,
        COUNT(DISTINCT i.IncidentID) AS TotalIncidents6Months,
        COUNT(DISTINCT ip.PersonID) AS ClientsWithIncidents,
        AVG(isev.IncidentSeverityScore) AS AvgSeverityScore
    FROM dl.FactIncident i
    INNER JOIN dl.DimTeam t ON i.TeamID = t.TeamID
    INNER JOIN dl.FactIncidentPerson ip ON i.IncidentID = ip.IncidentID
    LEFT JOIN dl.DimIncidentSeverity isev ON i.CurrentIncidentStatusTypeID = isev.IncidentSeverityID
    WHERE i.IncidentDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY t.AreaID
),
OutcomeMetrics AS (
    -- Regional outcome success rates
    SELECT 
        t.AreaID,
        COUNT(DISTINCT r.ReferralID) AS CompletedReferrals,
        SUM(CASE 
            WHEN rst.ReferralStatusTypeCode = 'Discharged' 
                AND DATEDIFF(DAY, r.ReferralReceivedDate, rs.ReferralStatusStartDate) <= 180 
            THEN 1 ELSE 0 
        END) AS SuccessfulCompletions6Months,
        AVG(DATEDIFF(DAY, r.ReferralReceivedDate, rs.ReferralStatusStartDate)) AS AvgLengthOfStay
    FROM dl.FactReferral r
    INNER JOIN dl.DimTeam t ON r.TeamID = t.TeamID
    INNER JOIN dl.FactReferralStatus rs ON r.ReferralID = rs.ReferralID
    INNER JOIN dl.DimReferralStatusType rst ON rs.ReferralStatusTypeID = rst.ReferralStatusTypeID
    WHERE rst.ReferralStatusTypeCode IN ('Discharged', 'Completed')
        AND rs.ReferralStatusStartDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY t.AreaID
),
GrowthTrends AS (
    -- Calculate growth trends for predictions
    SELECT 
        AreaID,
        AVG(MonthlyReferrals) AS AvgMonthlyReferrals,
        MAX(MonthlyReferrals) AS MaxMonthlyReferrals,
        MIN(MonthlyReferrals) AS MinMonthlyReferrals,
        -- Simple linear regression slope (trend)
        (COUNT(*) * SUM(CAST(Year * 12 + Month AS FLOAT) * MonthlyReferrals) - 
         SUM(CAST(Year * 12 + Month AS FLOAT)) * SUM(MonthlyReferrals)) /
        NULLIF(COUNT(*) * SUM(POWER(CAST(Year * 12 + Month AS FLOAT), 2)) - 
         POWER(SUM(CAST(Year * 12 + Month AS FLOAT)), 2), 0) AS GrowthTrend
    FROM RegionalGrowth
    GROUP BY AreaID
)
SELECT 
    rm.AreaID,
    rm.AreaName,
    rm.RegionID,
    rm.RegionName,
    
    -- Current State Metrics
    rm.TotalClients,
    rm.ActiveClients,
    rm.AvgClientAge,
    CASE 
        WHEN rm.TotalClients > 0 
        THEN (rm.ActiveClients * 100.0) / rm.TotalClients 
        ELSE 0 
    END AS ActiveClientPercentage,
    
    -- Service Delivery Metrics
    ISNULL(si.TotalActivities, 0) AS RecentActivities3Months,
    ISNULL(si.TotalServiceHours, 0) AS TotalServiceHours3Months,
    CASE 
        WHEN si.UniqueClientsServed > 0 
        THEN si.TotalServiceHours / si.UniqueClientsServed 
        ELSE 0 
    END AS AvgHoursPerClient,
    ISNULL(si.AvgActivityDuration, 0) AS AvgActivityDurationHours,
    
    -- Capacity Metrics
    tc.TeamCount,
    tc.TotalCapacity,
    CASE 
        WHEN tc.TotalCapacity > 0 
        THEN (rm.ActiveClients * 100.0) / tc.TotalCapacity 
        ELSE NULL 
    END AS CapacityUtilization,
    tc.EmploymentTeams,
    tc.FosterCareTeams,
    
    -- Risk Indicators
    ISNULL(ir.TotalIncidents6Months, 0) AS RecentIncidents,
    CASE 
        WHEN rm.ActiveClients > 0 
        THEN (ir.TotalIncidents6Months * 100.0) / rm.ActiveClients 
        ELSE 0 
    END AS IncidentRate,
    ISNULL(ir.AvgSeverityScore, 0) AS AvgIncidentSeverity,
    
    -- Outcome Metrics
    ISNULL(om.SuccessfulCompletions6Months, 0) AS SuccessfulCompletions,
    CASE 
        WHEN om.CompletedReferrals > 0 
        THEN (om.SuccessfulCompletions6Months * 100.0) / om.CompletedReferrals 
        ELSE 0 
    END AS SuccessRate,
    ISNULL(om.AvgLengthOfStay, 0) AS AvgLengthOfStayDays,
    
    -- Growth Predictions
    gt.AvgMonthlyReferrals,
    gt.GrowthTrend,
    -- Simple forecast for next quarter
    gt.AvgMonthlyReferrals + (ISNULL(gt.GrowthTrend, 0) * 3) AS PredictedReferralsNextQuarter,
    
    -- Demand Indicators
    CASE 
        WHEN tc.TotalCapacity > 0 AND gt.AvgMonthlyReferrals > 0
        THEN ((gt.AvgMonthlyReferrals + (ISNULL(gt.GrowthTrend, 0) * 3)) * 100.0) / tc.TotalCapacity
        ELSE NULL
    END AS PredictedCapacityUtilizationNextQuarter,
    
    -- Service Need Classification
    CASE 
        WHEN (rm.ActiveClients * 100.0) / NULLIF(tc.TotalCapacity, 0) > 90 
            OR gt.GrowthTrend > 5 
        THEN 'High Demand - Expansion Needed'
        WHEN (rm.ActiveClients * 100.0) / NULLIF(tc.TotalCapacity, 0) > 70 
        THEN 'Moderate Demand - Monitor Closely'
        WHEN (rm.ActiveClients * 100.0) / NULLIF(tc.TotalCapacity, 0) < 50 
        THEN 'Low Utilization - Review Service Model'
        ELSE 'Stable'
    END AS ServiceNeedCategory,
    
    -- Priority Score for resource allocation (0-100)
    (
        -- Capacity pressure (40%)
        CASE 
            WHEN tc.TotalCapacity > 0 AND rm.ActiveClients > 0
            THEN LEAST(40, (rm.ActiveClients * 40.0) / tc.TotalCapacity)
            ELSE 0
        END +
        -- Growth trend (30%)
        CASE 
            WHEN gt.GrowthTrend > 10 THEN 30
            WHEN gt.GrowthTrend > 5 THEN 20
            WHEN gt.GrowthTrend > 0 THEN 10
            ELSE 0
        END +
        -- Incident rate (20%)
        CASE 
            WHEN rm.ActiveClients > 0 AND ir.TotalIncidents6Months > 0
            THEN LEAST(20, (ir.TotalIncidents6Months * 20.0) / rm.ActiveClients)
            ELSE 0
        END +
        -- Service intensity (10%)
        CASE 
            WHEN si.UniqueClientsServed > 0 AND si.TotalServiceHours > 0
            THEN LEAST(10, (si.TotalServiceHours / si.UniqueClientsServed) * 2)
            ELSE 0
        END
    ) AS ResourcePriorityScore,
    
    GETDATE() AS AnalysisDate
    
FROM RegionalMetrics rm
LEFT JOIN ServiceIntensityByRegion si ON rm.AreaID = si.AreaID
LEFT JOIN TeamCapacityByRegion tc ON rm.AreaID = tc.AreaID
LEFT JOIN IncidentRatesByRegion ir ON rm.AreaID = ir.AreaID
LEFT JOIN OutcomeMetrics om ON rm.AreaID = om.AreaID
LEFT JOIN GrowthTrends gt ON rm.AreaID = gt.AreaID

GO