CREATE TABLE [dl].[FactPersonalPlan] (
    [PersonalPlanID]              INT            NOT NULL,
    [PersonID]                    INT            NOT NULL,
    [PersonalPlanTitle]           NVARCHAR (200) NOT NULL,
    [PersonalPlanRawDescription]  NVARCHAR (MAX) NULL,
    [PersonalPlanStartDate]       SMALLDATETIME  NOT NULL,
    [PersonalPlanEndDate]         SMALLDATETIME  NULL,
    [PersonalPlanReviewCycle]     INT            NOT NULL,
    [PersonalPlanNextReviewDate]  SMALLDATETIME  NULL,
    [PersonalPlanCreatedDate]     DATETIME       NOT NULL,
    [PersonalPlanCreatedUserID]   INT            NOT NULL,
    [PersonalPlanHtmlDescription] NVARCHAR (MAX) NULL,
    [ReferralID]                  INT            NULL,
    CONSTRAINT [PK_dl_FactPersonalPlan] PRIMARY KEY CLUSTERED ([PersonalPlanID] ASC)
);


GO

