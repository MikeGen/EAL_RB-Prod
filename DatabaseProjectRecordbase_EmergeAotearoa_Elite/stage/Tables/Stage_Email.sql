CREATE TABLE [stage].[Stage_Email] (
    [ID]             INT           NOT NULL,
    [Email]          VARCHAR (300) NOT NULL,
    [ConsentToEmail] BIT           NOT NULL,
    [IsPrimary]      BIT           NOT NULL,
    [EntityType]     VARCHAR (50)  NOT NULL,
    [EntityID]       INT           NOT NULL,
    [CreatedDate]    DATETIME      NOT NULL,
    [CreatedUserID]  INT           NOT NULL,
    [ModifiedDate]   DATETIME      NULL,
    [ModifiedUserID] INT           NULL,
    [DeletedDate]    DATETIME      NULL,
    [DeletedUserID]  INT           NULL
);


GO

