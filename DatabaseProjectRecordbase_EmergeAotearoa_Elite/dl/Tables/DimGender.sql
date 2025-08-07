CREATE TABLE [dl].[DimGender] (
    [GenderID]       INT            NOT NULL,
    [GenderValue]    NVARCHAR (200) NOT NULL,
    [GenderText]     NVARCHAR (200) NOT NULL,
    [GenderParentId] INT            NULL,
    [GenderIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimGender] PRIMARY KEY CLUSTERED ([GenderID] ASC)
);


GO

