CREATE VIEW pbi.vw_FactEmploymentPlan
AS 

SELECT ep.EmploymentPlanID, 
       ep.EmploymentPlanTemplateID, 
       ep.EmploymentPlanStartDate, 
       ep.EmploymentPlanCloseDate, 
       ep.CurrentPhaseID, 
       ep.PrimaryCaseWorkerID, 
	   u.UserFirstName, u.UserLastName, u.UserPreferredName,
       ep.ReferralID, 
       ep.EmploymentPlanPlanningAndPrepExpectedDuration, 
       ep.EmploymentPlanPlanningAndPrepExpectedActivityHours, 
       ep.EmploymentPlanPlanningAndPrepRequireCompletionOfMandatoryTasks, 
       ep.EmploymentPlanJobSearchExpectedDuration, 
       ep.EmploymentPlanJobSearchExpectedActivityHours, 
       ep.EmploymentPlanJobSearchRequireCompletionOfMandatoryTasks, 
       ep.EmploymentPlanJobSearchStartDate, 
       ep.EmploymentPlanPlacementSupportExpectedDuration, 
       ep.EmploymentPlanPlacementSupportExpectedActivityHours, 
       ep.EmploymentPlanPlacementSupportStartDate, 
       ep.EmploymentPlanCreatedDate, 
       ep.EmploymentPlanCreatedUserID, 
       ep.PersonID, 
       ep.EmploymentPlanClosedComments, 
       ep.ClosedReasonID, 
       ep.EmploymentPlanIsSupportPlan, 
       ep.EmploymentPlanTitle
FROM dl.FactEmploymentPlan ep 
INNER JOIN pbi.vw_DimUser  u ON ep.PrimaryCaseWorkerID = u.UserID
WHERE ep.EmploymentPlanCloseDate > '01-Jan-2019'
OR ep.EmploymentPlanCloseDate IS NULL

GO

