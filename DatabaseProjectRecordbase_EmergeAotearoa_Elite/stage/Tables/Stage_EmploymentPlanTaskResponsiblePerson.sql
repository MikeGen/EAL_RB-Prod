CREATE TABLE [stage].[Stage_EmploymentPlanTaskResponsiblePerson] (
    [Id]                   INT           NOT NULL,
    [EmploymentPlanTaskId] INT           NOT NULL,
    [EntityType]           NVARCHAR (50) NULL,
    [EntityId]             INT           NULL,
    [OtherPerson]          NVARCHAR (50) NULL,
    [CreatedDate]          DATETIME      NOT NULL,
    [CreatedUserId]        INT           NOT NULL,
    [ModifiedDate]         DATETIME      NULL,
    [ModifiedUserId]       INT           NULL,
    [DeletedDate]          DATETIME      NULL,
    [DeletedUserId]        INT           NULL
);


GO

