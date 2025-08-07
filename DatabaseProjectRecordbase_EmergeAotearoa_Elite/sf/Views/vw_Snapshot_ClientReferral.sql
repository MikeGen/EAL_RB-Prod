CREATE VIEW [sf].[vw_Snapshot_ClientReferral]
as
SELECT DISTINCT            -- distinct needed as vwFactRef can return multiple rows for each referral
       2 as CompanyID,     -- 2 is EAL hardcoded
       cast(getdate() AS Date) as SnapshotDate,
       r.TeamID, 
	   r.PersonID, 
	   r.ReferralID ,
	   
	   r.EthnicityID, 
	   r.Ethnicity, 
	   r.EthnicityGroup, 

	   r.ResidencyID, 
	   r.Residency,

	   p.EmploymentStatusID,

	   r.PersonDateOfBirth,
	   r.GenderID,
	   r.Gender
FROM       pbi.vw_FactReferral r
INNER JOIN pbi.vw_DimPerson    p ON r.PersonID = p.PersonID

WHERE r.IsActiveToday = 1  
AND   r.ReferralEndDate IS NULL

GO

