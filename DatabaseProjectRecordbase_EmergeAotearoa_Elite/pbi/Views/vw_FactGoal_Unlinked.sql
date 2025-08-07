CREATE VIEW pbi.vw_FactGoal_Unlinked
AS 

-- these FactGoal recs could not be linked to any FactReferrals, so we could not find any Team for these

SELECT   
		 dp.PersonID,
		 (dp.PersonFirstName + ' ' + dp.PersonLastName) AS ClientName,

         (SELECT count(DISTINCT GoalID) FROM dl.FactGoal fg1 
          WHERE fg1.ReferralID IS NULL     -- no referral link so no known Team
          AND   fg1.PersonID   = dp.PersonID
          AND   coalesce(fg1.GoalCloseNotCompletedDate, fg1.GoalCloseCompletedDate) IS NOT NULL
		  ) AS GoalsCompleted_Count,

         (SELECT count(DISTINCT GoalID) FROM dl.FactGoal fg2
          WHERE fg2.ReferralID IS NULL     -- no referral link so no known Team
          AND   fg2.PersonID   = dp.PersonID
          AND   coalesce(fg2.GoalCloseNotCompletedDate, fg2.GoalCloseCompletedDate) IS NULL
		  ) AS GoalsNotCompleted_Count

FROM      dl.DimPerson       dp

GO

