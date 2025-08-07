CREATE TABLE [dl].[FactActivityIPMHA] (
    [ActivityIPMHAid]                           INT            NOT NULL,
    [ActivityId]                                INT            NOT NULL,
    [SessionTypeId]                             INT            NOT NULL,
    [JudgementOfChangeId]                       INT            NOT NULL,
    [ActivityIPMHAClientProblemRating]          INT            NULL,
    [ActivityIPMHAConfidenceInCarryingOutPlans] INT            NULL,
    [ActivityIPMHAHowHelpfulWasThisVisit]       INT            NOT NULL,
    [ExternalReferralId]                        INT            NULL,
    [ActivityIPMHAClientExperienceOfPlan]       NVARCHAR (MAX) NULL,
    [ActivityIPMHACreatedUserId]                INT            NOT NULL,
    [ActivityIPMHACreatedDate]                  DATETIME2 (7)  NOT NULL,
    [NextEncounterBookedId]                     INT            NULL
);


GO

