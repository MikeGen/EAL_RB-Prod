CREATE TABLE [dl].[FactPersonProtocolHistory] (
    [PersonProtocolHistoryId]                   INT                NOT NULL,
    [ProtocolId]                                INT                NOT NULL,
    [PersonProtocolHistoryTitle]                NVARCHAR (250)     NULL,
    [PersonProtocolHistoryRawDescription]       NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryHTMLDescription]      NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryRawPurpose]           NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryHTMLPurpose]          NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryRawSteps]             NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryHTMLSteps]            NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryRawComments]          NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryHTMLComments]         NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryNextReviewDate]       DATETIME           NULL,
    [PersonProtocolHistoryReviewedOnDate]       DATETIME2 (7)      NOT NULL,
    [ReviewedByUserId]                          INT                NOT NULL,
    [PersonProtocolHistoryReviewComments]       NVARCHAR (MAX)     NULL,
    [PersonProtocolHistoryNextReviewDateOffset] DATETIMEOFFSET (7) NULL,
    [PersonProtocolHistoryReviewedOnDateOffset] DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK_dl_FactPersonProtocolHistory] PRIMARY KEY CLUSTERED ([PersonProtocolHistoryId] ASC)
);


GO

