CREATE VIEW [sf].[vw_Snapshot_NoEmergencyContactSmoking]
as
SELECT DISTINCT            -- distinct needed as vwFactRef can return multiple rows for each referral
       2 as CompanyID,     -- 2 is EAL hardcoded
       cast(getdate() AS Date) as SnapshotDate,
       r.TeamID, 
	   r.PersonID, 
	   r.ReferralID ,
	   
	   CASE WHEN NOT EXISTS ( 
		   SELECT * FROM pbi.vw_FactPersonContact fa
		   WHERE fa.PersonID = r.PersonID)
		   THEN  1
		   ELSE  0
	   END       AS  	IsEmergencyContactMissing,

	   CASE WHEN 
	       NOT EXISTS ( 
		   SELECT * FROM pbi.vw_Last_FactPersonSmokingHistory fp
		   WHERE fp.PersonID = r.PersonID)
		   THEN  1
		   ELSE  0
	   END       AS  	IsSmokingMissing,

	   CASE WHEN 
	       NOT EXISTS ( 
		   SELECT * FROM pbi.vw_Last_FactPersonSmokingHistory fp
		   WHERE fp.PersonID = r.PersonID
		   AND   datediff(month, fp.PersonSmokingHistoryAssessmentDate, getdate()) < 3
		   )
		   THEN  1
		   ELSE  0
	   END       AS  	IsSmoking3MonthsMissing,

	   CASE WHEN 
	       NOT EXISTS ( 
		   SELECT * FROM pbi.vw_Last_FactPersonSmokingHistory fp
		   WHERE fp.PersonID = r.PersonID
		   AND   fp.PersonSmokingHistoryAssessmentDate > dateadd(month, -6, GetDate() )
		   AND   fp.PersonSmokingHistoryBriefAdviceGiven = 1)
		   THEN  1
		   ELSE  0
	   END       AS  	NoSmokingAdviceInLast6Months,

	   CASE WHEN 
	       NOT EXISTS ( 
		   SELECT * FROM pbi.vw_Last_FactPersonSmokingHistory fp
		   WHERE fp.PersonID = r.PersonID
		   AND   fp.PersonSmokingHistoryAssessmentDate > dateadd(month, -6, GetDate() )
		   AND   fp.PersonSmokingHistorySupportServicesOffered is not null)
		   THEN  1
		   ELSE  0
	   END       AS  	NoSmokingCessReferralInLast6Months,

       ( 
	       SELECT fp.SmokingStatusId FROM pbi.vw_Last_FactPersonSmokingHistory fp
		   WHERE fp.PersonID = r.PersonID
		)        AS  	LastSmokingStatusId

FROM pbi.vw_FactReferral r

WHERE r.IsActiveToday = 1  
AND   r.ReferralEndDate IS NULL

GO

