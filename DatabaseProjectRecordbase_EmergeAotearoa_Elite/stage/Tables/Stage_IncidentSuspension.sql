CREATE TABLE [stage].[Stage_IncidentSuspension] (
    [ID]                             INT            NOT NULL,
    [IncidentSuspensionReasonTypeID] INT            NULL,
    [Comments]                       NVARCHAR (MAX) NULL,
    [ResumedDate]                    DATETIME       NULL,
    [ResumedUserID]                  INT            NULL,
    [IncidentID]                     INT            NOT NULL,
    [CreatedDate]                    DATETIME       NOT NULL,
    [CreatedUserID]                  INT            NOT NULL,
    [ModifiedDate]                   DATETIME       NULL,
    [ModifiedUserID]                 INT            NULL,
    [DeletedDate]                    DATETIME       NULL,
    [DeletedUserID]                  INT            NULL
);


GO

