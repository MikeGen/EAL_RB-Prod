CREATE TABLE [dl].[DimDynamicFormType] (
    [DynamicFormTypeID]          INT          NOT NULL,
    [DynamicFormTypeDescription] VARCHAR (50) NOT NULL,
    [DynamicFormTypeCode]        VARCHAR (50) NULL,
    [DynamicFormTypeInactive]    BIT          NOT NULL,
    CONSTRAINT [PK_dl_DimDynamicFormType] PRIMARY KEY CLUSTERED ([DynamicFormTypeID] ASC)
);


GO

