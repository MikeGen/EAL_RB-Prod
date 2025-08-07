CREATE TABLE [stage].[Stage_PersonAlert] (
    [Id]             INT                NOT NULL,
    [PersonId]       INT                NOT NULL,
    [Title]          NVARCHAR (256)     NOT NULL,
    [Details]        NVARCHAR (MAX)     NOT NULL,
    [StartDate]      DATETIMEOFFSET (0) NULL,
    [EndDate]        DATETIMEOFFSET (0) NULL,
    [CreatedDate]    DATETIME2 (7)      NOT NULL,
    [CreatedUserId]  INT                NOT NULL,
    [ModifiedDate]   DATETIME2 (7)      NULL,
    [ModifiedUserId] INT                NULL,
    [DeletedDate]    DATETIME2 (7)      NULL,
    [DeletedUserId]  INT                NULL
);


GO

