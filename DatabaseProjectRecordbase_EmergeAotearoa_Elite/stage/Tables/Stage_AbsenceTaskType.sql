CREATE TABLE [stage].[Stage_AbsenceTaskType] (
    [ID]                      INT            NOT NULL,
    [TeamFunctionID]          INT            NULL,
    [Name]                    NVARCHAR (300) NOT NULL,
    [Description]             NVARCHAR (MAX) NULL,
    [ExpectedCompletionHours] INT            NULL,
    [SortIndex]               INT            NULL,
    [InactiveUserID]          INT            NULL,
    [InactiveDate]            DATETIME       NULL,
    [CreatedUserID]           INT            NOT NULL,
    [CreatedDate]             DATETIME       NOT NULL,
    [ModifiedUserID]          INT            NULL,
    [ModifiedDate]            DATETIME       NULL,
    [DeletedUserID]           INT            NULL,
    [DeletedDate]             DATETIME       NULL,
    [RelatedUrl]              NVARCHAR (500) NULL
);


GO

