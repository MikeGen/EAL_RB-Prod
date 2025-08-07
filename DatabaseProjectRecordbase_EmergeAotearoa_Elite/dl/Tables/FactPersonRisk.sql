CREATE TABLE [dl].[FactPersonRisk] (
    [PersonRiskID]               INT                NOT NULL,
    [PersonID]                   INT                NOT NULL,
    [RiskTypeID]                 INT                NOT NULL,
    [PersonRiskDescription]      NVARCHAR (250)     NOT NULL,
    [PersonRiskRawEarlySigns]    NVARCHAR (MAX)     NULL,
    [PersonRiskHTMLEarlySigns]   NVARCHAR (MAX)     NULL,
    [PersonRiskRawStrategy]      NVARCHAR (MAX)     NULL,
    [PersonRiskHTMLStrategy]     NVARCHAR (MAX)     NULL,
    [PersonRiskRawComments]      NVARCHAR (MAX)     NULL,
    [PersonRiskHTMLComments]     NVARCHAR (MAX)     NULL,
    [PersonRiskReviewDate]       DATETIME           NULL,
    [HistoricalID]               INT                NULL,
    [PersonRiskCreatedDate]      DATETIME           NOT NULL,
    [PersonRiskCreatedUserID]    INT                NOT NULL,
    [PersonRiskAlertFlag]        BIT                NOT NULL,
    [PersonRiskHistoricDate]     DATETIME2 (7)      NULL,
    [PersonRiskReviewDateOffset] DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK_dl_FactPersonRisk] PRIMARY KEY CLUSTERED ([PersonRiskID] ASC)
);


GO

