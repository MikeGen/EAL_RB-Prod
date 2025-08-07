create VIEW pbi.vw_FactCustomField_GPOnly
AS 

SELECT     fc.EntityId, 
		   cf.CustomFieldId, 
		   cf.CustomFieldName, 
		   lk.LookupID, 
		   lk.LookupGroupID, 
		   lk.LookupValue
FROM       dl.FactCustomFieldDataItem fc
INNER JOIN dl.DimCustomField          cf  ON cf.CustomFieldId = fc.CustomFieldId   -- to restrict to custom column columns of GPOnly and GPRegistration
INNER JOIN dl.DimLookup               lk  ON lk.LookupID      = fc.LookupId        -- the actual value of eg GPOnly=Yes or No
WHERE ( cf.CustomFieldName = 'GPOnly' OR cf.CustomFieldName = 'GPRegistration' )

GO

