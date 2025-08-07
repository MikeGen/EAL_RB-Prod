CREATE TABLE [dl].[DimReferralOnHoldReasons] (
    [ReferralOnHoldReasonsID]       INT            NOT NULL,
    [ReferralOnHoldReasonsValue]    NVARCHAR (200) NOT NULL,
    [ReferralOnHoldReasonsText]     NVARCHAR (200) NOT NULL,
    [ReferralOnHoldReasonsParentId] INT            NULL,
    [ReferralOnHoldReasonsIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimReferralOnHoldReasons] PRIMARY KEY CLUSTERED ([ReferralOnHoldReasonsID] ASC)
);


GO

