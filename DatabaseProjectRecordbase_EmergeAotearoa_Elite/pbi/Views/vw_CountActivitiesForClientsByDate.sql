CREATE VIEW pbi.vw_CountActivitiesForClientsByDate
AS 

SELECT  apClt.EntityID                       AS ClientPersonID,
        cast(fa.ActivityStartDate AS date)   AS ActivityStartDate ,
		apClt.ActivityID,
		dabt.ContactNoContact, 
		dabt.ActivityBreakdownCode, 
		dabt.ActivityBreakdownName,
		dabt.ActivityBreakdownParentName,
		--
		fab.ActivityBreakdownDuration,
	    fab.ActivityBreakdownCreatedUserID   AS EmpUserID
        --count(DISTINCT apClt.ActivityID)     AS ActivityCount

FROM       dl.FactActivityParticipant      apClt
INNER JOIN dl.FactActivity                 fa    ON apClt.ActivityID = fa.ActivityID
INNER JOIN dl.FactActivityBreakdown        fab   ON fa.ActivityID    = fab.ActivityID
INNER JOIN pbi.vw_DimActivityBreakdownType dabt  ON fab.ActivityBreakdownTypeID = dabt.ActivityBreakdownTypeID
WHERE      apClt.ActivityParticipantEntityType = 'Person'

GO

