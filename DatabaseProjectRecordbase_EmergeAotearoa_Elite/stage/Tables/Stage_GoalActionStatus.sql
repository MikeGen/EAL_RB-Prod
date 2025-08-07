CREATE TABLE [stage].[Stage_GoalActionStatus] (
    [ID]                INT            NOT NULL,
    [Code]              NVARCHAR (30)  NOT NULL,
    [Text]              NVARCHAR (50)  NOT NULL,
    [Description]       NVARCHAR (300) NULL,
    [IsCompletedStatus] BIT            NOT NULL,
    [IsCancelledStatus] BIT            NOT NULL,
    [SortIndex]         INT            NOT NULL
);


GO

