CREATE TABLE [dl].[DimEmploymentPlanPhase] (
    [EmploymentPlanPhaseID]           INT            NOT NULL,
    [EmploymentPlanPhaseCode]         NVARCHAR (20)  NOT NULL,
    [EmploymentPlanPhaseAbbreviation] NVARCHAR (5)   NOT NULL,
    [EmploymentPlanPhaseDisplayName]  NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_dl_DimEmploymentPlanPhase] PRIMARY KEY CLUSTERED ([EmploymentPlanPhaseID] ASC)
);


GO

