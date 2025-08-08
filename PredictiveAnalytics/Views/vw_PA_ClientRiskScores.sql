-- =============================================
-- View: vw_PA_ClientRiskScores
-- Description: Calculates risk scores for active clients based on multiple factors
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE VIEW [pbi].[vw_PA_ClientRiskScores]
AS
WITH ActiveClients AS (
    -- Get all currently active clients
    SELECT DISTINCT
        r.PersonID,
        r.ReferralID,
        r.TeamID,
        r.ReferralReceivedDate,
        r.CurrentReferralStatusTypeID,
        p.PersonFirstName,
        p.PersonLastName,
        p.PersonDateOfBirth,
        p.GenderID,
        DATEDIFF(YEAR, p.PersonDateOfBirth, GETDATE()) AS Age
    FROM dl.FactReferral r
    INNER JOIN dl.DimPerson p ON r.PersonID = p.PersonID
    INNER JOIN dl.DimReferralStatusType rst ON r.CurrentReferralStatusTypeID = rst.ReferralStatusTypeID
    WHERE r.ReferralEndDate IS NULL
        AND r.ReferralReferralType = 'InboundReferral'
        AND rst.ReferralStatusTypeCode IN ('Accepted', 'Active')
),
IncidentHistory AS (
    -- Calculate incident risk factors
    SELECT 
        ip.PersonID,
        COUNT(DISTINCT i.IncidentID) AS TotalIncidents,
        COUNT(DISTINCT CASE 
            WHEN i.IncidentDate >= DATEADD(MONTH, -6, GETDATE()) 
            THEN i.IncidentID 
        END) AS RecentIncidents6Months,
        MAX(i.IncidentDate) AS LastIncidentDate,
        DATEDIFF(DAY, MAX(i.IncidentDate), GETDATE()) AS DaysSinceLastIncident
    FROM dl.FactIncidentPerson ip
    INNER JOIN dl.FactIncident i ON ip.IncidentID = i.IncidentID
    GROUP BY ip.PersonID
),
ServiceEngagement AS (
    -- Calculate engagement metrics
    SELECT 
        ap.EntityID AS PersonID,
        COUNT(DISTINCT a.ActivityID) AS TotalActivities30Days,
        COUNT(DISTINCT CAST(a.ActivityStartDate AS DATE)) AS ActiveDays30Days,
        MAX(a.ActivityStartDate) AS LastActivityDate,
        DATEDIFF(DAY, MAX(a.ActivityStartDate), GETDATE()) AS DaysSinceLastActivity,
        SUM(CASE 
            WHEN ap.ActivityParticipantIsAttendee = 1 
            THEN 1 ELSE 0 
        END) * 100.0 / NULLIF(COUNT(*), 0) AS AttendanceRate
    FROM dl.FactActivityParticipant ap
    INNER JOIN dl.FactActivity a ON ap.ActivityID = a.ActivityID
    WHERE ap.ActivityParticipantEntityType = 'Person'
        AND a.ActivityStartDate >= DATEADD(DAY, -30, GETDATE())
    GROUP BY ap.EntityID
),
HealthComplexity AS (
    -- Assess health condition complexity
    SELECT 
        PersonID,
        COUNT(DISTINCT HealthConditionTypeId) AS TotalHealthConditions,
        SUM(CASE 
            WHEN PersonHealthConditionHealthConditionType = 'Mental' 
            THEN 1 ELSE 0 
        END) AS MentalHealthConditions,
        SUM(CASE 
            WHEN PersonHealthConditionHealthConditionType = 'Physical' 
            THEN 1 ELSE 0 
        END) AS PhysicalHealthConditions
    FROM dl.FactPersonHealthCondition
    WHERE PersonHealthConditionIsCurrent = 1
    GROUP BY PersonID
),
SupportNetwork AS (
    -- Evaluate support network strength
    SELECT 
        PersonID,
        COUNT(DISTINCT PersonContactID) AS EmergencyContacts,
        COUNT(DISTINCT CASE 
            WHEN ContactTypeID IN (1, 2, 3) -- Family contacts
            THEN PersonContactID 
        END) AS FamilyContacts
    FROM dl.FactPersonContact
    WHERE PersonContactIsPrimaryContact = 1
    GROUP BY PersonID
),
StatusChanges AS (
    -- Track status volatility
    SELECT 
        PersonID,
        COUNT(*) AS StatusChangeCount6Months,
        COUNT(DISTINCT PersonStatusTypeID) AS UniqueStatuses6Months
    FROM dl.FactPersonStatus
    WHERE PersonStatusStartDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY PersonID
),
EmploymentRisk AS (
    -- Employment-specific risk factors
    SELECT 
        p.PersonID,
        CASE 
            WHEN p.EmploymentStatusID IN (3, 4, 5) -- Unemployed codes
            THEN 1 ELSE 0 
        END AS IsUnemployed,
        DATEDIFF(MONTH, p.PersonLastEmploymentDate, GETDATE()) AS MonthsSinceEmployment
    FROM dl.DimPerson p
)
SELECT 
    ac.PersonID,
    ac.ReferralID,
    ac.TeamID,
    t.TeamName,
    ac.PersonFirstName + ' ' + ac.PersonLastName AS ClientName,
    ac.Age,
    g.Gender,
    
    -- Engagement Risk Factors
    ISNULL(se.DaysSinceLastActivity, 999) AS DaysSinceLastActivity,
    ISNULL(se.AttendanceRate, 0) AS AttendanceRate,
    ISNULL(se.TotalActivities30Days, 0) AS RecentActivityCount,
    
    -- Incident Risk Factors
    ISNULL(ih.TotalIncidents, 0) AS TotalIncidents,
    ISNULL(ih.RecentIncidents6Months, 0) AS RecentIncidents,
    ISNULL(ih.DaysSinceLastIncident, 9999) AS DaysSinceLastIncident,
    
    -- Health Complexity
    ISNULL(hc.TotalHealthConditions, 0) AS HealthConditionCount,
    ISNULL(hc.MentalHealthConditions, 0) AS MentalHealthConditions,
    
    -- Support Network
    ISNULL(sn.EmergencyContacts, 0) AS EmergencyContactCount,
    ISNULL(sn.FamilyContacts, 0) AS FamilyContactCount,
    
    -- Status Volatility
    ISNULL(sc.StatusChangeCount6Months, 0) AS RecentStatusChanges,
    
    -- Employment Risk
    ISNULL(er.IsUnemployed, 0) AS IsUnemployed,
    ISNULL(er.MonthsSinceEmployment, 0) AS MonthsSinceEmployment,
    
    -- Calculate Composite Risk Score (0-100 scale)
    (
        -- Engagement risk (40% weight)
        CASE 
            WHEN ISNULL(se.DaysSinceLastActivity, 999) > 30 THEN 15
            WHEN ISNULL(se.DaysSinceLastActivity, 999) > 14 THEN 10
            WHEN ISNULL(se.DaysSinceLastActivity, 999) > 7 THEN 5
            ELSE 0
        END +
        CASE 
            WHEN ISNULL(se.AttendanceRate, 0) < 50 THEN 15
            WHEN ISNULL(se.AttendanceRate, 0) < 70 THEN 10
            WHEN ISNULL(se.AttendanceRate, 0) < 85 THEN 5
            ELSE 0
        END +
        CASE 
            WHEN ISNULL(se.TotalActivities30Days, 0) = 0 THEN 10
            WHEN ISNULL(se.TotalActivities30Days, 0) < 3 THEN 5
            ELSE 0
        END +
        
        -- Incident risk (30% weight)
        CASE 
            WHEN ISNULL(ih.RecentIncidents6Months, 0) >= 3 THEN 20
            WHEN ISNULL(ih.RecentIncidents6Months, 0) >= 2 THEN 15
            WHEN ISNULL(ih.RecentIncidents6Months, 0) >= 1 THEN 10
            ELSE 0
        END +
        CASE 
            WHEN ISNULL(ih.DaysSinceLastIncident, 9999) < 30 THEN 10
            WHEN ISNULL(ih.DaysSinceLastIncident, 9999) < 90 THEN 5
            ELSE 0
        END +
        
        -- Health complexity (15% weight)
        CASE 
            WHEN ISNULL(hc.MentalHealthConditions, 0) >= 2 THEN 10
            WHEN ISNULL(hc.MentalHealthConditions, 0) >= 1 THEN 5
            ELSE 0
        END +
        CASE 
            WHEN ISNULL(hc.TotalHealthConditions, 0) >= 4 THEN 5
            WHEN ISNULL(hc.TotalHealthConditions, 0) >= 2 THEN 3
            ELSE 0
        END +
        
        -- Support network (10% weight)
        CASE 
            WHEN ISNULL(sn.EmergencyContacts, 0) = 0 THEN 10
            WHEN ISNULL(sn.FamilyContacts, 0) = 0 THEN 5
            ELSE 0
        END +
        
        -- Status volatility (5% weight)
        CASE 
            WHEN ISNULL(sc.StatusChangeCount6Months, 0) >= 5 THEN 5
            WHEN ISNULL(sc.StatusChangeCount6Months, 0) >= 3 THEN 3
            ELSE 0
        END
    ) AS RiskScore,
    
    -- Risk Category
    CASE 
        WHEN (
            CASE WHEN ISNULL(se.DaysSinceLastActivity, 999) > 30 THEN 15 ELSE 0 END +
            CASE WHEN ISNULL(ih.RecentIncidents6Months, 0) >= 2 THEN 15 ELSE 0 END
        ) >= 70 THEN 'Critical'
        WHEN (
            CASE WHEN ISNULL(se.DaysSinceLastActivity, 999) > 14 THEN 10 ELSE 0 END +
            CASE WHEN ISNULL(ih.RecentIncidents6Months, 0) >= 1 THEN 10 ELSE 0 END
        ) >= 50 THEN 'High'
        WHEN (
            CASE WHEN ISNULL(se.AttendanceRate, 0) < 70 THEN 10 ELSE 0 END
        ) >= 30 THEN 'Medium'
        ELSE 'Low'
    END AS RiskCategory,
    
    -- Recommended Actions
    CASE 
        WHEN ISNULL(se.DaysSinceLastActivity, 999) > 30 
        THEN 'Immediate contact required - No activity for 30+ days'
        WHEN ISNULL(ih.RecentIncidents6Months, 0) >= 2 
        THEN 'Review safety plan - Multiple recent incidents'
        WHEN ISNULL(se.AttendanceRate, 0) < 50 
        THEN 'Engagement intervention needed - Low attendance'
        WHEN ISNULL(sn.EmergencyContacts, 0) = 0 
        THEN 'Update emergency contacts'
        ELSE 'Continue monitoring'
    END AS RecommendedAction,
    
    GETDATE() AS AssessmentDate
    
FROM ActiveClients ac
INNER JOIN dl.DimTeam t ON ac.TeamID = t.TeamID
LEFT JOIN dl.DimGender g ON ac.GenderID = g.GenderID
LEFT JOIN IncidentHistory ih ON ac.PersonID = ih.PersonID
LEFT JOIN ServiceEngagement se ON ac.PersonID = se.PersonID
LEFT JOIN HealthComplexity hc ON ac.PersonID = hc.PersonID
LEFT JOIN SupportNetwork sn ON ac.PersonID = sn.PersonID
LEFT JOIN StatusChanges sc ON ac.PersonID = sc.PersonID
LEFT JOIN EmploymentRisk er ON ac.PersonID = er.PersonID

GO