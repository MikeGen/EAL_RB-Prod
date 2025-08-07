CREATE TABLE [stage].[Stage_PrimhdServiceReview] (
    [Id]                    INT      NOT NULL,
    [PersonId]              INT      NOT NULL,
    [ReviewDate]            DATETIME NOT NULL,
    [ReferralId]            INT      NOT NULL,
    [AccommodationStatusId] INT      NULL,
    [EmploymentStatusId]    INT      NULL,
    [EducationStatusId]     INT      NULL,
    [WellnessPlanStatusId]  INT      NULL,
    [CreatedDate]           DATETIME NOT NULL,
    [CreatedUserID]         INT      NOT NULL,
    [ModifiedDate]          DATETIME NULL,
    [ModifiedUserID]        INT      NULL,
    [DeletedDate]           DATETIME NULL,
    [DeletedUserId]         INT      NULL
);


GO

