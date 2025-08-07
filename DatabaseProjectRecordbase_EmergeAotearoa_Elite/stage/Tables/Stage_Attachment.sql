CREATE TABLE [stage].[Stage_Attachment] (
    [ID]                      INT            NOT NULL,
    [EntityType]              NVARCHAR (50)  NOT NULL,
    [EntityID]                INT            NOT NULL,
    [Name]                    NVARCHAR (100) NULL,
    [Description]             NVARCHAR (MAX) NULL,
    [CurrentAttachmentFileID] INT            NULL,
    [CreatedDate]             DATETIME       NOT NULL,
    [CreatedUserID]           INT            NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [ModifiedUserID]          INT            NULL,
    [DeletedDate]             DATETIME       NULL,
    [DeletedUserID]           INT            NULL,
    [InactiveDate]            DATETIME       NULL,
    [InactiveUserID]          INT            NULL,
    [AttachmentTypeID]        INT            NULL,
    [EditableInBrowser]       BIT            NOT NULL,
    [ReportTemplateId]        INT            NULL,
    [IsCurrent]               BIT            NOT NULL,
    [SecuredAgainstTeamId]    INT            NULL,
    [IsFlagged]               BIT            NULL
);


GO

