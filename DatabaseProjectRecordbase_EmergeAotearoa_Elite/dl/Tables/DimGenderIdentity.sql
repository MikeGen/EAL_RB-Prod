CREATE TABLE [dl].[DimGenderIdentity] (
    [GenderIdentityID]       INT            NOT NULL,
    [GenderIdentityValue]    NVARCHAR (200) NOT NULL,
    [GenderIdentityText]     NVARCHAR (200) NOT NULL,
    [GenderIdentityParentId] INT            NULL,
    [GenderIdentityIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimGenderIdentity] PRIMARY KEY CLUSTERED ([GenderIdentityID] ASC)
);


GO

