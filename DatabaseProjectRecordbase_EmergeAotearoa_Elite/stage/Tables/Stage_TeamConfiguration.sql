CREATE TABLE [stage].[Stage_TeamConfiguration] (
    [ID]                      INT            NOT NULL,
    [Name]                    NVARCHAR (50)  NULL,
    [Description]             NVARCHAR (MAX) NULL,
    [ReferenceNumberRequired] BIT            NOT NULL,
    [ExtractTypeID]           INT            NULL,
    [InactiveUserID]          INT            NULL,
    [InactiveDate]            DATETIME       NULL,
    [CreatedUserID]           INT            NOT NULL,
    [CreatedDate]             DATETIME       NOT NULL,
    [ModifiedUserID]          INT            NULL,
    [ModifiedDate]            DATETIME       NULL,
    [DeletedUserID]           INT            NULL,
    [DeletedDate]             DATETIME       NULL
);


GO

