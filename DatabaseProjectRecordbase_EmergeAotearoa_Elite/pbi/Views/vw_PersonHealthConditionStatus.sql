CREATE VIEW pbi.vw_PersonHealthConditionStatus
AS 

--SELECT dp.PersonID, 'Health Conditions Missing' as HealthConditionStatus
--FROM   pbi.vw_DimPerson   dp
--WHERE  dp.PersonID NOT IN (SELECT fr.PersonID FROM pbi.vw_FactReferral fr where fr.PersonHealthConditionHealthConditionType IS NULL )

--UNION ALL

SELECT dp.PersonID, 'Mental Health Condition Missing' as HealthConditionStatus
FROM   pbi.vw_DimPerson   dp
WHERE  dp.PersonID NOT IN (SELECT fr.PersonID FROM pbi.vw_FactReferral fr WHERE fr.PersonHealthConditionHealthConditionType = 'MentalHealthCondition' )

UNION ALL

SELECT dp.PersonID, 'Physical Health Condition Missing' as HealthConditionStatus
FROM   pbi.vw_DimPerson   dp
WHERE  dp.PersonID NOT IN (SELECT fr.PersonID FROM pbi.vw_FactReferral fr WHERE fr.PersonHealthConditionHealthConditionType = 'PhysicalHealthCondition' )

GO

