CREATE VIEW [pbi].[vw_Last_FactPersonSmokingHistory]
AS 

SELECT  h.PersonID, 
        h.SmokingStatusId, 
        h.PersonSmokingHistoryAssessmentDate,
		h.PersonSmokingHistoryBriefAdviceGiven,
		h.PersonSmokingHistorySupportServicesOffered
FROM  dl.FactPersonSmokingHistory h 
WHERE h.PersonSmokingHistoryAssessmentDate > '2016-05-17'   -- older data may not be reliable
AND   h.PersonSmokingHistoryAssessmentDate  =               -- pick most recent history record of the person
		(SELECT max(hInr.PersonSmokingHistoryAssessmentDate) 
		 FROM   dl.FactPersonSmokingHistory hInr 
		 WHERE  hInr.PersonID = h.PersonID)

GO

