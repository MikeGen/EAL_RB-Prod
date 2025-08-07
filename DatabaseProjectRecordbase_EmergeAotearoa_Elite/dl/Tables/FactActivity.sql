CREATE TABLE [dl].[FactActivity] (
    [ActivityID]                         INT            NOT NULL,
    [ActivityStartDate]                  DATETIME       NOT NULL,
    [ActivityEndDate]                    DATETIME       NOT NULL,
    [ActivityDescription]                NVARCHAR (MAX) NULL,
    [ActivitySubject]                    NVARCHAR (300) NOT NULL,
    [ActivityLocation]                   NVARCHAR (300) NULL,
    [ActivityMapReference]               NVARCHAR (50)  NULL,
    [ActivityCreatedDate]                DATETIME       NOT NULL,
    [ActivityCreatedUserID]              INT            NOT NULL,
    [ActivityUDF1]                       NVARCHAR (MAX) NULL,
    [ActivityUDF2]                       NVARCHAR (MAX) NULL,
    [ActivityUDF3]                       NVARCHAR (MAX) NULL,
    [ActivityUDF4]                       NVARCHAR (MAX) NULL,
    [ActivityUDF5]                       NVARCHAR (MAX) NULL,
    [ActivityTypeID]                     INT            NULL,
    [TeamID]                             INT            NULL,
    [ActivityClassificationID]           INT            NULL,
    [OnBehalfOfUserID]                   INT            NULL,
    [CreatedApplicationId]               INT            NULL,
    [ActivityCreatedApplicationSyncDate] DATETIME       NULL,
    [QuickActivityTemplateID]            INT            NULL,
    [PrimaryActivityID]                  INT            NULL,
    [GroupActivityID]                    INT            NULL,
    [TeamAutocodingID]                   INT            NULL,
    [ActivityTravelDistance]             FLOAT (53)     NULL,
    [ActivityEditorViewState]            NVARCHAR (MAX) NOT NULL,
    [ActivitySavedByHumanAfterStartDate] BIT            NULL,
    [ActivityRecurrenceGroupId]          INT            NULL,
    [ActivityWhanauInvolvement]          BIT            NULL,
    [ModifiedDate]                       DATETIME       NULL,
    [ModifiedUserID]                     INT            NULL,
    [ActivityKind]                       NVARCHAR (50)  NULL,
    CONSTRAINT [PK_dl_FactActivity] PRIMARY KEY CLUSTERED ([ActivityID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [idx_FactActivity_ActivityID]
    ON [dl].[FactActivity]([ActivityID] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactActivity_ActivityStartDate]
    ON [dl].[FactActivity]([ActivityStartDate] ASC)
    INCLUDE([ActivityID]);


GO

CREATE NONCLUSTERED INDEX [idx_FactActivity_TeamID]
    ON [dl].[FactActivity]([TeamID] ASC);


GO

CREATE NONCLUSTERED INDEX [idx_FactActivity_ActivityStartDate]
    ON [dl].[FactActivity]([ActivityStartDate] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactActivity_ActivityID]
    ON [dl].[FactActivity]([ActivityID] ASC)
    INCLUDE([ActivityStartDate], [ActivityEndDate], [ActivitySubject], [ActivityCreatedDate], [ActivityTypeID], [TeamID], [ActivityClassificationID]);


GO

