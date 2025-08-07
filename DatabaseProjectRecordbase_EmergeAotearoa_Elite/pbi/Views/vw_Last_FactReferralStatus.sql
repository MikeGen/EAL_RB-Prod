CREATE VIEW pbi.vw_Last_FactReferralStatus
AS 

SELECT r.ReferralStatusID, r.ReferralID, r.ReferralStatusTypeID, r.ReferralStatusStartDate, r.ReferralStatusTypeReasonID, r.ReferralStatusCreatedUserID, r.ReferralStatusCreatedDate, r.ReferralStatusComments 
FROM dl.FactReferralStatus r

WHERE r.ReferralStatusID = -- pick only the last one for the Referral
	(
	SELECT max(rInr.ReferralStatusID) FROM dl.FactReferralStatus rInr
	WHERE rInr.ReferralID = r.ReferralID
	)

GO

