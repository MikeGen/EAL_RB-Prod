CREATE TABLE [migrations].[RunIfChangedScripts] (
    [ScriptFile]       NVARCHAR (512)     NOT NULL,
    [ScriptFileMd5]    NVARCHAR (32)      NOT NULL,
    [LastExecutedDate] DATETIMEOFFSET (7) NOT NULL,
    CONSTRAINT [PK_RunIfChangedScripts] PRIMARY KEY NONCLUSTERED ([ScriptFile] ASC)
);


GO

