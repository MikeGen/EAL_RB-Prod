CREATE TABLE [dl].[DimCountry] (
    [CountryID]           INT            NOT NULL,
    [CountryName]         NVARCHAR (100) NOT NULL,
    [CountryCode]         NVARCHAR (5)   NULL,
    [CountryNationality]  NVARCHAR (100) NULL,
    [CountryIsHidden]     BIT            NOT NULL,
    [CountryDiallingCode] NVARCHAR (10)  NULL,
    [CountryIsDefault]    BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimCountry] PRIMARY KEY CLUSTERED ([CountryID] ASC)
);


GO

