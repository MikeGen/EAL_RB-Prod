CREATE TABLE [stage].[Stage_AuditUser] (
    [ID]            INT            NOT NULL,
    [AuditedDate]   DATETIME       NOT NULL,
    [AuditedUserId] INT            NOT NULL,
    [UserId]        INT            NOT NULL,
    [MemberName]    NVARCHAR (100) NOT NULL,
    [OldValue]      NVARCHAR (MAX) NULL,
    [CreatedDate]   DATETIME       NOT NULL,
    [ModifiedDate]  DATETIME       NULL,
    [DeletedDate]   DATETIME       NULL
);


GO

