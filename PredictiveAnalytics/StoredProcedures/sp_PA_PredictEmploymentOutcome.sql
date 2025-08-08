-- =============================================
-- Stored Procedure: sp_PA_PredictEmploymentOutcome
-- Description: Predicts employment success likelihood for clients in employment programs
-- Author: Predictive Analytics Team
-- Create Date: 2025-08-08
-- =============================================

CREATE PROCEDURE [dbo].[sp_PA_PredictEmploymentOutcome]
    @PersonID INT = NULL,  -- Optional: specific person, otherwise all active
    @TeamID INT = NULL,    -- Optional: specific team
    @MinProbability DECIMAL(5,2) = 0.0  -- Minimum probability threshold
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Create temp table for results
    CREATE TABLE #EmploymentPredictions (
        PersonID INT,
        PersonName NVARCHAR(500),
        TeamID INT,
        TeamName NVARCHAR(100),
        EmploymentPlanID INT,
        CurrentPhase NVARCHAR(50),
        PlanStartDate DATE,
        DaysInPlan INT,
        
        -- Client Features
        Age INT,
        Gender NVARCHAR(50),
        EducationLevel NVARCHAR(100),
        MonthsSinceLastEmployment INT,
        PreviousJobCount INT,
        AvgJobDurationMonths DECIMAL(10,2),
        
        -- Engagement Metrics
        ActivityParticipationRate DECIMAL(5,2),
        TaskCompletionRate DECIMAL(5,2),
        AttendanceConsistency DECIMAL(5,2),
        
        -- Risk Factors
        HealthConditionCount INT,
        IncidentHistory INT,
        SupportNetworkStrength INT,
        
        -- Predictions
        EmploymentSuccessProbability DECIMAL(5,2),
        ExpectedTimeToPlacement INT,  -- Days
        JobRetentionProbability DECIMAL(5,2),
        ConfidenceLevel NVARCHAR(20),
        RecommendedInterventions NVARCHAR(MAX)
    );
    
    -- Get active employment plans
    WITH ActiveEmploymentPlans AS (
        SELECT 
            ep.EmploymentPlanID,
            ep.PersonID,
            ep.ReferralID,
            ep.EmploymentPlanStartDate,
            ep.CurrentPhaseID,
            ep.PrimaryCaseWorkerID,
            r.TeamID,
            t.TeamName,
            p.PersonFirstName + ' ' + p.PersonLastName AS PersonName,
            DATEDIFF(YEAR, p.PersonDateOfBirth, GETDATE()) AS Age,
            g.Gender,
            p.HighestQualificationTypeID,
            hq.HighestQualificationTypeName AS EducationLevel,
            p.EmploymentStatusID,
            DATEDIFF(MONTH, p.PersonLastEmploymentDate, GETDATE()) AS MonthsSinceLastEmployment,
            DATEDIFF(DAY, ep.EmploymentPlanStartDate, GETDATE()) AS DaysInPlan,
            ph.EmploymentPlanPhaseName AS CurrentPhase
        FROM dl.FactEmploymentPlan ep
        INNER JOIN dl.FactReferral r ON ep.ReferralID = r.ReferralID
        INNER JOIN dl.DimTeam t ON r.TeamID = t.TeamID
        INNER JOIN dl.DimPerson p ON ep.PersonID = p.PersonID
        LEFT JOIN dl.DimGender g ON p.GenderID = g.GenderID
        LEFT JOIN dl.DimHighestQualificationType hq ON p.HighestQualificationTypeID = hq.HighestQualificationTypeID
        LEFT JOIN dl.DimEmploymentPlanPhase ph ON ep.CurrentPhaseID = ph.EmploymentPlanPhaseID
        WHERE ep.EmploymentPlanCloseDate IS NULL
            AND (@PersonID IS NULL OR ep.PersonID = @PersonID)
            AND (@TeamID IS NULL OR r.TeamID = @TeamID)
    ),
    -- Calculate employment history metrics
    EmploymentHistory AS (
        SELECT 
            PersonID,
            COUNT(*) AS PreviousJobCount,
            AVG(DATEDIFF(MONTH, JobStartDate, ISNULL(JobEndDate, GETDATE()))) AS AvgJobDurationMonths,
            MAX(CASE WHEN JobEndDate IS NULL THEN 1 ELSE 0 END) AS HasCurrentJob
        FROM dl.FactPersonJob
        GROUP BY PersonID
    ),
    -- Calculate task completion rates
    TaskMetrics AS (
        SELECT 
            ep.EmploymentPlanID,
            COUNT(*) AS TotalTasks,
            SUM(CASE WHEN ept.EmploymentPlanTaskStatusID = 3 THEN 1 ELSE 0 END) AS CompletedTasks,
            SUM(CASE WHEN ept.EmploymentPlanTaskCancelledReasonID IS NOT NULL THEN 1 ELSE 0 END) AS CancelledTasks
        FROM dl.FactEmploymentPlan ep
        INNER JOIN dl.FactEmploymentPlanTask ept ON ep.EmploymentPlanID = ept.EmploymentPlanID
        GROUP BY ep.EmploymentPlanID
    ),
    -- Calculate activity participation
    ActivityMetrics AS (
        SELECT 
            ap.EntityID AS PersonID,
            COUNT(DISTINCT a.ActivityID) AS TotalActivities,
            COUNT(DISTINCT CASE WHEN ap.ActivityParticipantIsAttendee = 1 THEN a.ActivityID END) AS AttendedActivities,
            COUNT(DISTINCT CAST(a.ActivityStartDate AS DATE)) AS ActiveDays,
            STDEV(DATEDIFF(DAY, LAG(a.ActivityStartDate) OVER (PARTITION BY ap.EntityID ORDER BY a.ActivityStartDate), a.ActivityStartDate)) AS AttendanceVariability
        FROM dl.FactActivityParticipant ap
        INNER JOIN dl.FactActivity a ON ap.ActivityID = a.ActivityID
        WHERE ap.ActivityParticipantEntityType = 'Person'
            AND a.ActivityStartDate >= DATEADD(MONTH, -3, GETDATE())
        GROUP BY ap.EntityID
    ),
    -- Health and support factors
    HealthSupport AS (
        SELECT 
            p.PersonID,
            COUNT(DISTINCT hc.PersonHealthConditionId) AS HealthConditionCount,
            COUNT(DISTINCT pc.PersonContactID) AS SupportContacts,
            COUNT(DISTINCT i.IncidentID) AS IncidentCount
        FROM dl.DimPerson p
        LEFT JOIN dl.FactPersonHealthCondition hc ON p.PersonID = hc.PersonId 
            AND hc.PersonHealthConditionIsCurrent = 1
        LEFT JOIN dl.FactPersonContact pc ON p.PersonID = pc.PersonID
        LEFT JOIN dl.FactIncidentPerson ip ON p.PersonID = ip.PersonID
        LEFT JOIN dl.FactIncident i ON ip.IncidentID = i.IncidentID 
            AND i.IncidentDate >= DATEADD(YEAR, -1, GETDATE())
        GROUP BY p.PersonID
    ),
    -- Historical success patterns
    SuccessPatterns AS (
        SELECT 
            p.HighestQualificationTypeID,
            p.GenderID,
            CASE 
                WHEN DATEDIFF(YEAR, p.PersonDateOfBirth, ep.EmploymentPlanStartDate) < 25 THEN 1
                WHEN DATEDIFF(YEAR, p.PersonDateOfBirth, ep.EmploymentPlanStartDate) < 35 THEN 2
                WHEN DATEDIFF(YEAR, p.PersonDateOfBirth, ep.EmploymentPlanStartDate) < 50 THEN 3
                ELSE 4
            END AS AgeGroup,
            COUNT(*) AS TotalPlans,
            SUM(CASE WHEN epoj.JobID IS NOT NULL THEN 1 ELSE 0 END) AS SuccessfulPlacements,
            AVG(DATEDIFF(DAY, ep.EmploymentPlanStartDate, ISNULL(epoj.JobStartDate, GETDATE()))) AS AvgTimeToPlacement
        FROM dl.FactEmploymentPlan ep
        INNER JOIN dl.DimPerson p ON ep.PersonID = p.PersonID
        LEFT JOIN dl.FactEmploymentPlanOutcomeJob epoj ON ep.EmploymentPlanID = epoj.EmploymentPlanID
        WHERE ep.EmploymentPlanCloseDate IS NOT NULL
        GROUP BY 
            p.HighestQualificationTypeID,
            p.GenderID,
            CASE 
                WHEN DATEDIFF(YEAR, p.PersonDateOfBirth, ep.EmploymentPlanStartDate) < 25 THEN 1
                WHEN DATEDIFF(YEAR, p.PersonDateOfBirth, ep.EmploymentPlanStartDate) < 35 THEN 2
                WHEN DATEDIFF(YEAR, p.PersonDateOfBirth, ep.EmploymentPlanStartDate) < 50 THEN 3
                ELSE 4
            END
    )
    -- Main prediction logic
    INSERT INTO #EmploymentPredictions
    SELECT 
        aep.PersonID,
        aep.PersonName,
        aep.TeamID,
        aep.TeamName,
        aep.EmploymentPlanID,
        aep.CurrentPhase,
        aep.EmploymentPlanStartDate,
        aep.DaysInPlan,
        
        -- Client Features
        aep.Age,
        aep.Gender,
        aep.EducationLevel,
        aep.MonthsSinceLastEmployment,
        ISNULL(eh.PreviousJobCount, 0) AS PreviousJobCount,
        ISNULL(eh.AvgJobDurationMonths, 0) AS AvgJobDurationMonths,
        
        -- Engagement Metrics
        CASE 
            WHEN am.TotalActivities > 0 
            THEN (am.AttendedActivities * 100.0) / am.TotalActivities 
            ELSE 0 
        END AS ActivityParticipationRate,
        CASE 
            WHEN tm.TotalTasks > 0 
            THEN (tm.CompletedTasks * 100.0) / tm.TotalTasks 
            ELSE 0 
        END AS TaskCompletionRate,
        CASE 
            WHEN am.AttendanceVariability IS NOT NULL AND am.AttendanceVariability > 0
            THEN 100 - LEAST(100, am.AttendanceVariability * 5)
            ELSE 50
        END AS AttendanceConsistency,
        
        -- Risk Factors
        ISNULL(hs.HealthConditionCount, 0) AS HealthConditionCount,
        ISNULL(hs.IncidentCount, 0) AS IncidentHistory,
        CASE 
            WHEN hs.SupportContacts >= 3 THEN 3
            WHEN hs.SupportContacts >= 1 THEN 2
            ELSE 1
        END AS SupportNetworkStrength,
        
        -- Calculate Employment Success Probability
        GREATEST(0, LEAST(100, 
            -- Base probability from historical success rate
            ISNULL((sp.SuccessfulPlacements * 50.0) / NULLIF(sp.TotalPlans, 0), 25) +
            
            -- Education factor (15%)
            CASE 
                WHEN aep.HighestQualificationTypeID IN (4, 5, 6) THEN 15  -- Higher education
                WHEN aep.HighestQualificationTypeID IN (2, 3) THEN 10    -- Secondary
                ELSE 5
            END +
            
            -- Recent employment (15%)
            CASE 
                WHEN aep.MonthsSinceLastEmployment <= 6 THEN 15
                WHEN aep.MonthsSinceLastEmployment <= 12 THEN 10
                WHEN aep.MonthsSinceLastEmployment <= 24 THEN 5
                ELSE 0
            END +
            
            -- Engagement (10%)
            CASE 
                WHEN am.TotalActivities > 0 AND (am.AttendedActivities * 100.0) / am.TotalActivities >= 80 THEN 10
                WHEN am.TotalActivities > 0 AND (am.AttendedActivities * 100.0) / am.TotalActivities >= 60 THEN 5
                ELSE 0
            END +
            
            -- Task completion (10%)
            CASE 
                WHEN tm.TotalTasks > 0 AND (tm.CompletedTasks * 100.0) / tm.TotalTasks >= 75 THEN 10
                WHEN tm.TotalTasks > 0 AND (tm.CompletedTasks * 100.0) / tm.TotalTasks >= 50 THEN 5
                ELSE 0
            END -
            
            -- Risk deductions
            CASE WHEN hs.IncidentCount > 2 THEN 10 ELSE hs.IncidentCount * 3 END -
            CASE WHEN hs.HealthConditionCount > 3 THEN 10 ELSE hs.HealthConditionCount * 2 END
        )) AS EmploymentSuccessProbability,
        
        -- Expected Time to Placement
        CASE 
            WHEN sp.AvgTimeToPlacement IS NOT NULL 
            THEN sp.AvgTimeToPlacement * 
                CASE 
                    WHEN aep.MonthsSinceLastEmployment > 24 THEN 1.5
                    WHEN aep.MonthsSinceLastEmployment > 12 THEN 1.2
                    ELSE 1.0
                END
            ELSE 180  -- Default 6 months
        END AS ExpectedTimeToPlacement,
        
        -- Job Retention Probability
        CASE 
            WHEN eh.AvgJobDurationMonths >= 12 THEN 80
            WHEN eh.AvgJobDurationMonths >= 6 THEN 60
            WHEN eh.AvgJobDurationMonths >= 3 THEN 40
            ELSE 30
        END AS JobRetentionProbability,
        
        -- Confidence Level
        CASE 
            WHEN sp.TotalPlans >= 20 THEN 'High'
            WHEN sp.TotalPlans >= 10 THEN 'Medium'
            ELSE 'Low'
        END AS ConfidenceLevel,
        
        -- Recommended Interventions
        CASE 
            WHEN tm.TotalTasks > 0 AND (tm.CompletedTasks * 100.0) / tm.TotalTasks < 50 
            THEN 'Focus on task completion; Review task difficulty and provide additional support. '
            ELSE ''
        END +
        CASE 
            WHEN am.TotalActivities > 0 AND (am.AttendedActivities * 100.0) / am.TotalActivities < 60 
            THEN 'Improve engagement; Address attendance barriers. '
            ELSE ''
        END +
        CASE 
            WHEN aep.MonthsSinceLastEmployment > 24 
            THEN 'Long employment gap; Consider skills refresh training. '
            ELSE ''
        END +
        CASE 
            WHEN hs.HealthConditionCount > 2 
            THEN 'Multiple health conditions; Ensure workplace accommodations planning. '
            ELSE ''
        END +
        CASE 
            WHEN eh.PreviousJobCount = 0 
            THEN 'No previous employment; Focus on work readiness and expectations. '
            ELSE ''
        END AS RecommendedInterventions
        
    FROM ActiveEmploymentPlans aep
    LEFT JOIN EmploymentHistory eh ON aep.PersonID = eh.PersonID
    LEFT JOIN TaskMetrics tm ON aep.EmploymentPlanID = tm.EmploymentPlanID
    LEFT JOIN ActivityMetrics am ON aep.PersonID = am.PersonID
    LEFT JOIN HealthSupport hs ON aep.PersonID = hs.PersonID
    LEFT JOIN SuccessPatterns sp ON 
        sp.HighestQualificationTypeID = aep.HighestQualificationTypeID
        AND sp.GenderID = (SELECT GenderID FROM dl.DimGender WHERE Gender = aep.Gender)
        AND sp.AgeGroup = CASE 
            WHEN aep.Age < 25 THEN 1
            WHEN aep.Age < 35 THEN 2
            WHEN aep.Age < 50 THEN 3
            ELSE 4
        END;
    
    -- Return filtered results
    SELECT * 
    FROM #EmploymentPredictions
    WHERE EmploymentSuccessProbability >= @MinProbability
    ORDER BY EmploymentSuccessProbability DESC, PersonName;
    
    -- Cleanup
    DROP TABLE #EmploymentPredictions;
END

GO