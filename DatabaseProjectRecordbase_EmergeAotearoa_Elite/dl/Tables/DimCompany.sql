CREATE TABLE [dl].[DimCompany] (
    [CompanyID]           INT            NOT NULL,
    [CompanyCompanyName]  NVARCHAR (200) NOT NULL,
    [CompanyDescription]  NVARCHAR (MAX) NULL,
    [CompanyUDF1]         NVARCHAR (MAX) NULL,
    [CompanyUDF2]         NVARCHAR (MAX) NULL,
    [CompanyUDF3]         NVARCHAR (MAX) NULL,
    [CompanyUDF4]         NVARCHAR (MAX) NULL,
    [CompanyUDF5]         NVARCHAR (MAX) NULL,
    [CompanyDisabledDate] DATETIME       NULL,
    [DisabledUserID]      INT            NULL,
    CONSTRAINT [PK_dl_DimCompany] PRIMARY KEY CLUSTERED ([CompanyID] ASC)
);


GO

