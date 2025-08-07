CREATE TABLE [stage].[Stage_PersonReferenceNumber] (
    [ID]                    INT           NOT NULL,
    [PersonID]              INT           NOT NULL,
    [ReferenceNumberTypeID] INT           NOT NULL,
    [ReferenceNumber]       NVARCHAR (50) NOT NULL,
    [ExpiryDate]            DATETIME      NULL,
    [CreatedDate]           DATETIME      NOT NULL,
    [CreatedUserID]         INT           NOT NULL,
    [ModifiedDate]          DATETIME      NULL,
    [ModifiedUserID]        INT           NULL,
    [DeletedDate]           DATETIME      NULL,
    [DeletedUserID]         INT           NULL
);


GO

