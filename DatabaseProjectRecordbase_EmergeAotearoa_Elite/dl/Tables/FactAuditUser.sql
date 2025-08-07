CREATE TABLE [dl].[FactAuditUser] (
    [AuditUserID]          INT            NOT NULL,
    [AuditUserAuditedDate] DATETIME       NOT NULL,
    [AuditedUserId]        INT            NOT NULL,
    [UserId]               INT            NOT NULL,
    [AuditUserMemberName]  NVARCHAR (100) NOT NULL,
    [AuditUserOldValue]    NVARCHAR (MAX) NULL,
    [AuditUserCreatedDate] DATETIME       NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [DeletedDate]          DATETIME       NULL
);


GO

