CREATE TABLE [dl].[FactTeamReferralStatusTypeReason] (
    [TeamReferralStatusTypeReasonId]            INT           NOT NULL,
    [TeamId]                                    INT           NOT NULL,
    [ReferralStatusTypeReasonId]                INT           NOT NULL,
    [TeamReferralStatusTypeReasonCreatedDate]   DATETIME2 (7) NOT NULL,
    [TeamReferralStatusTypeReasonCreatedUserId] INT           NOT NULL,
    CONSTRAINT [PK_dl_FactTeamReferralStatusTypeReason] PRIMARY KEY CLUSTERED ([TeamReferralStatusTypeReasonId] ASC)
);


GO

