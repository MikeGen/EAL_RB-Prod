CREATE TABLE [dl].[DimYesNo] (
    [YesNoID]       INT            NOT NULL,
    [YesNoValue]    NVARCHAR (200) NOT NULL,
    [YesNoText]     NVARCHAR (200) NOT NULL,
    [YesNoParentId] INT            NULL,
    [YesNoIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimYesNo] PRIMARY KEY CLUSTERED ([YesNoID] ASC)
);


GO

