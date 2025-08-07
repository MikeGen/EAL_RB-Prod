CREATE VIEW pbi.vw_DimGender
AS 

SELECT     dl.LookupID AS GenderID, dl.LookupValue, dl.LookupText AS Gender, dl.LookupSortIndex AS SortIndex
FROM       dl.DimLookup dl
INNER JOIN dl.DimLookupGroup dlg ON dl.LookupGroupID = dlg.LookupGroupID
WHERE      dlg.LookupGroupName  = 'Gender'

GO

