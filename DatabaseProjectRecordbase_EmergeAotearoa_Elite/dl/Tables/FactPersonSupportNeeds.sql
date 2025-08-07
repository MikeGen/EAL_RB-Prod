CREATE TABLE [dl].[FactPersonSupportNeeds] (
    [PersonSupportNeedsID]            INT      NOT NULL,
    [PersonID]                        INT      NOT NULL,
    [SelfCareID]                      INT      NULL,
    [MobilityID]                      INT      NULL,
    [CommunicationID]                 INT      NULL,
    [RelationshipsID]                 INT      NULL,
    [LearningID]                      INT      NULL,
    [EducationID]                     INT      NULL,
    [CommunityID]                     INT      NULL,
    [DomesticID]                      INT      NULL,
    [WorkingID]                       INT      NULL,
    [SourceOfClinicalSupportID]       INT      NULL,
    [PersonSupportNeedsCreatedDate]   DATETIME NOT NULL,
    [PersonSupportNeedsCreatedUserID] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactPersonSupportNeeds] PRIMARY KEY CLUSTERED ([PersonSupportNeedsID] ASC)
);


GO

