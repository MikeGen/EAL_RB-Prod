CREATE TABLE [stage].[Stage_State] (
    [ID]             INT           NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [CountryID]      INT           NOT NULL,
    [CreatedDate]    DATETIME      NOT NULL,
    [CreatedUserID]  INT           NOT NULL,
    [ModifiedDate]   DATETIME      NULL,
    [ModifiedUserID] INT           NULL,
    [DeletedDate]    DATETIME      NULL,
    [DeletedUserID]  INT           NULL,
    [Code]           NVARCHAR (50) NULL
);


GO

