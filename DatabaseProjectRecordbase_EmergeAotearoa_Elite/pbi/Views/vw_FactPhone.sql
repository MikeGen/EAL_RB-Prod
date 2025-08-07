CREATE VIEW pbi.vw_FactPhone
AS 

SELECT 
       fp.EntityID,    -- links to DimPerson on PersonID
       fp.PhoneName, 
	   fp.PhonePhoneNumber, 
	   fp.PhoneNumberTypeID, 
	   fp.PhoneEntityType, 
	   fp.PhoneCreatedDate
FROM   dl.FactPhone fp
WHERE  fp.PhoneCreatedDate = (SELECT max(inr.PhoneCreatedDate) FROM dl.FactPhone inr WHERE inr.EntityID = fp.EntityID)   -- pick only last address

GO

