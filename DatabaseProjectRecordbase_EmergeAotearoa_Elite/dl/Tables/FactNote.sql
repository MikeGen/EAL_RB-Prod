CREATE TABLE [dl].[FactNote] (
    [NoteID]                         INT            NOT NULL,
    [NoteBaseEntityType]             NVARCHAR (50)  NOT NULL,
    [BaseEntityID]                   INT            NOT NULL,
    [NoteRelatedDate]                DATETIME       NULL,
    [NoteSubject]                    NVARCHAR (300) NOT NULL,
    [NoteHTMLText]                   NVARCHAR (MAX) NULL,
    [NoteRawText]                    NVARCHAR (MAX) NOT NULL,
    [OnBehalfOfUserID]               INT            NULL,
    [SecuredAgainstTeamID]           INT            NULL,
    [NoteCreatedDate]                DATETIME       NOT NULL,
    [NoteCreatedUserID]              INT            NOT NULL,
    [NoteTypeID]                     INT            NULL,
    [NoteDisplayInMyRecord]          BIT            NOT NULL,
    [CreatedApplicationId]           INT            NULL,
    [NoteCreatedApplicationSyncDate] DATETIME       NULL,
    CONSTRAINT [PK_dl_FactNote] PRIMARY KEY CLUSTERED ([NoteID] ASC)
);


GO

