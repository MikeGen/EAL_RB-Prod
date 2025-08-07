CREATE TABLE [migrations].[RunOnceScripts] (
    [ScriptFile]   NVARCHAR (512)     NOT NULL,
    [ExecutedDate] DATETIMEOFFSET (7) NOT NULL,
    CONSTRAINT [PK_RunOnceScripts] PRIMARY KEY NONCLUSTERED ([ScriptFile] ASC)
);


GO

