CREATE VIEW pbi.vw_FactActivityParticipant_Employee
AS 

SELECT  aptEmp.ActivityID,
        aptEmp.EntityID AS EmpUserID

FROM    dl.FactActivityParticipant  aptEmp
WHERE   aptEmp.ActivityParticipantEntityType = 'User'

GO

