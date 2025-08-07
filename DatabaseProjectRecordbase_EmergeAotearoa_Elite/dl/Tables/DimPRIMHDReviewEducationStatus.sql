CREATE TABLE [dl].[DimPRIMHDReviewEducationStatus] (
    [PRIMHDReviewEducationStatusID]       INT            NOT NULL,
    [PRIMHDReviewEducationStatusValue]    NVARCHAR (200) NOT NULL,
    [PRIMHDReviewEducationStatusText]     NVARCHAR (200) NOT NULL,
    [PRIMHDReviewEducationStatusParentId] INT            NULL,
    [PRIMHDReviewEducationStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPRIMHDReviewEducationStatus] PRIMARY KEY CLUSTERED ([PRIMHDReviewEducationStatusID] ASC)
);


GO

