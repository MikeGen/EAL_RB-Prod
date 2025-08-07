CREATE TABLE [transform].[FactPersonSmokingAssessment] (
    [Id]                         INT            NOT NULL,
    [PersonId]                   INT            NOT NULL,
    [SmokingAssessmentDate]      DATETIME       NULL,
    [SmokingStatusId]            INT            NULL,
    [NumberCigarettesId]         INT            NULL,
    [BriefAdviceGiven]           BIT            NULL,
    [SmokingSupportOffered]      BIT            NULL,
    [SmokingSupportAccepted]     BIT            NULL,
    [NRTQuitCardOtherMedsGiven]  BIT            NULL,
    [ReferredToExternal]         BIT            NULL,
    [EducationAndResourcesGiven] BIT            NULL,
    [SmokingSupportOfferedText]  NVARCHAR (MAX) NULL,
    [SmokingAssessmentComments]  NVARCHAR (MAX) NULL,
    [CreatedUserId]              INT            NOT NULL,
    [CreatedDate]                DATETIME       NOT NULL,
    CONSTRAINT [PK_transform_FactPersonSmokingAssessment] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

