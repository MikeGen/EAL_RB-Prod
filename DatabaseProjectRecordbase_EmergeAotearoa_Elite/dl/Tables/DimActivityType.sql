CREATE TABLE [dl].[DimActivityType] (
    [ActivityTypeID]          INT            NOT NULL,
    [TeamConfigurationID]     INT            NOT NULL,
    [ActivityTypeCode]        NVARCHAR (20)  NULL,
    [ActivityTypeName]        NVARCHAR (50)  NOT NULL,
    [ActivityTypeDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_DimActivityType] PRIMARY KEY CLUSTERED ([ActivityTypeID] ASC)
);


GO

