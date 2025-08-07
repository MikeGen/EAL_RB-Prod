CREATE TABLE [dl].[DimEmploymentHistory] (
    [EmploymentHistoryID]       INT            NOT NULL,
    [EmploymentHistoryValue]    NVARCHAR (200) NOT NULL,
    [EmploymentHistoryText]     NVARCHAR (200) NOT NULL,
    [EmploymentHistoryParentId] INT            NULL,
    [EmploymentHistoryIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEmploymentHistory] PRIMARY KEY CLUSTERED ([EmploymentHistoryID] ASC)
);


GO

