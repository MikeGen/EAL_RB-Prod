CREATE TABLE [stage].[Stage_ActivityIPMHA] (
    [id]                           INT            NOT NULL,
    [ActivityId]                   INT            NOT NULL,
    [SessionTypeId]                INT            NOT NULL,
    [JudgementOfChangeId]          INT            NOT NULL,
    [ClientProblemRating]          INT            NULL,
    [ConfidenceInCarryingOutPlans] INT            NULL,
    [HowHelpfulWasThisVisit]       INT            NOT NULL,
    [ExternalReferralId]           INT            NULL,
    [ClientExperienceOfPlan]       NVARCHAR (MAX) NULL,
    [CreatedUserId]                INT            NOT NULL,
    [CreatedDate]                  DATETIME2 (7)  NOT NULL,
    [ModifiedUserId]               INT            NULL,
    [ModifiedDate]                 DATETIME2 (7)  NULL,
    [DeletedUserId]                INT            NULL,
    [DeletedDate]                  DATETIME2 (7)  NULL,
    [NextEncounterBookedId]        INT            NULL
);


GO

