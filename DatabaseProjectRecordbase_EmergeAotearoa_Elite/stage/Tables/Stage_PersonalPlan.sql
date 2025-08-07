CREATE TABLE [stage].[Stage_PersonalPlan] (
    [ID]              INT            NOT NULL,
    [PersonID]        INT            NOT NULL,
    [Title]           NVARCHAR (200) NOT NULL,
    [RawDescription]  NVARCHAR (MAX) NULL,
    [StartDate]       SMALLDATETIME  NOT NULL,
    [EndDate]         SMALLDATETIME  NULL,
    [ReviewCycle]     INT            NOT NULL,
    [NextReviewDate]  SMALLDATETIME  NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedUserID]   INT            NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedUserID]  INT            NULL,
    [DeletedDate]     DATETIME       NULL,
    [DeletedUserID]   INT            NULL,
    [HtmlDescription] NVARCHAR (MAX) NULL,
    [ReferralID]      INT            NULL
);


GO

