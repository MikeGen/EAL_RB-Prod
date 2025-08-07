CREATE VIEW pbi.vw_DimTeam
AS 

SELECT dc.CompanyID, dc.CompanyDescription,
       dt.TeamID, dt.TeamCode, dt.TeamName, dt.TeamDescription, dt.TeamFunctionID, dt.TeamStartDate, dt.TeamEndDate, dt.AreaID, dt.ContractID, dt.TeamUDF5,
	   tf.TeamFunctionName, tf.TeamFunctionDescription
FROM       dl.DimTeam         dt
INNER JOIN dl.DimCompany      dc ON dc.CompanyID = dt.CompanyID
INNER JOIN dl.DimTeamFunction tf ON dt.TeamFunctionID = tf.TeamFunctionID

WHERE dc.CompanyCompanyName = 'Emerge Aotearoa'

GO

