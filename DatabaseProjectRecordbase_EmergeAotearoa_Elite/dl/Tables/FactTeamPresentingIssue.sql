CREATE TABLE [dl].[FactTeamPresentingIssue] (
    [TeamPresentingIssueId]            INT           IDENTITY (1, 1) NOT NULL,
    [TeamId]                           INT           NOT NULL,
    [PresentingIssueId]                INT           NOT NULL,
    [TeamPresentingIssueCreatedDate]   DATETIME2 (7) NOT NULL,
    [TeamPresentingIssueCreatedUserID] INT           NOT NULL,
    [TeamPresentingIssueDeletedDate]   DATETIME2 (7) NULL,
    [TeamPresentingIssueDeletedUserID] INT           NULL,
    PRIMARY KEY CLUSTERED ([TeamPresentingIssueId] ASC)
);


GO

