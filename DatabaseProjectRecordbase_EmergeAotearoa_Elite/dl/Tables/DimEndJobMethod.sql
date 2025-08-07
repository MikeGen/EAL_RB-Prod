CREATE TABLE [dl].[DimEndJobMethod] (
    [EndJobMethodID]       INT            NOT NULL,
    [EndJobMethodValue]    NVARCHAR (200) NOT NULL,
    [EndJobMethodText]     NVARCHAR (200) NOT NULL,
    [EndJobMethodParentId] INT            NULL,
    [EndJobMethodIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEndJobMethod] PRIMARY KEY CLUSTERED ([EndJobMethodID] ASC)
);


GO

