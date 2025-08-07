CREATE TABLE [dl].[FactPersonProtocol] (
    [PersonProtocolId]               INT                NOT NULL,
    [PersonId]                       INT                NOT NULL,
    [PersonProtocolTitle]            NVARCHAR (250)     NULL,
    [PersonProtocolRawDescription]   NVARCHAR (MAX)     NULL,
    [PersonProtocolHTMLDescription]  NVARCHAR (MAX)     NULL,
    [PersonProtocolRawPurpose]       NVARCHAR (MAX)     NULL,
    [PersonProtocolHTMLPurpose]      NVARCHAR (MAX)     NULL,
    [PersonProtocolRawSteps]         NVARCHAR (MAX)     NULL,
    [PersonProtocolHTMLSteps]        NVARCHAR (MAX)     NULL,
    [PersonProtocolRawComments]      NVARCHAR (MAX)     NULL,
    [PersonProtocolHTMLComments]     NVARCHAR (MAX)     NULL,
    [PersonProtocolReviewDate]       DATETIME           NULL,
    [HistoricalId]                   INT                NULL,
    [PersonProtocolCreatedDate]      DATETIME           NOT NULL,
    [PersonProtocolCreatedUserId]    INT                NOT NULL,
    [PersonProtocolHistoricDate]     DATETIME2 (7)      NULL,
    [PersonProtocolReviewDateOffset] DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK_dl_FactPersonProtocol] PRIMARY KEY CLUSTERED ([PersonProtocolId] ASC)
);


GO

