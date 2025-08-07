CREATE TABLE [dl].[DimPresentingIssue] (
    [PresentingIssueID]            INT            NOT NULL,
    [PresentingIssueCode]          NVARCHAR (50)  NOT NULL,
    [PresentingIssueName]          NVARCHAR (150) NOT NULL,
    [PresentingIssueDescription]   NVARCHAR (255) NULL,
    [PresentingIssueParentID]      INT            NULL,
    [PresentingIssueCreatedDate]   DATETIME2 (7)  NOT NULL,
    [PresentingIssueCreatedUserID] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([PresentingIssueID] ASC)
);


GO

