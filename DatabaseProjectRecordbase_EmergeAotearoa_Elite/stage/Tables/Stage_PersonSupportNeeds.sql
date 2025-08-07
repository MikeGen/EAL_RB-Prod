CREATE TABLE [stage].[Stage_PersonSupportNeeds] (
    [ID]                        INT      NOT NULL,
    [PersonID]                  INT      NOT NULL,
    [SelfCareID]                INT      NULL,
    [MobilityID]                INT      NULL,
    [CommunicationID]           INT      NULL,
    [RelationshipsID]           INT      NULL,
    [LearningID]                INT      NULL,
    [EducationID]               INT      NULL,
    [CommunityID]               INT      NULL,
    [DomesticID]                INT      NULL,
    [WorkingID]                 INT      NULL,
    [SourceOfClinicalSupportID] INT      NULL,
    [CreatedDate]               DATETIME NOT NULL,
    [CreatedUserID]             INT      NOT NULL,
    [ModifiedDate]              DATETIME NULL,
    [ModifiedUserID]            INT      NULL,
    [DeletedDate]               DATETIME NULL,
    [DeletedUserID]             INT      NULL
);


GO

