CREATE TABLE [stage].[Stage_ActivityParticipant] (
    [ID]                         INT            NOT NULL,
    [ActivityID]                 INT            NOT NULL,
    [EntityType]                 NVARCHAR (50)  NOT NULL,
    [EntityID]                   INT            NOT NULL,
    [ReferralID]                 INT            NULL,
    [IsAttendee]                 BIT            NOT NULL,
    [IsRelatedTo]                BIT            NOT NULL,
    [CreatedDate]                DATETIME       NOT NULL,
    [CreatedUserID]              INT            NOT NULL,
    [ModifiedDate]               DATETIME       NULL,
    [ModifiedUserID]             INT            NULL,
    [DeletedDate]                DATETIME       NULL,
    [DeletedUserID]              INT            NULL,
    [OtherContactName]           NVARCHAR (MAX) NULL,
    [OtherContactTypeID]         INT            NULL,
    [CreatedApplicationId]       INT            NULL,
    [CreatedApplicationSyncDate] DATETIME       NULL
);


GO

