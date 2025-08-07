CREATE TABLE [dl].[FactNoteRelatedEntity] (
    [NoteRelatedEntityID]                         INT           NOT NULL,
    [NoteID]                                      INT           NOT NULL,
    [NoteRelatedEntityRelatedEntityType]          NVARCHAR (50) NOT NULL,
    [RelatedEntityID]                             INT           NOT NULL,
    [NoteRelatedEntityCreatedUserID]              INT           NOT NULL,
    [NoteRelatedEntityCreatedDate]                DATETIME      NOT NULL,
    [CreatedApplicationId]                        INT           NULL,
    [NoteRelatedEntityCreatedApplicationSyncDate] DATETIME      NULL,
    CONSTRAINT [PK_dl_FactNoteRelatedEntity] PRIMARY KEY CLUSTERED ([NoteRelatedEntityID] ASC)
);


GO

