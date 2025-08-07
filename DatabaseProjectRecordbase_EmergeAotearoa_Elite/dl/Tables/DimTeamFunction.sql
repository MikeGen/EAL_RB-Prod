CREATE TABLE [dl].[DimTeamFunction] (
    [TeamFunctionID]                           INT            NOT NULL,
    [TeamConfigurationID]                      INT            NOT NULL,
    [TeamFunctionCode]                         NVARCHAR (50)  NULL,
    [TeamFunctionName]                         NVARCHAR (50)  NOT NULL,
    [TeamFunctionDescription]                  NVARCHAR (MAX) NULL,
    [TeamFunctionAllowConcurrentReferrals]     BIT            NOT NULL,
    [TeamFunctionIsAccomodationBased]          BIT            NOT NULL,
    [TeamFunctionRecentlyDischargedPeriodDays] INT            NOT NULL,
    [DefaultTaskProcessID]                     INT            NULL,
    [TeamFunctionAllowExitWithoutDischarge]    BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimTeamFunction] PRIMARY KEY CLUSTERED ([TeamFunctionID] ASC)
);


GO

