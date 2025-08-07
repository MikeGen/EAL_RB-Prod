CREATE VIEW sf.vw_Snapshot_ClientLegalStatus
as
SELECT DISTINCT            -- distinct needed as vwFactRef can return multiple rows for each referral
       2 as CompanyID,     -- 2 is EAL hardcoded
       cast(getdate() AS Date) as SnapshotDate,
       fr.TeamID, 
	   fr.PersonID, 
	   fr.ReferralID ,

	   CASE WHEN 
		    fls.LegalStatusID IS NULL  THEN 1
			ELSE 0
		END AS IsLegalStatusMissing,
	   
	   fls.LegalStatusID,
	   dls.LegalStatusText

FROM            pbi.vw_FactReferral          fr
LEFT OUTER JOIN pbi.vw_FactPersonLegalStatus fls ON fr.PersonID = fls.PersonID  -- has only last row for Client
LEFT OUTER JOIN dl.DimLegalStatus            dls ON fls.LegalStatusID = dls.LegalStatusID

WHERE fr.IsActiveToday = 1  
AND   fr.ReferralEndDate IS NULL

GO

