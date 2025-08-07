CREATE VIEW pbi.vw_DimReferralStatusType
AS 

SELECT drst.ReferralStatusTypeID, drst.ReferralStatusTypeCode, drst.ReferralStatusTypeText, drst.ReferralStatusTypeDescription, drst.ReferralStatusTypeGroup 
FROM dl.DimReferralStatusType drst

GO

