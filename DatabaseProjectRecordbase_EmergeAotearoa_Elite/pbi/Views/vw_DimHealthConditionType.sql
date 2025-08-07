CREATE VIEW pbi.vw_DimHealthConditionType
AS 

SELECT     dl.LookupID AS HealthConditionTypeID, dl.LookupValue, dl.LookupText AS HealthConditionType, dl.LookupSortIndex AS SortIndex
FROM       dl.DimLookup dl
INNER JOIN dl.DimLookupGroup dlg ON dl.LookupGroupID = dlg.LookupGroupID
WHERE      dlg.LookupGroupName  IN ('Mental Health Condition', 'Physical Health Condition', 'Substance type')

GO

