CREATE TABLE [stage].[Stage_PersonCourtOrder] (
    [Id]               INT            NOT NULL,
    [PersonId]         INT            NOT NULL,
    [CourtOrderRefNo]  NVARCHAR (MAX) NOT NULL,
    [CourtOrderTypeId] INT            NOT NULL,
    [StartDate]        DATETIME       NULL,
    [EndDate]          DATETIME       NULL,
    [WithoutNotice]    BIT            NULL,
    [BreachedId]       INT            NOT NULL,
    [NumberOfChildren] INT            NULL,
    [Comments]         NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedUserId]    INT            NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedUserId]   INT            NULL,
    [DeletedDate]      DATETIME       NULL,
    [DeletedUserId]    INT            NULL
);


GO

