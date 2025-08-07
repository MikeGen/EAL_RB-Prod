CREATE TABLE [dl].[DimRouteMethod] (
    [RouteMethodID]       INT            NOT NULL,
    [RouteMethodValue]    NVARCHAR (200) NOT NULL,
    [RouteMethodText]     NVARCHAR (200) NOT NULL,
    [RouteMethodParentId] INT            NULL,
    [RouteMethodIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimRouteMethod] PRIMARY KEY CLUSTERED ([RouteMethodID] ASC)
);


GO

