CREATE TABLE [dl].[DimState] (
    [StateID]   INT           NOT NULL,
    [StateName] NVARCHAR (50) NOT NULL,
    [CountryID] INT           NOT NULL,
    [StateCode] NVARCHAR (50) NULL,
    CONSTRAINT [PK_dl_DimState] PRIMARY KEY CLUSTERED ([StateID] ASC)
);


GO

