CREATE TABLE [stage].[Stage_PersonCourtOrderAssociatedCourtOrderType] (
    [Id]                         INT      NOT NULL,
    [PersonCourtOrderId]         INT      NOT NULL,
    [AssociatedCourtOrderTypeId] INT      NOT NULL,
    [CreatedDate]                DATETIME NOT NULL,
    [CreatedUserId]              INT      NOT NULL,
    [ModifiedDate]               DATETIME NULL,
    [ModifiedUserId]             INT      NULL,
    [DeletedDate]                DATETIME NULL,
    [DeletedUserId]              INT      NULL
);


GO

