-- =============================================
-- View: vw_TS_DataPreparation
-- Description: Prepares time series data with proper sequencing, fills gaps, and creates lag features
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_TS_DataPreparation]
AS
WITH DateSequence AS (
    -- Generate complete date sequence to handle missing data points
    SELECT 
        DATEADD(DAY, n.Number, '2020-01-01') AS DateValue
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY object_id) - 1 AS Number
        FROM sys.all_objects
    ) n
    WHERE DATEADD(DAY, n.Number, '2020-01-01') <= GETDATE()
),
RawTimeSeries AS (
    -- Aggregate raw data into time series format
    SELECT 
        CAST(r.ReferralReceivedDate AS DATE) AS DatePoint,
        t.TeamID,
        t.TeamName,
        t.AreaID,
        a.AreaName,
        COUNT(DISTINCT r.ReferralID) AS DailyReferrals,
        COUNT(DISTINCT r.PersonID) AS DailyNewClients,
        COUNT(DISTINCT CASE 
            WHEN rst.ReferralStatusTypeCode = 'Accepted' 
            THEN r.ReferralID 
        END) AS DailyAcceptances,
        COUNT(DISTINCT CASE 
            WHEN rst.ReferralStatusTypeCode = 'Discharged' 
            THEN r.ReferralID 
        END) AS DailyDischarges
    FROM dl.FactReferral r
    INNER JOIN dl.DimTeam t ON r.TeamID = t.TeamID
    INNER JOIN dl.DimArea a ON t.AreaID = a.AreaID
    LEFT JOIN dl.FactReferralStatus rs ON r.ReferralID = rs.ReferralID
    LEFT JOIN dl.DimReferralStatusType rst ON rs.ReferralStatusTypeID = rst.ReferralStatusTypeID
    WHERE r.ReferralReceivedDate >= '2020-01-01'
        AND r.ReferralReferralType = 'InboundReferral'
    GROUP BY 
        CAST(r.ReferralReceivedDate AS DATE),
        t.TeamID,
        t.TeamName,
        t.AreaID,
        a.AreaName
),
ActivityTimeSeries AS (
    -- Activity-based time series
    SELECT 
        CAST(a.ActivityStartDate AS DATE) AS DatePoint,
        a.TeamID,
        COUNT(DISTINCT a.ActivityID) AS DailyActivities,
        SUM(DATEDIFF(MINUTE, a.ActivityStartDate, a.ActivityEndDate)) AS DailyActivityMinutes,
        COUNT(DISTINCT ap.EntityID) AS DailyClientsServed,
        AVG(DATEDIFF(MINUTE, a.ActivityStartDate, a.ActivityEndDate)) AS AvgActivityDuration
    FROM dl.FactActivity a
    LEFT JOIN dl.FactActivityParticipant ap ON a.ActivityID = ap.ActivityID
        AND ap.ActivityParticipantEntityType = 'Person'
    WHERE a.ActivityStartDate >= '2020-01-01'
    GROUP BY 
        CAST(a.ActivityStartDate AS DATE),
        a.TeamID
),
CompleteTimeSeries AS (
    -- Combine date sequence with actual data, filling gaps
    SELECT 
        ds.DateValue,
        t.TeamID,
        t.TeamName,
        t.AreaID,
        -- Fill missing values with 0 or use forward fill
        ISNULL(rts.DailyReferrals, 0) AS DailyReferrals,
        ISNULL(rts.DailyNewClients, 0) AS DailyNewClients,
        ISNULL(rts.DailyAcceptances, 0) AS DailyAcceptances,
        ISNULL(rts.DailyDischarges, 0) AS DailyDischarges,
        ISNULL(ats.DailyActivities, 0) AS DailyActivities,
        ISNULL(ats.DailyActivityMinutes, 0) AS DailyActivityMinutes,
        ISNULL(ats.DailyClientsServed, 0) AS DailyClientsServed,
        ISNULL(ats.AvgActivityDuration, 0) AS AvgActivityDuration
    FROM DateSequence ds
    CROSS JOIN (SELECT DISTINCT TeamID, TeamName, AreaID FROM dl.DimTeam WHERE TeamEndDate IS NULL) t
    LEFT JOIN RawTimeSeries rts ON ds.DateValue = rts.DatePoint AND t.TeamID = rts.TeamID
    LEFT JOIN ActivityTimeSeries ats ON ds.DateValue = ats.DatePoint AND t.TeamID = ats.TeamID
    WHERE ds.DateValue <= CAST(GETDATE() AS DATE)
),
TimeSeriesWithLags AS (
    -- Create lag features for time series analysis
    SELECT 
        *,
        -- Lag features (previous values)
        LAG(DailyReferrals, 1) OVER (PARTITION BY TeamID ORDER BY DateValue) AS Referrals_Lag1,
        LAG(DailyReferrals, 7) OVER (PARTITION BY TeamID ORDER BY DateValue) AS Referrals_Lag7,
        LAG(DailyReferrals, 14) OVER (PARTITION BY TeamID ORDER BY DateValue) AS Referrals_Lag14,
        LAG(DailyReferrals, 28) OVER (PARTITION BY TeamID ORDER BY DateValue) AS Referrals_Lag28,
        LAG(DailyReferrals, 365) OVER (PARTITION BY TeamID ORDER BY DateValue) AS Referrals_Lag365,
        
        -- Lead features (future values for validation)
        LEAD(DailyReferrals, 1) OVER (PARTITION BY TeamID ORDER BY DateValue) AS Referrals_Lead1,
        LEAD(DailyReferrals, 7) OVER (PARTITION BY TeamID ORDER BY DateValue) AS Referrals_Lead7,
        
        -- Moving averages
        AVG(DailyReferrals) OVER (
            PARTITION BY TeamID 
            ORDER BY DateValue 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS MA7_Referrals,
        AVG(DailyReferrals) OVER (
            PARTITION BY TeamID 
            ORDER BY DateValue 
            ROWS BETWEEN 27 PRECEDING AND CURRENT ROW
        ) AS MA28_Referrals,
        AVG(DailyReferrals) OVER (
            PARTITION BY TeamID 
            ORDER BY DateValue 
            ROWS BETWEEN 89 PRECEDING AND CURRENT ROW
        ) AS MA90_Referrals,
        
        -- Moving standard deviations for volatility
        STDEV(DailyReferrals) OVER (
            PARTITION BY TeamID 
            ORDER BY DateValue 
            ROWS BETWEEN 27 PRECEDING AND CURRENT ROW
        ) AS StDev28_Referrals,
        
        -- Cumulative sums
        SUM(DailyReferrals) OVER (
            PARTITION BY TeamID, YEAR(DateValue), MONTH(DateValue)
            ORDER BY DateValue
        ) AS MTD_Referrals,
        SUM(DailyReferrals) OVER (
            PARTITION BY TeamID, YEAR(DateValue)
            ORDER BY DateValue
        ) AS YTD_Referrals
    FROM CompleteTimeSeries
),
TimeFeatures AS (
    -- Add time-based features
    SELECT 
        *,
        -- Date components
        YEAR(DateValue) AS Year,
        MONTH(DateValue) AS Month,
        DAY(DateValue) AS Day,
        DATEPART(QUARTER, DateValue) AS Quarter,
        DATEPART(WEEK, DateValue) AS WeekOfYear,
        DATEPART(WEEKDAY, DateValue) AS DayOfWeek,
        DATENAME(WEEKDAY, DateValue) AS DayName,
        DATENAME(MONTH, DateValue) AS MonthName,
        
        -- Cyclical encoding for seasonality
        SIN(2 * PI() * DATEPART(DAYOFYEAR, DateValue) / 365.25) AS YearSin,
        COS(2 * PI() * DATEPART(DAYOFYEAR, DateValue) / 365.25) AS YearCos,
        SIN(2 * PI() * DATEPART(WEEK, DateValue) / 52.18) AS WeekSin,
        COS(2 * PI() * DATEPART(WEEK, DateValue) / 52.18) AS WeekCos,
        SIN(2 * PI() * DAY(DateValue) / 30.44) AS MonthSin,
        COS(2 * PI() * DAY(DateValue) / 30.44) AS MonthCos,
        
        -- Trend component (days since start)
        DATEDIFF(DAY, '2020-01-01', DateValue) AS DaysSinceStart,
        
        -- Holiday indicators (simplified - would need holiday table)
        CASE 
            WHEN MONTH(DateValue) = 12 AND DAY(DateValue) IN (25, 26) THEN 1
            WHEN MONTH(DateValue) = 1 AND DAY(DateValue) = 1 THEN 1
            ELSE 0
        END AS IsHoliday,
        
        -- Weekend indicator
        CASE 
            WHEN DATEPART(WEEKDAY, DateValue) IN (1, 7) THEN 1 
            ELSE 0 
        END AS IsWeekend,
        
        -- Month start/end indicators
        CASE WHEN DAY(DateValue) = 1 THEN 1 ELSE 0 END AS IsMonthStart,
        CASE WHEN DateValue = EOMONTH(DateValue) THEN 1 ELSE 0 END AS IsMonthEnd,
        
        -- Difference from moving averages (anomaly detection)
        CASE 
            WHEN MA28_Referrals > 0 
            THEN (DailyReferrals - MA28_Referrals) / NULLIF(StDev28_Referrals, 0)
            ELSE 0
        END AS ZScore_Referrals,
        
        -- Percent change from previous period
        CASE 
            WHEN Referrals_Lag1 > 0 
            THEN ((DailyReferrals - Referrals_Lag1) * 100.0) / Referrals_Lag1
            ELSE 0
        END AS PercentChange_Day,
        CASE 
            WHEN Referrals_Lag7 > 0 
            THEN ((DailyReferrals - Referrals_Lag7) * 100.0) / Referrals_Lag7
            ELSE 0
        END AS PercentChange_Week,
        
        -- Activity intensity ratio
        CASE 
            WHEN DailyClientsServed > 0 
            THEN DailyActivityMinutes * 1.0 / DailyClientsServed
            ELSE 0
        END AS MinutesPerClient
        
    FROM TimeSeriesWithLags
)
SELECT 
    DateValue,
    TeamID,
    TeamName,
    AreaID,
    
    -- Core metrics
    DailyReferrals,
    DailyNewClients,
    DailyAcceptances,
    DailyDischarges,
    DailyActivities,
    DailyActivityMinutes,
    DailyClientsServed,
    AvgActivityDuration,
    
    -- Lag features
    Referrals_Lag1,
    Referrals_Lag7,
    Referrals_Lag14,
    Referrals_Lag28,
    Referrals_Lag365,
    Referrals_Lead1,
    Referrals_Lead7,
    
    -- Moving statistics
    MA7_Referrals,
    MA28_Referrals,
    MA90_Referrals,
    StDev28_Referrals,
    ZScore_Referrals,
    
    -- Cumulative metrics
    MTD_Referrals,
    YTD_Referrals,
    
    -- Time features
    Year,
    Month,
    Day,
    Quarter,
    WeekOfYear,
    DayOfWeek,
    DayName,
    MonthName,
    YearSin,
    YearCos,
    WeekSin,
    WeekCos,
    MonthSin,
    MonthCos,
    DaysSinceStart,
    IsHoliday,
    IsWeekend,
    IsMonthStart,
    IsMonthEnd,
    
    -- Change metrics
    PercentChange_Day,
    PercentChange_Week,
    MinutesPerClient,
    
    -- Data quality indicator
    CASE 
        WHEN DailyReferrals = 0 AND DailyActivities = 0 
        THEN 'No Data'
        WHEN ABS(ZScore_Referrals) > 3 
        THEN 'Anomaly'
        ELSE 'Normal'
    END AS DataQuality
    
FROM TimeFeatures
WHERE DateValue >= '2021-01-01'  -- Keep recent data for performance

GO