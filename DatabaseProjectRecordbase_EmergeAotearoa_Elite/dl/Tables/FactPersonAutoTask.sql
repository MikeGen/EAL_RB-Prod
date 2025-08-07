CREATE TABLE [dl].[FactPersonAutoTask] (
    [PersonAutoTaskID]            INT           NOT NULL,
    [PersonID]                    INT           NOT NULL,
    [PersonAutoTaskEntityType]    NVARCHAR (50) NOT NULL,
    [EntityID]                    INT           NOT NULL,
    [EntityTaskTypeID]            INT           NOT NULL,
    [ActionTypeID]                INT           NULL,
    [PersonAutoTaskActionDate]    DATETIME      NULL,
    [AssignedUserID]              INT           NULL,
    [PersonAutoTaskAssignedDate]  DATETIME      NULL,
    [PersonAutoTaskCreatedUserID] INT           NOT NULL,
    [PersonAutoTaskCreatedDate]   DATETIME      NOT NULL,
    CONSTRAINT [PK_dl_FactPersonAutoTask] PRIMARY KEY CLUSTERED ([PersonAutoTaskID] ASC)
);


GO

