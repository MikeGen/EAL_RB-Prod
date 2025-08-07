


CREATE View [ot].[vw_Caregiver]

AS

SELECT distinct
		11638 AS [Partner_ID], --Hardcoded supplied by OT
		TeamID AS [Caregiver_ID], --TeamID from Recordbase
		'Care staff model' AS [Caregiver_Event_Type_1], --Hardcoded to not require Ethnicity
		CONCAT(11638 , TeamID) AS [Record_ID] --PartnerID + TeamID

FROM	dl.FactActivityParticipant AS FParUser 

INNER JOIN
		dl.FactActivity AS FA ON FA.ActivityID = FParUser.ActivityID 

WHERE   (FA.TeamID = 602)

GO

