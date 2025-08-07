CREATE TABLE [dl].[FactPersonalPlanReviewHistory] (
    [PersonalPlanReviewHistoryID]            INT            NOT NULL,
    [PersonalPlanID]                         INT            NOT NULL,
    [PersonalPlanReviewHistoryReviewDate]    DATETIME       NOT NULL,
    [ReviewUserID]                           INT            NULL,
    [PersonalPlanReviewHistoryComments]      NVARCHAR (MAX) NULL,
    [PersonalPlanReviewHistoryCreatedDate]   DATETIME       NOT NULL,
    [PersonalPlanReviewHistoryCreatedUserID] INT            NOT NULL,
    CONSTRAINT [PK_dl_FactPersonalPlanReviewHistory] PRIMARY KEY CLUSTERED ([PersonalPlanReviewHistoryID] ASC)
);


GO

