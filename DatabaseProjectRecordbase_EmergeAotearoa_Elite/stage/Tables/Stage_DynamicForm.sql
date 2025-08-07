CREATE TABLE [stage].[Stage_DynamicForm] (
    [ID]                    INT            NOT NULL,
    [DynamicFormTypeID]     INT            NOT NULL,
    [Title]                 NVARCHAR (100) NOT NULL,
    [Description]           NVARCHAR (MAX) NOT NULL,
    [Reference]             NVARCHAR (50)  NULL,
    [IsVisible]             BIT            NULL,
    [InactiveUserID]        INT            NULL,
    [InactiveDate]          DATETIME       NULL,
    [CreatedUserID]         INT            NOT NULL,
    [CreatedDate]           DATETIME       NOT NULL,
    [ModifiedUserID]        INT            NULL,
    [ModifiedDate]          DATETIME       NULL,
    [DeletedUserID]         INT            NULL,
    [DeletedDate]           DATETIME       NULL,
    [EnableReferralLinking] BIT            NOT NULL,
    [VisibleInMyRecord]     BIT            NOT NULL,
    [AnyoneCanEdit]         BIT            NOT NULL
);


GO

