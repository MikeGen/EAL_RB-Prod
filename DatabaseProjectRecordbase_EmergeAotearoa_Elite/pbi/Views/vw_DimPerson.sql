CREATE VIEW pbi.vw_DimPerson
AS 

SELECT     DISTINCT
           dp.PersonID, 
           dp.TitleID, 
		   dp.PersonFirstName, 
		   dp.PersonLastName, 
		   dp.PersonPreferredName, 
		   dp.PersonDateOfBirth, 
		   dp.GenderID, 
		   dp.MaritalStatusID, 
		   dp.ReligionID, 
		   dp.ResidencyID, 
		   dp.NationalityID, 
		   dp.PersonDeceasedDate, 
		   coalesce(dp.Ethnicity1ID, dp.Ethnicity2ID, dp.Ethnicity3ID, dp.Ethnicity4ID, dp.Ethnicity5ID) AS EthnicityID,
		   dp.EmploymentStatusID,
   		   CASE WHEN EXISTS 
				(SELECT 1 FROM dl.FactReferral fr 
                 INNER JOIN dl.DimReferralStatusType drst ON fr.CurrentReferralStatusTypeID = drst.ReferralStatusTypeID
                 WHERE fr.PersonID = dp.PersonID
				 AND drst.ReferralStatusTypeCode IN ( 'Accepted') -- was also , 'Pending', 'Waitlisted' , 'Discharged')
				 AND fr.ReferralReferralType = 'InboundReferral'
				 AND fr.ReferralEndDate IS NULL
				 )
				 THEN 1
				 ELSE 0
		   END   as IsActiveToday,
		   dp.LivingSituationID,
           dp.EducationalActivityTypeID
FROM       dl.DimPerson dp
-- remove all DimPerson recs that are for "on thin file" as contacts/helpers of the actual Client; or Incorrectly entered rows
INNER JOIN dl.FactReferral fRef   ON fRef.PersonID = dp.PersonID

GO

