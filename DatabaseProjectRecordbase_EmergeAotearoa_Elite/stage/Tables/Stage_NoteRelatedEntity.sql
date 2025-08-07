CREATE TABLE [stage].[Stage_NoteRelatedEntity] (
    [ID]                         INT           NOT NULL,
    [NoteID]                     INT           NOT NULL,
    [RelatedEntityType]          NVARCHAR (50) NOT NULL,
    [RelatedEntityID]            INT           NOT NULL,
    [CreatedUserID]              INT           NOT NULL,
    [CreatedDate]                DATETIME      NOT NULL,
    [ModifiedUserID]             INT           NULL,
    [ModifiedDate]               DATETIME      NULL,
    [DeletedUserID]              INT           NULL,
    [DeletedDate]                DATETIME      NULL,
    [CreatedApplicationId]       INT           NULL,
    [CreatedApplicationSyncDate] DATETIME      NULL
);


GO

