CREATE TABLE [dl].[DimAttachmentType] (
    [AttachmentTypeID]       INT            NOT NULL,
    [AttachmentTypeValue]    NVARCHAR (200) NOT NULL,
    [AttachmentTypeText]     NVARCHAR (200) NOT NULL,
    [AttachmentTypeParentId] INT            NULL,
    [AttachmentTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimAttachmentType] PRIMARY KEY CLUSTERED ([AttachmentTypeID] ASC)
);


GO

