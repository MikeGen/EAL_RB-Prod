CREATE TABLE [dl].[DimPreferredContactMethod] (
    [PreferredContactMethodID]       INT            NOT NULL,
    [PreferredContactMethodValue]    NVARCHAR (200) NOT NULL,
    [PreferredContactMethodText]     NVARCHAR (200) NOT NULL,
    [PreferredContactMethodParentId] INT            NULL,
    [PreferredContactMethodIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPreferredContactMethod] PRIMARY KEY CLUSTERED ([PreferredContactMethodID] ASC)
);


GO

