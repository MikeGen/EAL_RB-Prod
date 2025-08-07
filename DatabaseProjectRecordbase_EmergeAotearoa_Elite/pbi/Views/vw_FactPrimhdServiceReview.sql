CREATE VIEW pbi.vw_FactPrimhdServiceReview
AS 

SELECT  sr.PersonId, 
        sr.PrimhdServiceReviewReviewDate, 
		sr.ReferralId, 
		acs.PRIMHDReviewAccommodationStatusText, 
		es.PRIMHDReviewEmploymentStatusText,
		wp.PRIMHDReviewWellnessPlanStatusText,
		eds.PRIMHDReviewEducationStatusText,
	sr.PrimhdServiceReviewCreatedDate
FROM dl.FactPrimhdServiceReview sr
INNER JOIN dl.DimPRIMHDReviewAccommodationStatus acs ON sr.AccommodationStatusId = acs.PRIMHDReviewAccommodationStatusID
INNER JOIN dl.DimPRIMHDReviewEmploymentStatus es ON sr.EmploymentStatusId = es.PRIMHDReviewEmploymentStatusID
INNER JOIN dl.DimPRIMHDReviewWellnessPlanStatus wp ON sr.WellnessPlanStatusId = wp.PRIMHDReviewWellnessPlanStatusID
INNER JOIN dl.DimPRIMHDReviewEducationStatus eds ON sr.EducationStatusId = eds.PRIMHDReviewEducationStatusID

where primhdServiceReviewCreatedDate > DATEADD(year, -1, GETDATE() )

GO

