CREATE TABLE [dl].[DimDynamicFormTemplate] (
    [DynamicFormTemplateID]            INT            NOT NULL,
    [DynamicFormTemplateDefinition]    NVARCHAR (MAX) NOT NULL,
    [DynamicFormTemplateChangeNotes]   NVARCHAR (MAX) NULL,
    [DynamicFormTemplatePublishedDate] DATETIME       NULL,
    [PublishedUserId]                  INT            NULL,
    [DynamicFormTemplateIsActive]      BIT            NOT NULL,
    [DynamicFormID]                    INT            NOT NULL,
    CONSTRAINT [PK_dl_DimDynamicFormTemplate] PRIMARY KEY CLUSTERED ([DynamicFormTemplateID] ASC)
);


GO

