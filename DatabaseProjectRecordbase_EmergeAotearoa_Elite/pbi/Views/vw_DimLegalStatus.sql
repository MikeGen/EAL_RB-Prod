CREATE VIEW pbi.vw_DimLegalStatus
AS 

SELECT dls.LegalStatusID, dls.LegalStatusText 
FROM dl.DimLegalStatus dls

GO

