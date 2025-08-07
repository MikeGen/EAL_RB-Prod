CREATE TABLE [dl].[DimPRIMHDReviewAccommodationStatus] (
    [PRIMHDReviewAccommodationStatusID]       INT            NOT NULL,
    [PRIMHDReviewAccommodationStatusValue]    NVARCHAR (200) NOT NULL,
    [PRIMHDReviewAccommodationStatusText]     NVARCHAR (200) NOT NULL,
    [PRIMHDReviewAccommodationStatusParentId] INT            NULL,
    [PRIMHDReviewAccommodationStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPRIMHDReviewAccommodationStatus] PRIMARY KEY CLUSTERED ([PRIMHDReviewAccommodationStatusID] ASC)
);


GO

