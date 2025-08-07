CREATE TABLE [stage].[Stage_HospitalisationTaskType] (
    [ID]                      INT            NOT NULL,
    [Name]                    NVARCHAR (300) NOT NULL,
    [Description]             NVARCHAR (MAX) NULL,
    [ExpectedCompletionHours] INT            NULL,
    [InactiveUserID]          INT            NULL,
    [InactiveDate]            DATETIME       NULL,
    [CreatedUserID]           INT            NOT NULL,
    [CreatedDate]             DATETIME       NOT NULL,
    [ModifiedUserID]          INT            NULL,
    [ModifiedDate]            DATETIME       NULL,
    [DeletedUserID]           INT            NULL,
    [DeletedDate]             DATETIME       NULL,
    [RelatedUrl]              NVARCHAR (500) NULL,
    [SortIndex]               INT            NULL
);


GO

