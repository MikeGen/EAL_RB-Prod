CREATE TABLE [stage].[Stage_Region] (
    [ID]             INT           NOT NULL,
    [Name]           VARCHAR (300) NOT NULL,
    [CountryID]      INT           NOT NULL,
    [ParentID]       INT           NULL,
    [CreatedDate]    DATETIME      NOT NULL,
    [CreatedUserID]  INT           NOT NULL,
    [ModifiedDate]   DATETIME      NULL,
    [ModifiedUserID] INT           NULL,
    [DeletedDate]    DATETIME      NULL,
    [DeletedUserID]  INT           NULL
);


GO

