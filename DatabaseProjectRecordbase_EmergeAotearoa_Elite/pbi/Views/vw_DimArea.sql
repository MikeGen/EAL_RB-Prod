CREATE VIEW pbi.vw_DimArea
AS 

SELECT     da.AreaID, da.AreaName, da.AreaDescription, daParent.AreaName as ParentAreaName, daParent.AreaDescription AS ParentAreaDescription
FROM       dl.DimArea     da
INNER JOIN dl.DimArea     daParent ON da.AreaParentID = daParent.AreaID
--
WHERE    da.AreaID IN (SELECT dt.AreaID from pbi.vw_DimTeam dt)  -- bring in only the used Areas

GO

