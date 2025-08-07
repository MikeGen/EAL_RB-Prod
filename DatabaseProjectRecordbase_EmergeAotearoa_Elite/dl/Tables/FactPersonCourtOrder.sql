CREATE TABLE [dl].[FactPersonCourtOrder] (
    [PersonCourtOrderId]               INT            NOT NULL,
    [PersonId]                         INT            NOT NULL,
    [PersonCourtOrderCourtOrderRefNo]  NVARCHAR (MAX) NOT NULL,
    [CourtOrderTypeId]                 INT            NOT NULL,
    [PersonCourtOrderStartDate]        DATETIME       NULL,
    [PersonCourtOrderEndDate]          DATETIME       NULL,
    [PersonCourtOrderWithoutNotice]    BIT            NULL,
    [BreachedId]                       INT            NOT NULL,
    [PersonCourtOrderNumberOfChildren] INT            NULL,
    [PersonCourtOrderComments]         NVARCHAR (MAX) NULL,
    [PersonCourtOrderCreatedDate]      DATETIME       NOT NULL,
    [PersonCourtOrderCreatedUserId]    INT            NOT NULL,
    CONSTRAINT [PK_dl_FactPersonCourtOrder] PRIMARY KEY CLUSTERED ([PersonCourtOrderId] ASC)
);


GO

