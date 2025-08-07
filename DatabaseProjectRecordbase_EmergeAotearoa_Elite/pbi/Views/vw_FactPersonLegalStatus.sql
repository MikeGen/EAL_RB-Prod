create VIEW pbi.vw_FactPersonLegalStatus
AS 

SELECT l.PersonID, l.LegalStatusID, l.PersonLegalStatusCreatedDate, l.PersonLegalStatusReviewDate
FROM   dl.FactPersonLegalStatus l
WHERE  l.PersonLegalStatusReviewDate = (SELECT max(inr.PersonLegalStatusReviewDate) FROM dl.FactPersonLegalStatus inr WHERE inr.PersonID = l.PersonID)   -- pick only last record

GO

