CREATE TABLE [dl].[DimArea] (
    [AreaID]          INT            NOT NULL,
    [AreaParentID]    INT            NOT NULL,
    [AreaName]        NVARCHAR (50)  NOT NULL,
    [AreaDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_DimArea] PRIMARY KEY CLUSTERED ([AreaID] ASC)
);


GO

