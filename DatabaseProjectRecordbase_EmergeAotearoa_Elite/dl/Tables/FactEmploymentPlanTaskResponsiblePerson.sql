CREATE TABLE [dl].[FactEmploymentPlanTaskResponsiblePerson] (
    [EmploymentPlanTaskResponsiblePersonId]            INT           NOT NULL,
    [EmploymentPlanTaskId]                             INT           NOT NULL,
    [EmploymentPlanTaskResponsiblePersonEntityType]    NVARCHAR (50) NULL,
    [EntityId]                                         INT           NULL,
    [EmploymentPlanTaskResponsiblePersonOtherPerson]   NVARCHAR (50) NULL,
    [EmploymentPlanTaskResponsiblePersonCreatedDate]   DATETIME      NOT NULL,
    [EmploymentPlanTaskResponsiblePersonCreatedUserId] INT           NOT NULL,
    CONSTRAINT [PK_dl_FactEmploymentPlanTaskResponsiblePerson] PRIMARY KEY CLUSTERED ([EmploymentPlanTaskResponsiblePersonId] ASC)
);


GO

