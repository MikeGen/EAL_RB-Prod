CREATE TABLE [stage].[Stage_PersonProtocolHistory] (
    [Id]                   INT                NOT NULL,
    [ProtocolId]           INT                NOT NULL,
    [Title]                NVARCHAR (250)     NULL,
    [RawDescription]       NVARCHAR (MAX)     NULL,
    [HTMLDescription]      NVARCHAR (MAX)     NULL,
    [RawPurpose]           NVARCHAR (MAX)     NULL,
    [HTMLPurpose]          NVARCHAR (MAX)     NULL,
    [RawSteps]             NVARCHAR (MAX)     NULL,
    [HTMLSteps]            NVARCHAR (MAX)     NULL,
    [RawComments]          NVARCHAR (MAX)     NULL,
    [HTMLComments]         NVARCHAR (MAX)     NULL,
    [NextReviewDate]       DATETIME           NULL,
    [ReviewedOnDate]       DATETIME2 (7)      NOT NULL,
    [ReviewedByUserId]     INT                NOT NULL,
    [ReviewComments]       NVARCHAR (MAX)     NULL,
    [NextReviewDateOffset] DATETIMEOFFSET (7) NULL,
    [ReviewedOnDateOffset] DATETIMEOFFSET (7) NULL
);


GO

