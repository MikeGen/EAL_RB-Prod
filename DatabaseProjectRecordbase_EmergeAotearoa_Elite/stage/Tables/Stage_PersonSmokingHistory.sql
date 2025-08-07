CREATE TABLE [stage].[Stage_PersonSmokingHistory] (
    [ID]                     INT            NOT NULL,
    [PersonID]               INT            NOT NULL,
    [SmokingStatusId]        INT            NOT NULL,
    [CreatedUserID]          INT            NOT NULL,
    [CreatedDate]            DATETIME       NOT NULL,
    [ModifiedUserID]         INT            NULL,
    [ModifiedDate]           DATETIME       NULL,
    [DeletedUserID]          INT            NULL,
    [DeletedDate]            DATETIME       NULL,
    [AssessmentDate]         DATETIME       NOT NULL,
    [BriefAdviceGiven]       BIT            NULL,
    [SupportServicesOffered] XML            NULL,
    [Comments]               NVARCHAR (MAX) NULL
);


GO

