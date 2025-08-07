CREATE TABLE [dl].[DimPRIMHDReviewAccommodationStatu] (
    [PRIMHDReviewAccommodationStatuID]       INT            NOT NULL,
    [PRIMHDReviewAccommodationStatuValue]    NVARCHAR (200) NOT NULL,
    [PRIMHDReviewAccommodationStatuText]     NVARCHAR (200) NOT NULL,
    [PRIMHDReviewAccommodationStatuParentId] INT            NULL,
    [PRIMHDReviewAccommodationStatuIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPRIMHDReviewAccommodationStatu] PRIMARY KEY CLUSTERED ([PRIMHDReviewAccommodationStatuID] ASC)
);


GO

