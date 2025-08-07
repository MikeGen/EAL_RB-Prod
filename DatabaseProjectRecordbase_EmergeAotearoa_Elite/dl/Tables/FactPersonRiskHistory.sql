CREATE TABLE [dl].[FactPersonRiskHistory] (
    [PersonRiskHistoryID]                   INT                NOT NULL,
    [RiskId]                                INT                NOT NULL,
    [RiskTypeId]                            INT                NOT NULL,
    [PersonRiskHistoryDescription]          NVARCHAR (250)     NOT NULL,
    [PersonRiskHistoryRawEarlySigns]        NVARCHAR (MAX)     NULL,
    [PersonRiskHistoryHTMLEarlySigns]       NVARCHAR (MAX)     NULL,
    [PersonRiskHistoryRawStrategy]          NVARCHAR (MAX)     NULL,
    [PersonRiskHistoryHTMLStrategy]         NVARCHAR (MAX)     NULL,
    [PersonRiskHistoryRawComments]          NVARCHAR (MAX)     NULL,
    [PersonRiskHistoryHTMLComments]         NVARCHAR (MAX)     NULL,
    [PersonRiskHistoryNextReviewDate]       DATETIME           NULL,
    [PersonRiskHistoryAlertFlag]            BIT                NOT NULL,
    [PersonRiskHistoryReviewedOnDate]       DATETIME2 (7)      NOT NULL,
    [ReviewedByUserId]                      INT                NOT NULL,
    [PersonRiskHistoryReviewComments]       NVARCHAR (MAX)     NULL,
    [PersonRiskHistoryNextReviewDateOffset] DATETIMEOFFSET (7) NULL,
    [PersonRiskHistoryReviewedOnDateOffset] DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK_dl_FactPersonRiskHistory] PRIMARY KEY CLUSTERED ([PersonRiskHistoryID] ASC)
);


GO

