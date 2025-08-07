CREATE VIEW pbi.vw_FirstAndLastOutcomes
AS 

WITH FirstLastOutcomeDates
          (EntityID, 
		   FirstResponseDate,
		   LastResponseDate)
AS
   (
	SELECT f.EntityID,
		   min(f.DynamicFormInstanceCreatedDate)  AS FirstResponseDate,
		   max(f.DynamicFormInstanceCreatedDate)  AS LastResponseDate
	FROM  dl.FactDynamicFormInstance f
	WHERE f.DynamicFormTemplateID = 1087 -- get only Outcomes
	GROUP BY f.EntityID
    )

SELECT flod.EntityID,
       --
       coalesce(
                (SELECT TOP 1 fr.TeamID     -- find referral active on the last DynamicFormInstanceCreatedDate of the Client and get its Team
                 FROM       dl.FactReferral fr 
                 INNER JOIN dl.DimReferralStatusType drst ON fr.CurrentReferralStatusTypeID = drst.ReferralStatusTypeID
                 WHERE fr.PersonID                 =       flod.EntityID
                 AND   drst.ReferralStatusTypeCode IN      ('Accepted') -- was also , 'Pending', 'Waitlisted' , 'Discharged')
				 AND   fr.ReferralReferralType = 'InboundReferral'
                 AND   flod.LastResponseDate       BETWEEN fr.ReferralCreatedDate AND coalesce(fr.ReferralEndDate, cast('31-Dec-2999' as Date)) 
                 ) ,
                -- if that is null, just find the most recent one
                (SELECT TOP 1 fr.TeamID     -- find most recent referral active of the Client and get its Team
                 FROM       dl.FactReferral fr 
                 --INNER JOIN dl.DimReferralStatusType drst ON fr.CurrentReferralStatusTypeID = drst.ReferralStatusTypeID
                 WHERE fr.PersonID                 =       flod.EntityID
                 --AND   drst.ReferralStatusTypeCode IN      ('Accepted') -- was also , 'Pending', 'Waitlisted' , 'Discharged')
                 AND   fr.ReferralCreatedDate = 
            	         (
                          SELECT     max(frLast.ReferralCreatedDate)
                          FROM       dl.FactReferral frLast
                          --INNER JOIN dl.DimReferralStatusType drst ON frLast.CurrentReferralStatusTypeID = drst.ReferralStatusTypeID
                          WHERE frLast.PersonID             =       flod.EntityID
						  AND   frLast.ReferralReferralType = 'InboundReferral'
                          --AND   drst.ReferralStatusTypeCode IN      ('Accepted') -- was also , 'Pending', 'Waitlisted' , 'Discharged')
                          )
                  ) 
		)as TeamID,
	   --
       cast(flod.FirstResponseDate AS Date) AS FirstResponseDate,
       cast(
            (SELECT TOP 1 ao.DynamicFormInstanceResponse FROM dl.FactDynamicFormInstance ao
             WHERE ao.DynamicFormTemplateID          = 1087 -- get only Outcomes 
             AND   ao.EntityID                       = flod.EntityID 
             AND   ao.DynamicFormInstanceCreatedDate = flod.FirstResponseDate
             ) AS XML)                  AS FirstResponse_XML,
	   --
       cast(flod.LastResponseDate  AS Date) AS LastResponseDate ,
	   cast(
            (SELECT TOP 1 ao.DynamicFormInstanceResponse FROM dl.FactDynamicFormInstance ao
             WHERE ao.DynamicFormTemplateID          = 1087 -- get only Outcomes 
             AND   ao.EntityID                       = flod.EntityID 
             AND   ao.DynamicFormInstanceCreatedDate = flod.LastResponseDate
             ) AS XML)                  AS LastResponse_XML
       --
FROM FirstLastOutcomeDates flod

GO

