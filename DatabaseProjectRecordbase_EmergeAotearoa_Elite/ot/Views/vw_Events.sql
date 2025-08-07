

CREATE View [ot].[vw_Events]

As 

/*   EVENT TABLE   */
/*** Get data ***/
SELECT distinct
    11638 AS [Partner_ID],
    try_cast((
        /** Inner Query to get just the CYRAS Reference Number **/
        SELECT
            FPRN1.PersonReferenceNumberReferenceNumber
        FROM
            dl.FactPersonReferenceNumber FPRN1
            INNER JOIN dl.FactReferral FR1 ON FR1.PersonID = FPRN1.PersonID
            LEFT JOIN dl.DimReferenceNumberType DRNT1 ON DRNT1.ReferenceNumberTypeID = FPRN1.ReferenceNumberTypeID
        WHERE
            FR1.TeamID = 602 --single Team at this time 
            AND FPRN1.ReferenceNumberTypeID = 10 --CYRAS number
            AND FR1.PersonID = DP.PersonID --For specified client
    ) as int) AS [CYRAS_ID],
    'Care staff model' AS [Event_Type_1],
	Case personstatustypeID
		When 4 Then 'Primary care'
		When 2 Then 'Away on short break'
		Else 'Primary care'
		END
		  AS [Event_Type_2],
	Pivot_table.Accepted AS [Event_Start_Date],
	Pivot_table.Discharged AS [Event_End_Date],

        /** Inner Query to get the Contract ID **/
    (SELECT
            Left(FPRN1.PersonReferenceNumberReferenceNumber, 6)
        FROM
            dl.FactPersonReferenceNumber FPRN1
            INNER JOIN dl.FactReferral FR1 ON FR1.PersonID = FPRN1.PersonID
            LEFT JOIN dl.DimReferenceNumberType DRNT1 ON DRNT1.ReferenceNumberTypeID = FPRN1.ReferenceNumberTypeID
        WHERE
            FR1.TeamID = 602 --single Team at this time 
            AND FPRN1.ReferenceNumberTypeID = 11 --Replace with correct Reference Number 
            AND FR1.PersonID = DP.PersonID --For specified client
    ) AS [Contract_ID],
    FC.CustomFieldDataItemString AS [Contract_Service_Code], --CustomField Front Ended in Referral Edit
    -- Against Referral instead of Client
   TeamID AS [Caregiver_ID_1],
    --Team as Care home
    FAD.AddressLine1 AS [Child_Street],    --Filtered to Primary only later
    FAD.AddressSuburb AS [Child_Suburb],    --         "   "
    FAD.AddressTownCity AS [Child_City],    --         "   "
    FAD.AddressPostCode AS [Child_Postcode], --     "   "
    CONCAT ('11638', FR.ReferralID) AS [Record_ID]

FROM
    dl.FactReferral FR
    /*** Make joins to relevant tables to allow for the full selection ***/
	INNER JOIN dl.FactPersonStatus PS ON FR.PersonID = PS.PersonID
    INNER JOIN dl.DimPerson DP ON FR.PersonID = DP.PersonID
	INNER JOIN dl.FactReferralStatus RS on FR.ReferralID = RS.ReferralID
    INNER JOIN dl.FactPersonRelationship PR ON DP.PersonID = PR.PersonID
	INNER JOIN dl.DimUser DU ON PR.UserID = DU.UserID
	INNER JOIN dl.FactActivityParticipant FParP ON DU.UserID = FParP.EntityID
    INNER JOIN dl.FactAddress FAD ON DP.PersonID = FAD.EntityID
	INNER JOIN dl.FactCustomFieldDataItem FC ON FR.ReferralID = FC.EntityId
	INNER JOIN dl.DimCustomField DC ON FC.CustomFieldId = DC.CustomFieldId
	INNER JOIN 
	(SELECT
	RS.ReferralStatusStartDate,
	ST.ReferralStatusTypeText,
RS.[ReferralID]
FROM dl.FactReferralStatus RS
INNER JOIN dl.DimReferralStatusType AS ST ON ST.ReferralStatusTypeID = RS.ReferralStatusTypeID
INNER JOIN dl.factReferral FR ON RS.ReferralID = FR.ReferralID
WHERE FR.TeamID = 602 ) AS cte PIVOT(
MAX(ReferralStatusStartDate)
FOR ReferralStatusTypeText in ([Accepted], [Discharged])
) AS [pivot_table] ON pivot_table.ReferralID = FR.ReferralID

    /*** Filter results ***/
WHERE
    /*(RS.ReferralStatusStartDate Between DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0) --First day of previous month
	AND 
	DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1)) --Last Day of previous month
	AND */
	RS.ReferralStatusTypeID in (16,19)
	AND
    FR.TeamID in (602) --Only one team at this time
	AND 
	FAD.AddressIsPrimaryAddress = 1

GO

