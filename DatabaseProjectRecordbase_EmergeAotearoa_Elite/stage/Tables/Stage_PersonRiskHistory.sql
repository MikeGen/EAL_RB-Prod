CREATE TABLE [stage].[Stage_PersonRiskHistory] (
    [ID]                   INT                NOT NULL,
    [RiskId]               INT                NOT NULL,
    [RiskTypeId]           INT                NOT NULL,
    [Description]          NVARCHAR (250)     NOT NULL,
    [RawEarlySigns]        NVARCHAR (MAX)     NULL,
    [HTMLEarlySigns]       NVARCHAR (MAX)     NULL,
    [RawStrategy]          NVARCHAR (MAX)     NULL,
    [HTMLStrategy]         NVARCHAR (MAX)     NULL,
    [RawComments]          NVARCHAR (MAX)     NULL,
    [HTMLComments]         NVARCHAR (MAX)     NULL,
    [NextReviewDate]       DATETIME           NULL,
    [AlertFlag]            BIT                NOT NULL,
    [ReviewedOnDate]       DATETIME2 (7)      NOT NULL,
    [ReviewedByUserId]     INT                NOT NULL,
    [ReviewComments]       NVARCHAR (MAX)     NULL,
    [NextReviewDateOffset] DATETIMEOFFSET (7) NULL,
    [ReviewedOnDateOffset] DATETIMEOFFSET (7) NULL
);


GO

