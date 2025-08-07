CREATE TABLE [stage].[Stage_PersonLegalStatus] (
    [ID]             INT      NOT NULL,
    [PersonID]       INT      NOT NULL,
    [LegalStatusID]  INT      NOT NULL,
    [ReviewDate]     DATETIME NOT NULL,
    [InactiveDate]   DATETIME NULL,
    [InactiveUserID] INT      NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedUserID]  INT      NOT NULL,
    [ModifiedDate]   DATETIME NULL,
    [ModifiedUserID] INT      NULL,
    [DeletedDate]    DATETIME NULL,
    [DeletedUserID]  INT      NULL
);


GO

