CREATE TABLE [dl].[DimPRIMHDReviewEmploymentStatus] (
    [PRIMHDReviewEmploymentStatusID]       INT            NOT NULL,
    [PRIMHDReviewEmploymentStatusValue]    NVARCHAR (200) NOT NULL,
    [PRIMHDReviewEmploymentStatusText]     NVARCHAR (200) NOT NULL,
    [PRIMHDReviewEmploymentStatusParentId] INT            NULL,
    [PRIMHDReviewEmploymentStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPRIMHDReviewEmploymentStatus] PRIMARY KEY CLUSTERED ([PRIMHDReviewEmploymentStatusID] ASC)
);


GO

