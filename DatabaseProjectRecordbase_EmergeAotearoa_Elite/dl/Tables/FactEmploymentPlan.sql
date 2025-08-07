CREATE TABLE [dl].[FactEmploymentPlan] (
    [EmploymentPlanID]                                               INT            NOT NULL,
    [EmploymentPlanTemplateID]                                       INT            NOT NULL,
    [EmploymentPlanStartDate]                                        DATETIME       NOT NULL,
    [EmploymentPlanCloseDate]                                        DATETIME       NULL,
    [CurrentPhaseID]                                                 INT            NOT NULL,
    [PrimaryCaseWorkerID]                                            INT            NOT NULL,
    [ReferralID]                                                     INT            NOT NULL,
    [EmploymentPlanPlanningAndPrepExpectedDuration]                  INT            NOT NULL,
    [EmploymentPlanPlanningAndPrepExpectedActivityHours]             INT            NULL,
    [EmploymentPlanPlanningAndPrepRequireCompletionOfMandatoryTasks] BIT            NOT NULL,
    [EmploymentPlanJobSearchExpectedDuration]                        INT            NULL,
    [EmploymentPlanJobSearchExpectedActivityHours]                   INT            NULL,
    [EmploymentPlanJobSearchRequireCompletionOfMandatoryTasks]       BIT            NULL,
    [EmploymentPlanJobSearchStartDate]                               DATETIME       NULL,
    [EmploymentPlanPlacementSupportExpectedDuration]                 INT            NULL,
    [EmploymentPlanPlacementSupportExpectedActivityHours]            INT            NULL,
    [EmploymentPlanPlacementSupportStartDate]                        DATETIME       NULL,
    [EmploymentPlanCreatedDate]                                      DATETIME       NOT NULL,
    [EmploymentPlanCreatedUserID]                                    INT            NOT NULL,
    [PersonID]                                                       INT            NOT NULL,
    [EmploymentPlanClosedComments]                                   NVARCHAR (MAX) NULL,
    [EmploymentPlanUDF1]                                             NVARCHAR (MAX) NULL,
    [EmploymentPlanUDF2]                                             NVARCHAR (MAX) NULL,
    [EmploymentPlanUDF3]                                             NVARCHAR (MAX) NULL,
    [EmploymentPlanUDF4]                                             NVARCHAR (MAX) NULL,
    [EmploymentPlanUDF5]                                             NVARCHAR (MAX) NULL,
    [ClosedReasonID]                                                 INT            NULL,
    [EmploymentPlanIsSupportPlan]                                    BIT            NOT NULL,
    [EmploymentPlanTitle]                                            NVARCHAR (200) NULL,
    CONSTRAINT [PK_dl_FactEmploymentPlan] PRIMARY KEY CLUSTERED ([EmploymentPlanID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [EmploymentPlan_IsSupportPlan]
    ON [dl].[FactEmploymentPlan]([EmploymentPlanIsSupportPlan] ASC)
    INCLUDE([EmploymentPlanID]);


GO

