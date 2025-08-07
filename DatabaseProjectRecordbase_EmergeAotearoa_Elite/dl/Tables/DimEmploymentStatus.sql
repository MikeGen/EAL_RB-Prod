CREATE TABLE [dl].[DimEmploymentStatus] (
    [EmploymentStatusID]       INT            NOT NULL,
    [EmploymentStatusValue]    NVARCHAR (200) NOT NULL,
    [EmploymentStatusText]     NVARCHAR (200) NOT NULL,
    [EmploymentStatusParentId] INT            NULL,
    [EmploymentStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEmploymentStatus] PRIMARY KEY CLUSTERED ([EmploymentStatusID] ASC)
);


GO

