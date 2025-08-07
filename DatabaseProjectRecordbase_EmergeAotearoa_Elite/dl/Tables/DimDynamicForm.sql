CREATE TABLE [dl].[DimDynamicForm] (
    [DynamicFormID]                    INT            NOT NULL,
    [DynamicFormTypeID]                INT            NOT NULL,
    [DynamicFormTitle]                 NVARCHAR (100) NOT NULL,
    [DynamicFormDescription]           NVARCHAR (MAX) NOT NULL,
    [DynamicFormReference]             NVARCHAR (50)  NULL,
    [DynamicFormIsVisible]             BIT            NULL,
    [DynamicFormEnableReferralLinking] BIT            NOT NULL,
    [DynamicFormVisibleInMyRecord]     BIT            NOT NULL,
    [DynamicFormAnyoneCanEdit]         BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimDynamicForm] PRIMARY KEY CLUSTERED ([DynamicFormID] ASC)
);


GO

