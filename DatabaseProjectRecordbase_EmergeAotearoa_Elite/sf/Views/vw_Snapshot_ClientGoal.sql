CREATE VIEW sf.vw_Snapshot_ClientGoal
as
SELECT DISTINCT            -- distinct needed as vwFactRef can return multiple rows for each referral
       2 as CompanyID,     -- 2 is EAL hardcoded
       cast(getdate() AS Date) as SnapshotDate,
       fr.TeamID, 
	   fr.PersonID, 
	   fr.ReferralID ,

	   CASE WHEN 
		    NOT EXISTS (   -- if no recs in Goals table
				SELECT * FROM dl.FactGoal fg 
				WHERE fg.ReferralID = fr.ReferralID
				AND   fg.PersonID   = fr.PersonID)  THEN 1
			ELSE 0
		END AS IsGoalMissing,
	   
	   (SELECT count(DISTINCT GoalID) FROM dl.FactGoal fg 
	    WHERE fg.ReferralID = fr.ReferralID
		AND   fg.PersonID   = fr.PersonID
		AND   coalesce(fg.GoalCloseNotCompletedDate, fg.GoalCloseCompletedDate) IS NOT NULL
		) AS GoalsCompleted_Count,

	   (SELECT count(DISTINCT GoalID) FROM dl.FactGoal fg 
	    WHERE fg.ReferralID = fr.ReferralID
		AND   fg.PersonID   = fr.PersonID
		AND   coalesce(fg.GoalCloseNotCompletedDate, fg.GoalCloseCompletedDate) IS NULL
		) AS GoalsNotCompleted_Count

FROM pbi.vw_FactReferral fr

WHERE fr.IsActiveToday = 1  
AND   fr.ReferralEndDate IS NULL

GO

