CREATE TABLE [dl].[DimConfigurationSetting] (
    [ConfigurationSettingID]                INT           NOT NULL,
    [ConfigurationSettingName]              VARCHAR (MAX) NOT NULL,
    [ConfigurationSettingValue]             VARCHAR (MAX) NOT NULL,
    [ConfigurationSettingCode]              VARCHAR (50)  NULL,
    [ConfigurationSettingDescription]       VARCHAR (MAX) NULL,
    [ConfigurationSettingRecordbaseVersion] VARCHAR (50)  NULL,
    CONSTRAINT [PK_dl_DimConfigurationSetting] PRIMARY KEY CLUSTERED ([ConfigurationSettingID] ASC)
);


GO

