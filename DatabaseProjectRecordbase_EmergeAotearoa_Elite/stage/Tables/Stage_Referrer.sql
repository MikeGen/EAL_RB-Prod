CREATE TABLE [stage].[Stage_Referrer] (
    [ID]              INT            NOT NULL,
    [ReferrerGroupID] INT            NULL,
    [Code]            NVARCHAR (20)  NOT NULL,
    [Name]            NVARCHAR (50)  NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [IsInbound]       BIT            NULL,
    [IsOutbound]      BIT            NULL,
    [InactiveUserId]  INT            NULL,
    [InactiveDate]    DATETIME       NULL,
    [CreatedUserID]   INT            NOT NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [ModifiedUserID]  INT            NULL,
    [ModifiedDate]    DATETIME       NULL,
    [DeletedUserID]   INT            NULL,
    [DeletedDate]     DATETIME       NULL
);


GO

