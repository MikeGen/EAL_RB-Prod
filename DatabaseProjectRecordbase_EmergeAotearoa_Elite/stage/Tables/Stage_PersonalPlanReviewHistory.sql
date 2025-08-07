CREATE TABLE [stage].[Stage_PersonalPlanReviewHistory] (
    [ID]             INT            NOT NULL,
    [PersonalPlanID] INT            NOT NULL,
    [ReviewDate]     DATETIME       NOT NULL,
    [ReviewUserID]   INT            NULL,
    [Comments]       NVARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL
);


GO

