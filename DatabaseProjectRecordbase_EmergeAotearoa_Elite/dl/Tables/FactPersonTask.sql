CREATE TABLE [dl].[FactPersonTask] (
    [PersonTaskID]            INT            NOT NULL,
    [PersonID]                INT            NOT NULL,
    [PersonTaskName]          NVARCHAR (300) NOT NULL,
    [PersonTaskDescription]   NVARCHAR (MAX) NULL,
    [PersonTaskDueDate]       DATETIME       NOT NULL,
    [PersonTaskCompletedDate] DATETIME       NULL,
    [PersonTaskCreatedUserID] INT            NOT NULL,
    [PersonTaskCreatedDate]   DATETIME       NOT NULL,
    [AssignedUserID]          INT            NULL,
    [ReferralID]              INT            NULL,
    CONSTRAINT [PK_dl_FactPersonTask] PRIMARY KEY CLUSTERED ([PersonTaskID] ASC)
);


GO

