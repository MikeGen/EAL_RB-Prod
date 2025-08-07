CREATE TABLE [dl].[DimRole] (
    [RoleID]          INT            NOT NULL,
    [RoleName]        VARCHAR (50)   NULL,
    [RoleDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_dl_DimRole] PRIMARY KEY CLUSTERED ([RoleID] ASC)
);


GO

