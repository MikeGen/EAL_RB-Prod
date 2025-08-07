CREATE VIEW pbi.vw_FactActivity
AS 

SELECT  fa.ActivityID, fa.ActivityStartDate, fa.ActivityEndDate, fa.ActivityDescription, fa.ActivitySubject, 
        fa.ActivityTypeID, fa.TeamID, fa.ActivityClassificationID

FROM       dl.FactActivity             fa



-- old - pre 20190927 - before making major mods of separting FactActivityParticipant from FactActivity
--SELECT  fa.ActivityID, fa.ActivityStartDate, fa.ActivityEndDate, fa.ActivityDescription, fa.ActivitySubject, 
--        fa.ActivityTypeID, fa.TeamID, fa.ActivityClassificationID,
--        apClt.ReferralID, 
--		dp.PersonID         AS ClientPersonID,
--		dp.PersonFirstName  AS ClientFirstName, 
--		dp.PersonLastName   AS ClientLastName,
--		du.UserID           AS EmpUserID,
--        du.UserFirstName    AS EmpUserFirstName,   
--		du.UserLastName     AS EmpUserLastName,  
--		du.UserEmailAddress AS EmpUserEmailAddress

--FROM       dl.FactActivity             fa
--INNER JOIN dl.FactActivityParticipant  apClt ON fa.ActivityID  = apClt.ActivityID AND apClt.ActivityParticipantEntityType = 'Person'
--INNER JOIN dl.FactActivityParticipant  apEmp ON fa.ActivityID  = apEmp.ActivityID AND apEmp.ActivityParticipantEntityType = 'User'
--INNER JOIN dl.DimPerson                dp    ON apClt.EntityID = dp.PersonID
--INNER JOIN dl.DimUser                  du    ON apEmp.EntityID = du.UserID

----WHERE  fa.ActivityEndDate > dateadd(year, -2, getdate())  -- bring only last 2 years' data
----OR     fa.ActivityEndDate IS NULL                         -- and also the current ones

GO

