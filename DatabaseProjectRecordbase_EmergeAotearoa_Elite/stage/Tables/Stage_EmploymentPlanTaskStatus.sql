CREATE TABLE [stage].[Stage_EmploymentPlanTaskStatus] (
    [ID]                   INT            NOT NULL,
    [Name]                 NVARCHAR (100) NOT NULL,
    [ClosedFlag]           BIT            NOT NULL,
    [NotToBeCompletedFlag] BIT            NOT NULL,
    [SystemUseOnlyFlag]    BIT            NOT NULL
);


GO

