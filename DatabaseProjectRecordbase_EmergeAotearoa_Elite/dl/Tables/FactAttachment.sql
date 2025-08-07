CREATE TABLE [dl].[FactAttachment] (
    [AttachmentID]                INT            NOT NULL,
    [AttachmentEntityType]        NVARCHAR (50)  NOT NULL,
    [EntityID]                    INT            NOT NULL,
    [AttachmentName]              NVARCHAR (100) NULL,
    [AttachmentDescription]       NVARCHAR (MAX) NULL,
    [CurrentAttachmentFileID]     INT            NULL,
    [AttachmentCreatedDate]       DATETIME       NOT NULL,
    [AttachmentCreatedUserID]     INT            NOT NULL,
    [AttachmentTypeID]            INT            NULL,
    [AttachmentEditableInBrowser] BIT            NOT NULL,
    [ReportTemplateId]            INT            NULL,
    [AttachmentIsCurrent]         BIT            NOT NULL,
    [SecuredAgainstTeamId]        INT            NULL,
    [AttachmentIsFlagged]         BIT            NULL,
    CONSTRAINT [PK_dl_FactAttachment] PRIMARY KEY CLUSTERED ([AttachmentID] ASC)
);


GO

