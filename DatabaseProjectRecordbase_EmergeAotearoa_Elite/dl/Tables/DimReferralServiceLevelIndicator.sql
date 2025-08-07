CREATE TABLE [dl].[DimReferralServiceLevelIndicator] (
    [ReferralServiceLevelIndicatorID]       INT            NOT NULL,
    [ReferralServiceLevelIndicatorValue]    NVARCHAR (200) NOT NULL,
    [ReferralServiceLevelIndicatorText]     NVARCHAR (200) NOT NULL,
    [ReferralServiceLevelIndicatorParentId] INT            NULL,
    [ReferralServiceLevelIndicatorIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimReferralServiceLevelIndicator] PRIMARY KEY CLUSTERED ([ReferralServiceLevelIndicatorID] ASC)
);


GO

