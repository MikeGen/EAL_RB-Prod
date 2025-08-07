CREATE TABLE [dl].[FactPersonCarer] (
    [PersonCarerID]                         INT           NOT NULL,
    [PersonID]                              INT           NOT NULL,
    [PersonCarerName]                       NVARCHAR (50) NOT NULL,
    [CarerTypeID]                           INT           NULL,
    [CarerRelationshipID]                   INT           NULL,
    [AllowanceReceivedID]                   INT           NULL,
    [PersonCarerLivesWithClient]            BIT           NULL,
    [PersonCarerDateOfBirth]                SMALLDATETIME NULL,
    [PersonCarerCreatedDate]                DATETIME      NOT NULL,
    [PersonCarerCreatedUserID]              INT           NOT NULL,
    [PersonCarerReceivesSupportFromService] BIT           NULL,
    CONSTRAINT [PK_dl_FactPersonCarer] PRIMARY KEY CLUSTERED ([PersonCarerID] ASC)
);


GO

