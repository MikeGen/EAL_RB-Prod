CREATE TABLE [dl].[FactAccountActivity] (
    [AccountActivityID]                INT            NOT NULL,
    [AccountID]                        INT            NOT NULL,
    [AccountActivityLocation]          NVARCHAR (300) NULL,
    [AccountActivitySubject]           NVARCHAR (300) NOT NULL,
    [AccountActivityDescriptionHTML]   NVARCHAR (MAX) NULL,
    [AccountActivityDescriptionRaw]    NVARCHAR (MAX) NULL,
    [AccountActivityStartDate]         DATETIME       NULL,
    [AccountActivityEndDate]           DATETIME       NULL,
    [AccountActivityTypeID]            INT            NOT NULL,
    [AccountActivityClassificationID]  INT            NOT NULL,
    [AccountActivityCreatedDate]       DATETIME       NOT NULL,
    [AccountActivityCreatedUserID]     INT            NOT NULL,
    [AccountActivityUDF1]              NVARCHAR (MAX) NULL,
    [AccountActivityUDF2]              NVARCHAR (MAX) NULL,
    [AccountActivityUDF3]              NVARCHAR (MAX) NULL,
    [AccountActivityUDF4]              NVARCHAR (MAX) NULL,
    [AccountActivityUDF5]              NVARCHAR (MAX) NULL,
    [AccountActivityOtherParticipants] NVARCHAR (MAX) NULL,
    [TeamID]                           INT            NULL,
    [AccountActivityAudienceSize]      INT            NULL,
    CONSTRAINT [PK_dl_FactAccountActivity] PRIMARY KEY CLUSTERED ([AccountActivityID] ASC)
);


GO

