CREATE TABLE [dl].[DimNoteType] (
    [NoteTypeID]       INT            NOT NULL,
    [NoteTypeValue]    NVARCHAR (200) NOT NULL,
    [NoteTypeText]     NVARCHAR (200) NOT NULL,
    [NoteTypeParentId] INT            NULL,
    [NoteTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimNoteType] PRIMARY KEY CLUSTERED ([NoteTypeID] ASC)
);


GO

