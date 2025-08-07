CREATE TABLE [stage].[Stage_Phone] (
    [ID]                INT          NOT NULL,
    [Name]              VARCHAR (50) NULL,
    [PhoneNumber]       VARCHAR (60) NULL,
    [PhoneNumberTypeID] INT          NULL,
    [EntityType]        VARCHAR (50) NOT NULL,
    [EntityID]          INT          NOT NULL,
    [CreatedDate]       DATETIME     NOT NULL,
    [CreatedUserID]     INT          NOT NULL,
    [ModifiedDate]      DATETIME     NULL,
    [ModifiedUserID]    INT          NULL,
    [DeletedDate]       DATETIME     NULL,
    [DeletedUserID]     INT          NULL
);


GO

