create VIEW pbi.vw_FactPersonContact
AS 

SELECT pc.PersonID, 
       pc.RelatedContactTypeID, 
	   pc.PersonContactName, 
	   pc.PersonContactRelationship, 
	   pc.PersonContactEmailAddress, 
	   pc.PersonContactPhone, 
	   pc.PersonContactPhoneAlternate, 
	   pc.PersonContactAddress, 
	   pc.PersonContactComments, 
	   pc.PersonContactIsHiddenFromPerson, 
	   pc.PersonContactHiddenReason, 
	   pc.PersonContactConsentToContact, 
	   pc.PersonContactConsentReviewDate, 
       pc.PersonContactInformationDisclosureNotes, 
	   pc.PersonContactIsEmergencyContact, 
	   pc.PreferredContactMethodID, 
	   pc.PersonContactPreferredContactTime, 
	   pc.PersonContactCreatedDate 
FROM dl.FactPersonContact pc

GO

