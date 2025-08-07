CREATE TABLE [dl].[FactPersonCourtOrderAssociatedCourtOrderType] (
    [PersonCourtOrderAssociatedCourtOrderTypeId]            INT      NOT NULL,
    [PersonCourtOrderId]                                    INT      NOT NULL,
    [AssociatedCourtOrderTypeId]                            INT      NOT NULL,
    [PersonCourtOrderAssociatedCourtOrderTypeCreatedDate]   DATETIME NOT NULL,
    [PersonCourtOrderAssociatedCourtOrderTypeCreatedUserId] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactPersonCourtOrderAssociatedCourtOrderType] PRIMARY KEY CLUSTERED ([PersonCourtOrderAssociatedCourtOrderTypeId] ASC)
);


GO

