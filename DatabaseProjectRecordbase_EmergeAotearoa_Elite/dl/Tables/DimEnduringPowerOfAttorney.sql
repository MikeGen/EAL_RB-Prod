CREATE TABLE [dl].[DimEnduringPowerOfAttorney] (
    [EnduringPowerOfAttorneyID]       INT            NOT NULL,
    [EnduringPowerOfAttorneyValue]    NVARCHAR (200) NOT NULL,
    [EnduringPowerOfAttorneyText]     NVARCHAR (200) NOT NULL,
    [EnduringPowerOfAttorneyParentId] INT            NULL,
    [EnduringPowerOfAttorneyIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEnduringPowerOfAttorney] PRIMARY KEY CLUSTERED ([EnduringPowerOfAttorneyID] ASC)
);


GO

