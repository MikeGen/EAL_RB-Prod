CREATE TABLE [stage].[Stage_GoalStatus] (
    [ID]                 INT            NOT NULL,
    [GoalID]             INT            NOT NULL,
    [PercentageComplete] INT            NOT NULL,
    [Comments]           NVARCHAR (MAX) NULL,
    [CreatedUserID]      INT            NOT NULL,
    [CreatedDate]        DATETIME       NOT NULL,
    [ModifiedUserID]     INT            NULL,
    [ModifiedDate]       DATETIME       NULL,
    [DeletedUserID]      INT            NULL,
    [DeletedDate]        DATETIME       NULL,
    [ProgressDate]       DATETIME       NOT NULL
);


GO

