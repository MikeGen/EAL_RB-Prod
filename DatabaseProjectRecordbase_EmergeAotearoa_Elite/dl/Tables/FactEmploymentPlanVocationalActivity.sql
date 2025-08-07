CREATE TABLE [dl].[FactEmploymentPlanVocationalActivity] (
    [EmploymentPlanVocationalActivityID]             INT            NOT NULL,
    [EmploymentPlanVocationalActivityVoluntary]      BIT            NOT NULL,
    [EmploymentPlanVocationalActivityWorkExperience] BIT            NOT NULL,
    [EmploymentPlanVocationalActivityTemporary]      BIT            NOT NULL,
    [EmploymentPlanVocationalActivityUDF1]           NVARCHAR (MAX) NULL,
    [EmploymentPlanVocationalActivityUDF2]           NVARCHAR (MAX) NULL,
    [EmploymentPlanVocationalActivityUDF3]           NVARCHAR (MAX) NULL,
    [EmploymentPlanVocationalActivityUDF4]           NVARCHAR (MAX) NULL,
    [EmploymentPlanVocationalActivityUDF5]           NVARCHAR (MAX) NULL,
    [EmploymentPlanVocationalActivityHoursPerWeek]   REAL           NOT NULL,
    CONSTRAINT [PK_dl_FactEmploymentPlanVocationalActivity] PRIMARY KEY CLUSTERED ([EmploymentPlanVocationalActivityID] ASC)
);


GO

