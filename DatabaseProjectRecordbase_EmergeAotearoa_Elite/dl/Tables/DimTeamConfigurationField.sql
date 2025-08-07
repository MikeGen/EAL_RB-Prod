CREATE TABLE [dl].[DimTeamConfigurationField] (
    [TeamConfigurationFieldID]    INT           NOT NULL,
    [TeamConfigurationID]         INT           NOT NULL,
    [TeamConfigurationFieldField] NVARCHAR (50) NULL,
    [TeamConfigurationFieldLabel] NVARCHAR (50) NULL,
    [LookupGroupID]               INT           NULL,
    CONSTRAINT [PK_dl_DimTeamConfigurationField] PRIMARY KEY CLUSTERED ([TeamConfigurationFieldID] ASC)
);


GO

