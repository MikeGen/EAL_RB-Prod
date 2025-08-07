CREATE TABLE [stage].[Stage_TeamActivityClassification] (
    [ID]                       INT      NOT NULL,
    [ActivityClassificationID] INT      NOT NULL,
    [TeamID]                   INT      NOT NULL,
    [InactiveUserID]           INT      NULL,
    [InactiveDate]             DATETIME NULL,
    [CreatedUserID]            INT      NOT NULL,
    [CreatedDate]              DATETIME NOT NULL,
    [ModifiedUserID]           INT      NULL,
    [ModifiedDate]             DATETIME NULL,
    [DeletedUserID]            INT      NULL,
    [DeletedDate]              DATETIME NULL
);


GO

