CREATE TABLE [stage].[Stage_Country] (
    [ID]             INT            NOT NULL,
    [Name]           NVARCHAR (100) NOT NULL,
    [Code]           NVARCHAR (5)   NULL,
    [Nationality]    NVARCHAR (100) NULL,
    [IsHidden]       BIT            NOT NULL,
    [DiallingCode]   NVARCHAR (10)  NULL,
    [IsDefault]      BIT            NOT NULL,
    [InactiveDate]   DATETIME       NULL,
    [InactiveUserID] INT            NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL
);


GO

