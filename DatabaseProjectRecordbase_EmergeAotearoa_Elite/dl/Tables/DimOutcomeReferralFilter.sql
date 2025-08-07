CREATE TABLE [dl].[DimOutcomeReferralFilter] (
    [OutcomeReferralFilterID]       INT            NOT NULL,
    [OutcomeReferralFilterValue]    NVARCHAR (200) NOT NULL,
    [OutcomeReferralFilterText]     NVARCHAR (200) NOT NULL,
    [OutcomeReferralFilterParentId] INT            NULL,
    [OutcomeReferralFilterIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimOutcomeReferralFilter] PRIMARY KEY CLUSTERED ([OutcomeReferralFilterID] ASC)
);


GO

