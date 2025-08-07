CREATE TABLE [stage].[Stage_PersonMedicalTest] (
    [ID]                INT            NOT NULL,
    [Date]              DATETIME       NOT NULL,
    [PersonID]          INT            NOT NULL,
    [MedicalTestTypeID] INT            NOT NULL,
    [Result]            NVARCHAR (MAX) NULL,
    [Comments]          NVARCHAR (MAX) NULL,
    [CreatedDate]       DATETIME       NOT NULL,
    [CreatedUserID]     INT            NOT NULL,
    [ModifiedDate]      DATETIME       NULL,
    [ModifiedUserID]    INT            NULL,
    [DeletedDate]       DATETIME       NULL,
    [DeletedUserID]     INT            NULL,
    [InactiveDate]      DATETIME       NULL,
    [InactiveUserID]    INT            NULL
);


GO

