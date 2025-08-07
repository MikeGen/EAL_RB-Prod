CREATE TABLE [dl].[FactDynamicFormInstance] (
    [DynamicFormInstanceID]                     INT            NOT NULL,
    [DynamicFormTemplateID]                     INT            NOT NULL,
    [DynamicFormInstanceEntityType]             VARCHAR (50)   NULL,
    [EntityID]                                  INT            NOT NULL,
    [DynamicFormInstanceResponse]               NVARCHAR (MAX) NULL,
    [DynamicFormInstanceCompletedDate]          DATETIME       NULL,
    [DynamicFormInstanceCreatedDate]            DATETIME       NOT NULL,
    [DynamicFormInstanceCreatedUserID]          INT            NOT NULL,
    [ReferralID]                                INT            NULL,
    [DynamicFormInstanceSecuredAgainstReferral] BIT            NOT NULL,
    CONSTRAINT [PK_dl_FactDynamicFormInstance] PRIMARY KEY CLUSTERED ([DynamicFormInstanceID] ASC)
);


GO

