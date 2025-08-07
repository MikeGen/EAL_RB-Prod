CREATE TABLE [stage].[Stage_IncidentRiskSetting] (
    [ID]                 INT      NOT NULL,
    [SeverityValue]      INT      NOT NULL,
    [LikelihoodValue]    INT      NOT NULL,
    [IncidentRiskTypeID] INT      NOT NULL,
    [CreatedUserID]      INT      NOT NULL,
    [CreatedDate]        DATETIME NOT NULL,
    [ModifiedUserID]     INT      NULL,
    [ModifiedDate]       DATETIME NULL,
    [DeletedUserID]      INT      NULL,
    [DeletedDate]        DATETIME NULL
);


GO

