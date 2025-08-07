CREATE TABLE [dl].[DimServiceLevels] (
    [ServiceLevelsID]       INT            NOT NULL,
    [ServiceLevelsValue]    NVARCHAR (200) NOT NULL,
    [ServiceLevelsText]     NVARCHAR (200) NOT NULL,
    [ServiceLevelsParentId] INT            NULL,
    [ServiceLevelsIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimServiceLevels] PRIMARY KEY CLUSTERED ([ServiceLevelsID] ASC)
);


GO

