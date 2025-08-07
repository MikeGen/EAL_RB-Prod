CREATE VIEW [pbi].[vw_FactActivityBreakdown]
AS 

SELECT ab.ActivityID, 
       ab.ActivityBreakdownTypeID AS ActivityBreakdownTypeID, 
       ab.ActivityBreakdownDuration,
	   ab.ActivityBreakdownCreatedUserID          AS EmpUserID
FROM   dl.FactActivityBreakdown ab  
WHERE  ab.ActivityBreakdownCreatedUserID  <> -1     -- remove junk rows

GO

