CREATE TABLE [stage].[Stage_Note] (
    [ID]                         INT            NOT NULL,
    [BaseEntityType]             NVARCHAR (50)  NOT NULL,
    [BaseEntityID]               INT            NOT NULL,
    [RelatedDate]                DATETIME       NULL,
    [Subject]                    NVARCHAR (300) NOT NULL,
    [HTMLText]                   NVARCHAR (MAX) NULL,
    [RawText]                    NVARCHAR (MAX) NOT NULL,
    [OnBehalfOfUserID]           INT            NULL,
    [SecuredAgainstTeamID]       INT            NULL,
    [CreatedDate]                DATETIME       NOT NULL,
    [CreatedUserID]              INT            NOT NULL,
    [ModifiedDate]               DATETIME       NULL,
    [ModifiedUserID]             INT            NULL,
    [DeletedDate]                DATETIME       NULL,
    [DeletedUserID]              INT            NULL,
    [InactiveDate]               DATE           NULL,
    [InactiveUserID]             INT            NULL,
    [NoteTypeID]                 INT            NULL,
    [DisplayInMyRecord]          BIT            NOT NULL,
    [CreatedApplicationId]       INT            NULL,
    [CreatedApplicationSyncDate] DATETIME       NULL
);


GO

