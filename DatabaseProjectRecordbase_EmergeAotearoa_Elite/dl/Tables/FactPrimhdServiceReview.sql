CREATE TABLE [dl].[FactPrimhdServiceReview] (
    [PrimhdServiceReviewId]            INT      NOT NULL,
    [PersonId]                         INT      NOT NULL,
    [PrimhdServiceReviewReviewDate]    DATETIME NOT NULL,
    [ReferralId]                       INT      NOT NULL,
    [AccommodationStatusId]            INT      NULL,
    [EmploymentStatusId]               INT      NULL,
    [EducationStatusId]                INT      NULL,
    [WellnessPlanStatusId]             INT      NULL,
    [PrimhdServiceReviewCreatedDate]   DATETIME NOT NULL,
    [PrimhdServiceReviewCreatedUserID] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactPrimhdServiceReview] PRIMARY KEY CLUSTERED ([PrimhdServiceReviewId] ASC)
);


GO

