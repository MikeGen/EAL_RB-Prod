CREATE TABLE [stage].[Stage_EmploymentPlan] (
    [ID]                                               INT            NOT NULL,
    [EmploymentPlanTemplateID]                         INT            NOT NULL,
    [StartDate]                                        DATETIME       NOT NULL,
    [CloseDate]                                        DATETIME       NULL,
    [CurrentPhaseID]                                   INT            NOT NULL,
    [PrimaryCaseWorkerID]                              INT            NOT NULL,
    [ReferralID]                                       INT            NOT NULL,
    [PlanningAndPrepExpectedDuration]                  INT            NOT NULL,
    [PlanningAndPrepExpectedActivityHours]             INT            NULL,
    [PlanningAndPrepRequireCompletionOfMandatoryTasks] BIT            NOT NULL,
    [JobSearchExpectedDuration]                        INT            NULL,
    [JobSearchExpectedActivityHours]                   INT            NULL,
    [JobSearchRequireCompletionOfMandatoryTasks]       BIT            NULL,
    [JobSearchStartDate]                               DATETIME       NULL,
    [PlacementSupportExpectedDuration]                 INT            NULL,
    [PlacementSupportExpectedActivityHours]            INT            NULL,
    [PlacementSupportStartDate]                        DATETIME       NULL,
    [CreatedDate]                                      DATETIME       NOT NULL,
    [CreatedUserID]                                    INT            NOT NULL,
    [ModifiedDate]                                     DATETIME       NULL,
    [ModifiedUserID]                                   INT            NULL,
    [DeletedDate]                                      DATETIME       NULL,
    [DeletedUserID]                                    INT            NULL,
    [PersonID]                                         INT            NOT NULL,
    [ClosedComments]                                   NVARCHAR (MAX) NULL,
    [UDF1]                                             NVARCHAR (MAX) NULL,
    [UDF2]                                             NVARCHAR (MAX) NULL,
    [UDF3]                                             NVARCHAR (MAX) NULL,
    [UDF4]                                             NVARCHAR (MAX) NULL,
    [UDF5]                                             NVARCHAR (MAX) NULL,
    [ClosedReasonID]                                   INT            NULL,
    [IsSupportPlan]                                    BIT            NOT NULL,
    [Title]                                            NVARCHAR (200) NULL
);


GO

