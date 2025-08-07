CREATE TABLE [dl].[DimIncidentLikelihood] (
    [IncidentLikelihoodID]       INT            NOT NULL,
    [IncidentLikelihoodValue]    NVARCHAR (200) NOT NULL,
    [IncidentLikelihoodText]     NVARCHAR (200) NOT NULL,
    [IncidentLikelihoodParentId] INT            NULL,
    [IncidentLikelihoodIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIncidentLikelihood] PRIMARY KEY CLUSTERED ([IncidentLikelihoodID] ASC)
);


GO

