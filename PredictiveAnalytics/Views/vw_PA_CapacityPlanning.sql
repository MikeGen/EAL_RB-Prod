-- =============================================
-- View: vw_PA_CapacityPlanning
-- Description: Capacity planning view comparing current usage with predicted demand
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_PA_CapacityPlanning]
AS
WITH CurrentCapacity AS (
    -- Current team capacity and utilization
    SELECT 
        t.TeamID,
        t.TeamName,
        t.TeamCode,
        t.AreaID,
        a.AreaName,
        t.TeamFunctionID,
        tf.TeamFunctionName,
        t.TeamCapacity,
        t.TeamIsEmploymentTeam,
        t.TeamIsFosterCarerTeam,
        t.TeamIsAllocatedSupportTimeTeam,
        COUNT(DISTINCT r.PersonID) AS ActiveClients,
        CASE 
            WHEN t.TeamCapacity > 0 
            THEN (COUNT(DISTINCT r.PersonID) * 100.0) / t.TeamCapacity 
            ELSE NULL 
        END AS CurrentUtilization
    FROM dl.DimTeam t
    INNER JOIN dl.DimArea a ON t.AreaID = a.AreaID
    LEFT JOIN dl.DimTeamFunction tf ON t.TeamFunctionID = tf.TeamFunctionID
    LEFT JOIN dl.FactReferral r ON t.TeamID = r.TeamID 
        AND r.ReferralEndDate IS NULL
        AND r.ReferralReferralType = 'InboundReferral'
    WHERE t.TeamEndDate IS NULL OR t.TeamEndDate > GETDATE()
    GROUP BY 
        t.TeamID,
        t.TeamName,
        t.TeamCode,
        t.AreaID,
        a.AreaName,
        t.TeamFunctionID,
        tf.TeamFunctionName,
        t.TeamCapacity,
        t.TeamIsEmploymentTeam,
        t.TeamIsFosterCarerTeam,
        t.TeamIsAllocatedSupportTimeTeam
),
RecentTrends AS (
    -- Calculate recent referral trends
    SELECT 
        r.TeamID,
        COUNT(DISTINCT CASE 
            WHEN r.ReferralReceivedDate >= DATEADD(MONTH, -1, GETDATE()) 
            THEN r.ReferralID 
        END) AS NewReferralsLastMonth,
        COUNT(DISTINCT CASE 
            WHEN r.ReferralReceivedDate >= DATEADD(MONTH, -3, GETDATE()) 
            THEN r.ReferralID 
        END) / 3.0 AS AvgMonthlyReferrals3Months,
        COUNT(DISTINCT CASE 
            WHEN rs.ReferralStatusStartDate >= DATEADD(MONTH, -1, GETDATE()) 
                AND rst.ReferralStatusTypeCode = 'Discharged'
            THEN r.ReferralID 
        END) AS DischargesLastMonth,
        COUNT(DISTINCT CASE 
            WHEN rs.ReferralStatusStartDate >= DATEADD(MONTH, -3, GETDATE()) 
                AND rst.ReferralStatusTypeCode = 'Discharged'
            THEN r.ReferralID 
        END) / 3.0 AS AvgMonthlyDischarges3Months
    FROM dl.FactReferral r
    LEFT JOIN dl.FactReferralStatus rs ON r.ReferralID = rs.ReferralID
    LEFT JOIN dl.DimReferralStatusType rst ON rs.ReferralStatusTypeID = rst.ReferralStatusTypeID
    WHERE r.ReferralReferralType = 'InboundReferral'
    GROUP BY r.TeamID
),
ActivityLoad AS (
    -- Calculate activity workload
    SELECT 
        a.TeamID,
        COUNT(DISTINCT a.ActivityID) AS TotalActivitiesLastMonth,
        SUM(DATEDIFF(HOUR, a.ActivityStartDate, a.ActivityEndDate)) AS TotalActivityHoursLastMonth,
        COUNT(DISTINCT CAST(a.ActivityStartDate AS DATE)) AS ActiveDaysLastMonth,
        COUNT(DISTINCT a.OnBehalfOfUserID) AS ActiveStaffCount
    FROM dl.FactActivity a
    WHERE a.ActivityStartDate >= DATEADD(MONTH, -1, GETDATE())
        AND a.ActivityStartDate < GETDATE()
    GROUP BY a.TeamID
),
SeasonalPatterns AS (
    -- Historical seasonal patterns
    SELECT 
        TeamID,
        MONTH(ReferralReceivedDate) AS Month,
        AVG(CAST(ReferralCount AS FLOAT)) AS AvgMonthlyReferrals,
        STDEV(CAST(ReferralCount AS FLOAT)) AS StdevMonthlyReferrals
    FROM (
        SELECT 
            TeamID,
            ReferralReceivedDate,
            COUNT(*) OVER (
                PARTITION BY TeamID, 
                YEAR(ReferralReceivedDate), 
                MONTH(ReferralReceivedDate)
            ) AS ReferralCount
        FROM dl.FactReferral
        WHERE ReferralReferralType = 'InboundReferral'
            AND ReferralReceivedDate >= DATEADD(YEAR, -2, GETDATE())
    ) monthly_counts
    GROUP BY TeamID, MONTH(ReferralReceivedDate)
),
WaitlistMetrics AS (
    -- Current waitlist status
    SELECT 
        r.TeamID,
        COUNT(DISTINCT r.ReferralID) AS WaitlistCount,
        AVG(DATEDIFF(DAY, r.ReferralReceivedDate, GETDATE())) AS AvgWaitDays,
        MAX(DATEDIFF(DAY, r.ReferralReceivedDate, GETDATE())) AS MaxWaitDays
    FROM dl.FactReferral r
    INNER JOIN dl.DimReferralStatusType rst ON r.CurrentReferralStatusTypeID = rst.ReferralStatusTypeID
    WHERE rst.ReferralStatusTypeCode IN ('Pending', 'Waitlisted')
        AND r.ReferralReferralType = 'InboundReferral'
    GROUP BY r.TeamID
),
FutureDemand AS (
    -- Predict future demand
    SELECT 
        TeamID,
        -- Simple moving average forecast
        AvgMonthlyReferrals3Months AS BaselineDemand,
        -- Seasonal adjustment
        CASE 
            WHEN sp.AvgMonthlyReferrals > 0 
            THEN AvgMonthlyReferrals3Months * (sp.AvgMonthlyReferrals / 
                (SELECT AVG(AvgMonthlyReferrals) FROM SeasonalPatterns WHERE TeamID = rt.TeamID))
            ELSE AvgMonthlyReferrals3Months
        END AS SeasonallyAdjustedDemand,
        -- Growth trend (simple linear)
        CASE 
            WHEN AvgMonthlyReferrals3Months > 0 
            THEN ((NewReferralsLastMonth - AvgMonthlyReferrals3Months) / AvgMonthlyReferrals3Months) * 100
            ELSE 0
        END AS GrowthRate
    FROM RecentTrends rt
    LEFT JOIN SeasonalPatterns sp ON rt.TeamID = sp.TeamID 
        AND sp.Month = MONTH(DATEADD(MONTH, 1, GETDATE()))
)
SELECT 
    cc.TeamID,
    cc.TeamName,
    cc.TeamCode,
    cc.AreaName,
    cc.TeamFunctionName,
    
    -- Current State
    cc.TeamCapacity,
    cc.ActiveClients,
    cc.CurrentUtilization,
    ISNULL(wm.WaitlistCount, 0) AS WaitlistCount,
    ISNULL(wm.AvgWaitDays, 0) AS AvgWaitDays,
    
    -- Recent Activity
    ISNULL(rt.NewReferralsLastMonth, 0) AS NewReferralsLastMonth,
    ISNULL(rt.DischargesLastMonth, 0) AS DischargesLastMonth,
    ISNULL(rt.NewReferralsLastMonth, 0) - ISNULL(rt.DischargesLastMonth, 0) AS NetChangeLastMonth,
    
    -- Workload Metrics
    ISNULL(al.TotalActivitiesLastMonth, 0) AS TotalActivitiesLastMonth,
    ISNULL(al.TotalActivityHoursLastMonth, 0) AS TotalActivityHoursLastMonth,
    CASE 
        WHEN cc.ActiveClients > 0 
        THEN al.TotalActivityHoursLastMonth / cc.ActiveClients 
        ELSE 0 
    END AS AvgHoursPerClient,
    ISNULL(al.ActiveStaffCount, 0) AS ActiveStaffCount,
    
    -- Predicted Demand (Next Month)
    ISNULL(fd.BaselineDemand, rt.AvgMonthlyReferrals3Months) AS PredictedReferralsNextMonth,
    ISNULL(fd.SeasonallyAdjustedDemand, rt.AvgMonthlyReferrals3Months) AS AdjustedPredictedReferrals,
    
    -- Predicted Capacity Metrics
    cc.ActiveClients + 
        ISNULL(fd.SeasonallyAdjustedDemand, rt.AvgMonthlyReferrals3Months) - 
        ISNULL(rt.AvgMonthlyDischarges3Months, 0) AS PredictedActiveClients,
    
    CASE 
        WHEN cc.TeamCapacity > 0 
        THEN ((cc.ActiveClients + 
            ISNULL(fd.SeasonallyAdjustedDemand, rt.AvgMonthlyReferrals3Months) - 
            ISNULL(rt.AvgMonthlyDischarges3Months, 0)) * 100.0) / cc.TeamCapacity
        ELSE NULL
    END AS PredictedUtilization,
    
    -- Capacity Gap Analysis
    cc.TeamCapacity - (cc.ActiveClients + 
        ISNULL(fd.SeasonallyAdjustedDemand, rt.AvgMonthlyReferrals3Months) - 
        ISNULL(rt.AvgMonthlyDischarges3Months, 0)) AS CapacityGap,
    
    -- Risk Indicators
    CASE 
        WHEN cc.TeamCapacity > 0 AND 
            ((cc.ActiveClients + ISNULL(fd.SeasonallyAdjustedDemand, 0) - ISNULL(rt.AvgMonthlyDischarges3Months, 0)) * 100.0) / cc.TeamCapacity > 100
        THEN 'Over Capacity'
        WHEN cc.TeamCapacity > 0 AND 
            ((cc.ActiveClients + ISNULL(fd.SeasonallyAdjustedDemand, 0) - ISNULL(rt.AvgMonthlyDischarges3Months, 0)) * 100.0) / cc.TeamCapacity > 90
        THEN 'Near Capacity'
        WHEN cc.TeamCapacity > 0 AND 
            ((cc.ActiveClients + ISNULL(fd.SeasonallyAdjustedDemand, 0) - ISNULL(rt.AvgMonthlyDischarges3Months, 0)) * 100.0) / cc.TeamCapacity > 75
        THEN 'High Utilization'
        WHEN cc.TeamCapacity > 0 AND 
            ((cc.ActiveClients + ISNULL(fd.SeasonallyAdjustedDemand, 0) - ISNULL(rt.AvgMonthlyDischarges3Months, 0)) * 100.0) / cc.TeamCapacity < 50
        THEN 'Under Utilized'
        ELSE 'Normal'
    END AS CapacityStatus,
    
    -- Recommended Actions
    CASE 
        WHEN ISNULL(wm.WaitlistCount, 0) > 10 AND cc.CurrentUtilization < 80
        THEN 'Process waitlist - capacity available'
        WHEN cc.TeamCapacity > 0 AND 
            ((cc.ActiveClients + ISNULL(fd.SeasonallyAdjustedDemand, 0)) * 100.0) / cc.TeamCapacity > 100
        THEN 'Increase capacity or redirect referrals'
        WHEN cc.CurrentUtilization < 50
        THEN 'Review service model or consolidate teams'
        WHEN ISNULL(wm.AvgWaitDays, 0) > 30
        THEN 'Address waitlist delays'
        ELSE 'Monitor'
    END AS RecommendedAction,
    
    -- Additional Metrics
    CASE 
        WHEN al.ActiveStaffCount > 0 AND cc.ActiveClients > 0
        THEN cc.ActiveClients * 1.0 / al.ActiveStaffCount
        ELSE NULL
    END AS ClientsPerStaff,
    
    CASE 
        WHEN al.ActiveStaffCount > 0 AND al.TotalActivityHoursLastMonth > 0
        THEN al.TotalActivityHoursLastMonth * 1.0 / al.ActiveStaffCount
        ELSE NULL
    END AS AvgHoursPerStaff,
    
    -- Planning Horizon
    CASE 
        WHEN cc.TeamCapacity > 0 AND ISNULL(fd.SeasonallyAdjustedDemand, 0) > ISNULL(rt.AvgMonthlyDischarges3Months, 0)
        THEN cc.TeamCapacity * 1.0 / (ISNULL(fd.SeasonallyAdjustedDemand, 0) - ISNULL(rt.AvgMonthlyDischarges3Months, 0))
        ELSE NULL
    END AS MonthsToFullCapacity,
    
    GETDATE() AS AnalysisDate
    
FROM CurrentCapacity cc
LEFT JOIN RecentTrends rt ON cc.TeamID = rt.TeamID
LEFT JOIN ActivityLoad al ON cc.TeamID = al.TeamID
LEFT JOIN WaitlistMetrics wm ON cc.TeamID = wm.TeamID
LEFT JOIN FutureDemand fd ON cc.TeamID = fd.TeamID
WHERE cc.TeamCapacity > 0  -- Only teams with defined capacity

GO