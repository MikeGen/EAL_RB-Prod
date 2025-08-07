CREATE TABLE [dl].[FactPersonSmokingHistory] (
    [PersonSmokingHistoryID]                     INT            NOT NULL,
    [PersonID]                                   INT            NOT NULL,
    [SmokingStatusId]                            INT            NOT NULL,
    [PersonSmokingHistoryCreatedUserID]          INT            NOT NULL,
    [PersonSmokingHistoryCreatedDate]            DATETIME       NOT NULL,
    [PersonSmokingHistoryAssessmentDate]         DATETIME       NOT NULL,
    [PersonSmokingHistoryBriefAdviceGiven]       BIT            NULL,
    [PersonSmokingHistorySupportServicesOffered] XML            NULL,
    [PersonSmokingHistoryComments]               NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_FactPersonSmokingHistory] PRIMARY KEY CLUSTERED ([PersonSmokingHistoryID] ASC)
);


GO

