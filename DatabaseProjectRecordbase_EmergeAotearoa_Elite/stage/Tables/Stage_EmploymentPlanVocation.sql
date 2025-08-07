CREATE TABLE [stage].[Stage_EmploymentPlanVocation] (
    [ID]                  INT            NOT NULL,
    [WageSubsidy]         BIT            NOT NULL,
    [Sheltered]           BIT            NOT NULL,
    [SupportedWageScheme] BIT            NOT NULL,
    [EndReasonID]         INT            NULL,
    [EndReasonComment]    NVARCHAR (MAX) NULL,
    [EndUserID]           INT            NULL,
    [EndUserDate]         DATETIME       NULL,
    [EndJobMethodID]      INT            NULL
);


GO

