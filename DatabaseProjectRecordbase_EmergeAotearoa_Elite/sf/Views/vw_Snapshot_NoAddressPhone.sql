CREATE VIEW sf.vw_Snapshot_NoAddressPhone
as
SELECT DISTINCT            -- distinct needed as vwFactRef can return multiple rows for each referral
       2 as CompanyID,     -- 2 is EAL hardcoded
       cast(getdate() AS Date) as SnapshotDate,
       r.TeamID, 
	   r.PersonID, 
	   r.ReferralID ,
	   
	   CASE WHEN NOT EXISTS ( 
		   SELECT * FROM dl.FactAddress fa
		   WHERE fa.EntityID = r.PersonID)
		   THEN  1
		   ELSE  0
	   END       AS  	IsAddressMissing,

	   CASE WHEN NOT EXISTS ( 
		   SELECT * FROM dl.FactPhone fp
		   WHERE fp.EntityID = r.PersonID)
		   THEN  1
		   ELSE  0
	   END       AS  	IsPhoneMissing

FROM pbi.vw_FactReferral r

WHERE r.IsActiveToday = 1  
AND   r.ReferralEndDate IS NULL

GO

