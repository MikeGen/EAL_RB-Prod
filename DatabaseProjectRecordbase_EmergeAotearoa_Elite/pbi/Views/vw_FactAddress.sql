CREATE VIEW pbi.vw_FactAddress
AS 

SELECT     DISTINCT        -- this had to be put in for 1 silly rec in data!
           ad.EntityID,    -- links to PersonID in DimPerson
           ad.AddressName, 
		   ad.AddressLine1, 
		   ad.AddressLine2, 
		   ad.AddressLine3, 
		   ad.AddressSuburb, 
		   ad.AddressTownCity, 
		   ad.AddressPostCode, 
		   ad.AddressIsPostalAddress, 
		   ad.AddressEntityType, 
		   ad.AddressCreatedDate, 
		   ad.AddressIsPrimaryAddress, 
		   ad.AddressComments,

		   dc.CountryName
FROM       dl.FactAddress ad
LEFT OUTER JOIN dl.DimCountry dc ON ad.CountryID = dc.CountryID

WHERE      ad.AddressCreatedDate = (SELECT max(inr.AddressCreatedDate) FROM dl.FactAddress inr WHERE inr.EntityID = ad.EntityID)   -- pick only last address
--
--AND        ad.AddressPostCode IS NOT NULL    -- take useless null postcode data also so that we can show it

GO

