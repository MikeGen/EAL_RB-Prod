CREATE VIEW pbi.vw_FactIncident
AS 

SELECT   fi.TeamID, 
         cast(fi.IncidentDate AS date) AS IncidentDate,
		 count(distinct fi.IncidentID) AS IncidentCount
FROM       dl.FactIncident       fi 
--INNER JOIN dl.FactIncidentPerson fip ON fi.IncidentID = fip.IncidentID    -- will be neeed when we want details of PersonID
--INNER JOIN dl.DimPerson          dp  ON fip.EntityID  = dp.PersonID       -- will be neeed when we want details of PersonID
INNER JOIN dl.DimTeam            dt  ON fi.TeamID     = dt.TeamID
--WHERE  fi.IncidentDate > dateadd(year, -2, getdate())  -- bring only last 2 years' data

GROUP BY fi.TeamID, cast(fi.IncidentDate AS date)

GO

