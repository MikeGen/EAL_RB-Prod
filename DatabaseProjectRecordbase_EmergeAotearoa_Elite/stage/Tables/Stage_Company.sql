CREATE TABLE [stage].[Stage_Company] (
    [ID]             INT            NOT NULL,
    [CompanyName]    NVARCHAR (200) NOT NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [UDF1]           NVARCHAR (MAX) NULL,
    [UDF2]           NVARCHAR (MAX) NULL,
    [UDF3]           NVARCHAR (MAX) NULL,
    [UDF4]           NVARCHAR (MAX) NULL,
    [UDF5]           NVARCHAR (MAX) NULL,
    [DisabledDate]   DATETIME       NULL,
    [DisabledUserID] INT            NULL
);


GO

