
CREATE View [ot].[vw_Child]
AS
SELECT
		DP.PersonFirstName as [Child first name],
		DP.PersonLastName as [Child last name],
		DP.PersonDateOfBirth as [Child date of birth] 
FROM
		dl.DimPerson DP

INNER JOIN
		dl.FactReferral FR on FR.PersonID = DP.PersonID
WHERE
    (FR.TeamID = 602) 
	AND	(FR.ReferralEndDate is Null
     OR FR.ReferralEndDate > getdate() -31) --Only the last month or still active
     AND (FR.CurrentReferralStatusTypeID not in(13, 15, 20))

GO

