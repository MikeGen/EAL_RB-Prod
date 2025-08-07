CREATE TABLE [stage].[Stage_ReferenceIwi] (
    [id]             INT            NOT NULL,
    [name]           NVARCHAR (MAX) NOT NULL,
    [code]           NVARCHAR (5)   NOT NULL,
    [regionId]       INT            NOT NULL,
    [CreatedUserId]  INT            NOT NULL,
    [CreatedDate]    DATETIME2 (7)  NOT NULL,
    [ModifiedUserId] INT            NULL,
    [ModifiedDate]   DATETIME2 (7)  NULL,
    [DeletedUserId]  INT            NULL,
    [DeletedDate]    DATETIME2 (7)  NULL
);


GO

