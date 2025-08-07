CREATE TABLE [dl].[FactActivityParticipant] (
    [ActivityParticipantID]                         INT            NOT NULL,
    [ActivityID]                                    INT            NOT NULL,
    [ActivityParticipantEntityType]                 NVARCHAR (50)  NOT NULL,
    [EntityID]                                      INT            NOT NULL,
    [ReferralID]                                    INT            NULL,
    [ActivityParticipantIsAttendee]                 BIT            NOT NULL,
    [ActivityParticipantIsRelatedTo]                BIT            NOT NULL,
    [ActivityParticipantCreatedDate]                DATETIME       NOT NULL,
    [ActivityParticipantCreatedUserID]              INT            NOT NULL,
    [ActivityParticipantOtherContactName]           NVARCHAR (MAX) NULL,
    [OtherContactTypeID]                            INT            NULL,
    [CreatedApplicationId]                          INT            NULL,
    [ActivityParticipantCreatedApplicationSyncDate] DATETIME       NULL,
    CONSTRAINT [PK_dl_FactActivityParticipant] PRIMARY KEY CLUSTERED ([ActivityParticipantID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [idx_FactActivityParticipant_ActivityID]
    ON [dl].[FactActivityParticipant]([ActivityID] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactActivityParticipant_ActivityID_ActivityParticipantEntityType]
    ON [dl].[FactActivityParticipant]([ActivityID] ASC, [ActivityParticipantEntityType] ASC)
    INCLUDE([EntityID]);


GO

