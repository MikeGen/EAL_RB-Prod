CREATE TABLE [dl].[DimIncidentRiskSetting] (
    [IncidentRiskSettingID]              INT NOT NULL,
    [IncidentRiskSettingSeverityValue]   INT NOT NULL,
    [IncidentRiskSettingLikelihoodValue] INT NOT NULL,
    [IncidentRiskTypeID]                 INT NOT NULL,
    CONSTRAINT [PK_dl_DimIncidentRiskSetting] PRIMARY KEY CLUSTERED ([IncidentRiskSettingID] ASC)
);


GO

