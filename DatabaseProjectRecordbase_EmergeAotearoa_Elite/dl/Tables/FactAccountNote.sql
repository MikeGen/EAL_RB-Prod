CREATE TABLE [dl].[FactAccountNote] (
    [AccountNoteID]            INT            NOT NULL,
    [AccountNoteSubject]       NVARCHAR (300) NOT NULL,
    [AccountNoteHTMLText]      NVARCHAR (MAX) NULL,
    [AccountNoteRawText]       NVARCHAR (MAX) NULL,
    [AccountNoteCreatedDate]   DATETIME       NOT NULL,
    [AccountNoteCreatedUserID] INT            NOT NULL,
    [AccountID]                INT            NOT NULL,
    CONSTRAINT [PK_dl_FactAccountNote] PRIMARY KEY CLUSTERED ([AccountNoteID] ASC)
);


GO

