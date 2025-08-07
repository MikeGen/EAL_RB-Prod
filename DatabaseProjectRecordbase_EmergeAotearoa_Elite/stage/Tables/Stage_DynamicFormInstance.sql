CREATE TABLE [stage].[Stage_DynamicFormInstance] (
    [ID]                     INT            NOT NULL,
    [DynamicFormTemplateID]  INT            NOT NULL,
    [EntityType]             VARCHAR (50)   NULL,
    [EntityID]               INT            NOT NULL,
    [Response]               NVARCHAR (MAX) NULL,
    [CompletedDate]          DATETIME       NULL,
    [CreatedDate]            DATETIME       NOT NULL,
    [CreatedUserID]          INT            NOT NULL,
    [ModifiedDate]           DATETIME       NULL,
    [ModifiedUserID]         INT            NULL,
    [DeletedDate]            DATETIME       NULL,
    [DeletedUserID]          INT            NULL,
    [ReferralID]             INT            NULL,
    [SecuredAgainstReferral] BIT            NOT NULL
);


GO

