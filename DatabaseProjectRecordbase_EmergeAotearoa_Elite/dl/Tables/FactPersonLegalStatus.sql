CREATE TABLE [dl].[FactPersonLegalStatus] (
    [PersonLegalStatusID]             INT      NOT NULL,
    [PersonID]                        INT      NOT NULL,
    [LegalStatusID]                   INT      NOT NULL,
    [PersonLegalStatusReviewDate]     DATETIME NOT NULL,
    [PersonLegalStatusCreatedDate]    DATETIME NOT NULL,
    [PersonLegalStatusCreatedUserID]  INT      NOT NULL,
    [PersonLegalStatusInactiveUserID] INT      NULL,
    [PersonLegalStatusInactiveDate]   DATETIME NULL,
    CONSTRAINT [PK_dl_FactPersonLegalStatus] PRIMARY KEY CLUSTERED ([PersonLegalStatusID] ASC)
);


GO

