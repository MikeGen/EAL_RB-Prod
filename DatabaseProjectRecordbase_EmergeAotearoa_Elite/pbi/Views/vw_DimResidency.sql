CREATE VIEW pbi.vw_DimResidency
AS 

SELECT dr.ResidencyID, dr.ResidencyText
FROM dl.DimResidency dr
WHERE dr.ResidencyIsActive = 1   -- bring in only the used Areas

GO

