CREATE TABLE [dl].[DimTeamConfiguration] (
    [TeamConfigurationID]                      INT            NOT NULL,
    [TeamConfigurationName]                    NVARCHAR (50)  NULL,
    [TeamConfigurationDescription]             NVARCHAR (MAX) NULL,
    [TeamConfigurationReferenceNumberRequired] BIT            NOT NULL,
    [ExtractTypeID]                            INT            NULL,
    CONSTRAINT [PK_dl_DimTeamConfiguration] PRIMARY KEY CLUSTERED ([TeamConfigurationID] ASC)
);


GO

