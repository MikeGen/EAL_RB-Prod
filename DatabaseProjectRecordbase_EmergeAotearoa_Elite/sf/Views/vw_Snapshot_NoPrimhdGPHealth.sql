CREATE VIEW [sf].[vw_Snapshot_NoPrimhdGPHealth]
as
SELECT DISTINCT            -- distinct needed as vwFactRef can return multiple rows for each referral
       2 as CompanyID,     -- 2 is EAL hardcoded
       cast(getdate() AS Date) as SnapshotDate,
       r.TeamID, 
	   r.PersonID, 
	   r.ReferralID ,
	   
	   CASE WHEN NOT EXISTS ( 
		   SELECT * FROM pbi.vw_FactPrimhdServiceReview fa
		   WHERE fa.PersonID   = r.PersonID
		   AND   fa.ReferralID = r.ReferralID)
		   THEN  1
		   ELSE  0
	   END       AS  	IsPrimhdMissing,

	   (
		   SELECT max(PrimhdServiceReviewReviewDate) FROM pbi.vw_FactPrimhdServiceReview fa
		   WHERE fa.PersonID   = r.PersonID
		   AND   fa.ReferralID = r.ReferralID
	   )     AS  	LastPrimhdReviewDate,

       CASE WHEN NOT EXISTS ( 
		   SELECT * FROM pbi.vw_FactCustomField_GPOnly fp
		   WHERE fp.EntityID = r.PersonID
   		   AND   fp.CustomFieldName = 'GPOnly')
		   THEN  1
		   ELSE  0
	   END       AS  	IsGPOnlyMissing,

	   CASE WHEN NOT EXISTS ( 
		   SELECT * FROM pbi.vw_FactCustomField_GPOnly fp
		   WHERE fp.EntityID = r.PersonID
		   AND   fp.CustomFieldName = 'GPRegistration')
		   THEN  1
		   ELSE  0
	   END       AS  	IsGPRegistrationMissing,
	   
	   CASE WHEN NOT EXISTS (
	       SELECT * FROM pbi.vw_FactReferral fr 
		   WHERE fr.PersonID = r.PersonID AND fr.ReferralID = r.ReferralID AND fr.PersonHealthConditionHealthConditionType IS NOT NULL )    -- i.e. all Referrals for the Client are NULLs for HealthConditions
		   THEN  1
		   ELSE  0
	   END       AS  	IsHealthConditionMissing,

	   CASE WHEN NOT EXISTS (
	       SELECT * FROM pbi.vw_FactReferral fr 
		   WHERE fr.PersonID = r.PersonID AND fr.ReferralID = r.ReferralID AND fr.PersonHealthConditionHealthConditionType = 'MentalHealthCondition' )    -- i.e. none of Client's Referrals are MentalHealthConditions
		   THEN  1
		   ELSE  0
	   END       AS  	IsMentalHealthConditionMissing,

	   CASE WHEN NOT EXISTS (
	       SELECT * FROM pbi.vw_FactReferral fr 
		   WHERE fr.PersonID = r.PersonID AND fr.ReferralID = r.ReferralID AND fr.PersonHealthConditionHealthConditionType = 'PhysicalHealthCondition' )    -- i.e. none of Client's Referrals are PhysicalHealthConditions
		   THEN  1
		   ELSE  0
	   END       AS  	IsPhysicalHealthConditionMissing

FROM pbi.vw_FactReferral r

WHERE r.IsActiveToday = 1  
AND   r.ReferralEndDate IS NULL

GO

