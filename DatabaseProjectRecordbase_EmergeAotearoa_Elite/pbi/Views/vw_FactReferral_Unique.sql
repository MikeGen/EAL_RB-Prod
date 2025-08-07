CREATE VIEW pbi.vw_FactReferral_Unique
AS 

-- Note: this view has unique ReferralIDs - as against pbi.vw_FactReferral which had multiple rows for each referral.

SELECT fr.ReferralID, 
       fr.PersonID, 
	   fr.ReferralReceivedDate, 
	   fr.SourceReferrerID, 
	   fr.SourceReferralID, 
	   fr.TeamID, 
	   fr.OrganisationID, 
	   fr.CurrentReferralStatusTypeID, 
	   fr.ReferralPriorityID, 
	   fr.ReferralEndDate, 
	   fr.ReferralCreatedDate, 
	   fr.ReferralReferralType,
	   --
       dp.TitleID, 
	   dp.PersonFirstName, 
	   dp.PersonLastName, 
	   (dp.PersonFirstName + ' ' + dp.PersonLastName) as PersonFullName,
	   dp.PersonPreferredName,
	   dp.PersonReferenceNumber, -- also known as NHI Number
	   dp.PersonDateOfBirth, 
	   dp.GenderID, 
	   dp.MaritalStatusID, 
	   dp.ReligionID, 
	   dr.ResidencyID,
	   coalesce(dr.ResidencyText,   'Not Set')     AS Residency,
	   dp.NationalityID, 
	   dp.PersonDeceasedDate, 
       coalesce(dp.Ethnicity1ID, dp.Ethnicity2ID, dp.Ethnicity3ID, dp.Ethnicity4ID, dp.Ethnicity5ID) AS EthnicityID,
   	   CASE WHEN EXISTS 
               (SELECT 1 FROM dl.FactReferral frInr
                INNER JOIN dl.DimReferralStatusType drst ON frInr.CurrentReferralStatusTypeID = drst.ReferralStatusTypeID
                WHERE frInr.PersonID = dp.PersonID -- is same client as in outer sql
				AND   frInr.TeamID   = fr.TeamID   -- look at the same Team as in outer sql
                AND drst.ReferralStatusTypeCode IN ( 'Accepted') -- was also , 'Pending', 'Waitlisted' , 'Discharged')
				AND frInr.ReferralReferralType = 'InboundReferral'
                AND frInr.ReferralEndDate IS NULL
               )
	   THEN 1
	   ELSE 0
	   END   as IsActiveToday,
	   --
	   dg.Gender,
	   coalesce(de.Ethnicity,      'Not Set') AS Ethnicity,
	   coalesce(de.EthnicityGroup, 'Not Set') AS EthnicityGroup,
	   coalesce(de.EthnicityGroupConsolidated, 'Not Set') AS EthnicityGroupConsolidated,
	   --
	   (SELECT count(DISTINCT GoalID) FROM dl.FactGoal fg 
	    WHERE fg.ReferralID = fr.ReferralID
		AND   fg.PersonID   = fr.PersonID
		AND   coalesce(fg.GoalCloseNotCompletedDate, fg.GoalCloseCompletedDate) IS NOT NULL
		) AS GoalsCompleted_Count,

	   (SELECT count(DISTINCT GoalID) FROM dl.FactGoal fg 
	    WHERE fg.ReferralID = fr.ReferralID
		AND   fg.PersonID   = fr.PersonID
		AND   coalesce(fg.GoalCloseNotCompletedDate, fg.GoalCloseCompletedDate) IS NULL
		) AS GoalsNotCompleted_Count,

-------------------------------------------------
	   (SELECT min(apInr.ActivityID) 
        FROM       dl.FactActivityParticipant  apInr
	    WHERE apInr.ReferralID = fr.ReferralID
		)  AS FirstActivityID,

	   (SELECT min(aInr.ActivityStartDate) 
        FROM       dl.FactActivityParticipant  apInr
        INNER JOIN dl.FactActivity             aInr   ON aInr.ActivityID = apInr.ActivityID
	    WHERE apInr.ReferralID = fr.ReferralID
		)  AS FirstActivityStartDate,

	   (SELECT min(apInr.ActivityID) 
        FROM       dl.FactActivityParticipant  apInr
	    WHERE apInr.ReferralID = fr.ReferralID
        AND   apInr.ActivityID in -- should be a "Contact" type of Activity
            (SELECT     abInr.ActivityID
             FROM       dl.FactActivityBreakdown    abInr
             INNER JOIN pbi.vw_DimActivityBreakdownType abtInr ON abtInr.ActivityBreakdownTypeID = abInr.ActivityBreakdownTypeID
             WHERE abtInr.ContactNoContact = 'CO'
             )
        )  AS FirstContactActivityID,

	   (SELECT min(aInr.ActivityStartDate) 
        FROM       dl.FactActivityParticipant  apInr
        INNER JOIN dl.FactActivity             aInr   ON aInr.ActivityID = apInr.ActivityID
	    WHERE apInr.ReferralID = fr.ReferralID
        AND   apInr.ActivityID in -- should be a "Contact" type of Activity
            (SELECT     abInr.ActivityID
             FROM       dl.FactActivityBreakdown    abInr
             INNER JOIN pbi.vw_DimActivityBreakdownType abtInr ON abtInr.ActivityBreakdownTypeID = abInr.ActivityBreakdownTypeID
             WHERE abtInr.ContactNoContact = 'CO'
             )
       )  AS FirstContactActivityStartDate,

       ----
	   (SELECT max(frInr.ReferralID) FROM dl.FactReferral frInr 
	    WHERE frInr.PersonID = fr.PersonID 
		AND   frInr.ReferralEndDate IS NULL
		AND   frInr.TeamID          IS NOT NULL
		AND   frInr.ReferralReferralType = 'InboundReferral'
		)  AS LastOpenAssignedReferralID,
	   (SELECT frInr2.TeamID FROM dl.FactReferral frInr2 
	    WHERE frInr2.ReferralID =
	                 (SELECT max(frInr.ReferralID) FROM dl.FactReferral frInr 
					  WHERE frInr.PersonID = fr.PersonID 
					  AND   frInr.ReferralEndDate IS NULL
					  AND   frInr.TeamID          IS NOT NULL
					  AND   frInr.ReferralReferralType = 'InboundReferral'
					  )
	   )  AS LastOpenReferralTeamID,
           ReferralUDF2    AS  ReferralSource

FROM            dl.FactReferral               fr 
INNER JOIN      dl.DimPerson                  dp   ON fr.PersonID              = dp.PersonID
LEFT OUTER JOIN pbi.vw_DimGender              dg   ON dp.GenderID              = dg.GenderID
LEFT OUTER JOIN pbi.vw_DimEthnicity           de   ON coalesce(dp.Ethnicity1ID, dp.Ethnicity2ID, dp.Ethnicity3ID, dp.Ethnicity4ID, dp.Ethnicity5ID) = de.EthnicityID
LEFT OUTER JOIN pbi.vw_DimResidency           dr   ON dp.ResidencyID           = dr.ResidencyID

WHERE fr.ReferralReferralType = 'InboundReferral'   -- OutboundReferrals and DischargeOutbiundReferrals are Not to be counted in any report


--WHERE  fr.ReferralEndDate > dateadd(year, -2, getdate())  -- bring only last 2 years' data  -- NO, do NOT restrict otherwise not all Clients will be displayed hence commented out
--OR     fr.ReferralEndDate IS NULL                         -- and also the current ones

GO

