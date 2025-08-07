CREATE TABLE [dl].[DimPRIMHDReviewWellnessPlanStatus] (
    [PRIMHDReviewWellnessPlanStatusID]       INT            NOT NULL,
    [PRIMHDReviewWellnessPlanStatusValue]    NVARCHAR (200) NOT NULL,
    [PRIMHDReviewWellnessPlanStatusText]     NVARCHAR (200) NOT NULL,
    [PRIMHDReviewWellnessPlanStatusParentId] INT            NULL,
    [PRIMHDReviewWellnessPlanStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPRIMHDReviewWellnessPlanStatus] PRIMARY KEY CLUSTERED ([PRIMHDReviewWellnessPlanStatusID] ASC)
);


GO

