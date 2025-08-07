CREATE TABLE [stage].[Stage_ReferralStatusTypeReason] (
    [ID]                   INT            NOT NULL,
    [ReferralStatusTypeID] INT            NOT NULL,
    [Code]                 NVARCHAR (50)  NULL,
    [Description]          NVARCHAR (300) NULL,
    [CreatedDate]          DATETIME       NOT NULL,
    [CreatedUserID]        INT            NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [ModifiedUserID]       INT            NULL,
    [DeletedDate]          DATETIME       NULL,
    [DeletedUserID]        INT            NULL
);


GO

