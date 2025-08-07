CREATE TABLE [dl].[DimReferralPriority] (
    [ReferralPriorityID]       INT            NOT NULL,
    [ReferralPriorityValue]    NVARCHAR (200) NOT NULL,
    [ReferralPriorityText]     NVARCHAR (200) NOT NULL,
    [ReferralPriorityParentId] INT            NULL,
    [ReferralPriorityIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimReferralPriority] PRIMARY KEY CLUSTERED ([ReferralPriorityID] ASC)
);


GO

