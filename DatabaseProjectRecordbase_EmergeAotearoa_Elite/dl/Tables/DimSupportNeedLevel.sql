CREATE TABLE [dl].[DimSupportNeedLevel] (
    [SupportNeedLevelID]       INT            NOT NULL,
    [SupportNeedLevelValue]    NVARCHAR (200) NOT NULL,
    [SupportNeedLevelText]     NVARCHAR (200) NOT NULL,
    [SupportNeedLevelParentId] INT            NULL,
    [SupportNeedLevelIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSupportNeedLevel] PRIMARY KEY CLUSTERED ([SupportNeedLevelID] ASC)
);


GO

