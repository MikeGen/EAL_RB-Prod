

CREATE VIEW [sf].[vw_anonym_FactReferral]
as
SELECT fr.ReferralID, 
       fr.PersonID, 
       fr.ReferralReceivedDate, 
       fr.SourceReferrerID, 
       fr.SourceReferralID, 
       fr.TeamID, 
       fr.OrganisationID, 
       fr.CurrentReferralStatusTypeID, 
       fr.ReferralPriorityID, 
       fr.ReferralExpectedArrivalDate, 
       fr.ReferralExpectedDepartureDate, 
       fr.ReferralActualArrivalDate, 
       fr.ReferralActualDepartureDate, 
       fr.ReferralEndDate, 
       'ReferralNotes for' + cast( PersonID as varchar)     AS ReferralNotes , 
       fr.OldReferralID, 
       fr.OldMovementID, 
       'ReferralUDF1 for' + cast( PersonID as varchar)     AS ReferralUDF1, 
       'ReferralUDF2 for' + cast( PersonID as varchar)     AS ReferralUDF2, 
       'ReferralUDF3 for' + cast( PersonID as varchar)     AS ReferralUDF3, 
       'ReferralUDF4 for' + cast( PersonID as varchar)     AS ReferralUDF4, 
       'ReferralUDF5 for' + cast( PersonID as varchar)     AS ReferralUDF5, 
       fr.InterviewUserID, 
       fr.ReferralInterviewDate, 
       fr.ReferralCreatedUserID, 
       fr.ReferralCreatedDate, 
       fr.ReferralReferralType
FROM dl.FactReferral fr

GO

