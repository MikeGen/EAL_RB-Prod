CREATE TABLE [dl].[DimMaritalStatus] (
    [MaritalStatusID]       INT            NOT NULL,
    [MaritalStatusValue]    NVARCHAR (200) NOT NULL,
    [MaritalStatusText]     NVARCHAR (200) NOT NULL,
    [MaritalStatusParentId] INT            NULL,
    [MaritalStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimMaritalStatus] PRIMARY KEY CLUSTERED ([MaritalStatusID] ASC)
);


GO

