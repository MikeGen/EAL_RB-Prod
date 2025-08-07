CREATE TABLE [emp].[FactEmploymentPlanTaskResponsiblePerson] (
    [EmploymentPlanTaskResponsiblePersonId] INT           NOT NULL,
    [EmploymentPlanTaskId]                  INT           NOT NULL,
    [PersonID]                              INT           NULL,
    [UserID]                                INT           NULL,
    [OtherPerson]                           NVARCHAR (50) NULL
);


GO

