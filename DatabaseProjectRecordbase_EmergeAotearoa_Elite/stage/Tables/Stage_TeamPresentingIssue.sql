CREATE TABLE [stage].[Stage_TeamPresentingIssue] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [TeamId]            INT           NOT NULL,
    [PresentingIssueId] INT           NOT NULL,
    [CreatedDate]       DATETIME2 (7) NOT NULL,
    [CreatedUserID]     INT           NOT NULL,
    [ModifiedDate]      DATETIME2 (7) NULL,
    [ModifiedUserID]    INT           NULL,
    [DeletedDate]       DATETIME2 (7) NULL,
    [DeletedUserID]     INT           NULL
);


GO

