CREATE VIEW pbi.vw_DimReferralStatusTypeReason
AS 

SELECT rstr.ReferralStatusTypeReasonID, rstr.ReferralStatusTypeID, rstr.ReferralStatusTypeReasonCode, rstr.ReferralStatusTypeReasonDescription
FROM dl.DimReferralStatusTypeReason rstr

GO

