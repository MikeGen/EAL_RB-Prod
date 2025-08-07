CREATE VIEW [pbi].[vw_DimActivityBreakdownType]
AS 

SELECT abtPar.ActivityBreakdownTypeCode AS ContactNoContact, 
       abtPar.ActivityBreakdownTypeName AS ActivityBreakdownParentName,
       abtL1.ActivityBreakdownTypeID    AS ActivityBreakdownTypeID, 
	   abtL1.ActivityBreakdownTypeCode  AS ActivityBreakdownCode, 
	   abtL1.ActivityBreakdownTypeName  AS ActivityBreakdownName,
	   (case 
        when abtPar.ActivityBreakdownTypeCode = 'CO' and abtL1.ActivityBreakdownTypeCode     like '%FTF%' then 'Face to Face'  
	    when abtPar.ActivityBreakdownTypeCode = 'CO' and abtL1.ActivityBreakdownTypeCode not like '%FTF%' then 'Contact Only' 
		else 'No Contact'
        end
        ) 	   AS DerivedContactType
FROM dl.DimActivityBreakdownType abtL1 
INNER JOIN dl.DimActivityBreakdownType abtPar ON abtPar.ActivityBreakdownTypeID = abtL1.ActivityBreakdownTypeParentID
WHERE abtPar.ActivityBreakdownTypeParentID is NULL

GO

