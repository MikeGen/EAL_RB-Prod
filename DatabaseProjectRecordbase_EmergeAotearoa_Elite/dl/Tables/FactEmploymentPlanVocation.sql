CREATE TABLE [dl].[FactEmploymentPlanVocation] (
    [EmploymentPlanVocationID]                  INT            NOT NULL,
    [EmploymentPlanVocationWageSubsidy]         BIT            NOT NULL,
    [EmploymentPlanVocationSheltered]           BIT            NOT NULL,
    [EmploymentPlanVocationSupportedWageScheme] BIT            NOT NULL,
    [EndReasonID]                               INT            NULL,
    [EmploymentPlanVocationEndReasonComment]    NVARCHAR (MAX) NULL,
    [EndUserID]                                 INT            NULL,
    [EmploymentPlanVocationEndUserDate]         DATETIME       NULL,
    [EndJobMethodID]                            INT            NULL,
    CONSTRAINT [PK_dl_FactEmploymentPlanVocation] PRIMARY KEY CLUSTERED ([EmploymentPlanVocationID] ASC)
);


GO

