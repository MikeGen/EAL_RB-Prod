create VIEW pbi.vw_DimRelatedContactType
AS 

SELECT ct.RelatedContactTypeID, 
       ct.RelatedContactTypeText,
	   ctParent.RelatedContactTypeText ParentRelatedContactTypeText 
FROM dl.DimRelatedContactType ct
INNER JOIN dl.DimRelatedContactType ctParent ON ct.RelatedContactTypeParentId = ctParent.RelatedContactTypeID
WHERE ct.RelatedContactTypeIsActive = 1

GO

