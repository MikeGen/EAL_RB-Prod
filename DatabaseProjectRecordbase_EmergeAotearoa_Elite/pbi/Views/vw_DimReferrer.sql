CREATE VIEW pbi.vw_DimReferrer
AS 

SELECT dr.ReferrerID, dr.ReferrerGroupID, dr.ReferrerCode, dr.ReferrerName, dr.ReferrerDescription, dr.ReferrerIsInbound, dr.ReferrerIsOutbound 
FROM dl.DimReferrer dr

GO

