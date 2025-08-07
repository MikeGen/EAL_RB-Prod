CREATE VIEW pbi.vw_FactDynamicFormInstance
AS 


	SELECT f.EntityID,
		   cast(f.DynamicFormInstanceCreatedDate AS Date)   AS CreatedDate,
		   cast(f.DynamicFormInstanceResponse    AS xml)    AS Response_XML,

           (SELECT TOP 1 fr.TeamID     -- find referral active on the last DynamicFormInstanceCreatedDate of the Client and get its Team
           FROM       dl.FactReferral fr 
           INNER JOIN dl.DimReferralStatusType drst ON fr.CurrentReferralStatusTypeID = drst.ReferralStatusTypeID
           WHERE fr.PersonID = f.EntityID
           AND   drst.ReferralStatusTypeCode IN ('Accepted') -- was also , 'Pending', 'Waitlisted' , 'Discharged')
           
           AND   (SELECT max(fMax.DynamicFormInstanceCreatedDate) from dl.FactDynamicFormInstance fMax WHERE fMax.EntityID = f.EntityID)
           				  BETWEEN fr.ReferralCreatedDate AND coalesce(fr.ReferralEndDate, cast('31-Dec-2999' as Date)) 
           ) as TeamID_onLastOutcomeDate

	FROM  dl.FactDynamicFormInstance f
	WHERE f.DynamicFormTemplateID = 1087 -- get only Outcomes

GO

