
CREATE VIEW sf.vw_Snapshot_NoSubstanceUse
as

SELECT DISTINCT            -- distinct needed as vwFactRef can return multiple rows for each referral
       2 as CompanyID,     -- 2 is EAL hardcoded
       cast(getdate() AS Date) as SnapshotDate,
       fr.TeamID, 
	   fr.PersonID, 
	   fr.ReferralID ,

	   CASE WHEN NOT EXISTS
		    (SELECT * FROM dl.FactPersonHealthCondition h
             WHERE h.PersonHealthConditionHealthConditionType = 'Substance'
			 AND   h.PersonHealthConditionIsCurrent           = 1
			 AND   h.PersonId                                 = fr.PersonID)
			THEN 1
			ELSE 0
		END AS IsSubstanceUseMissing

FROM            pbi.vw_FactReferral          fr

WHERE fr.IsActiveToday   =  1  
AND   fr.ReferralEndDate IS NULL

GO

