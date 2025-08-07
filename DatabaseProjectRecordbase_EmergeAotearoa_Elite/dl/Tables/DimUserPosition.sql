CREATE TABLE [dl].[DimUserPosition] (
    [UserPositionID]       INT            NOT NULL,
    [UserPositionValue]    NVARCHAR (200) NOT NULL,
    [UserPositionText]     NVARCHAR (200) NOT NULL,
    [UserPositionParentId] INT            NULL,
    [UserPositionIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimUserPosition] PRIMARY KEY CLUSTERED ([UserPositionID] ASC)
);


GO

