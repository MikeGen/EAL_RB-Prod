CREATE TABLE [stage].[Stage_DynamicFormType] (
    [ID]             INT          NOT NULL,
    [Description]    VARCHAR (50) NOT NULL,
    [Code]           VARCHAR (50) NULL,
    [Inactive]       BIT          NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedUserID]  INT          NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedUserID] INT          NULL,
    [DeletedDate]    DATETIME     NULL,
    [DeletedUserID]  INT          NULL
);


GO

