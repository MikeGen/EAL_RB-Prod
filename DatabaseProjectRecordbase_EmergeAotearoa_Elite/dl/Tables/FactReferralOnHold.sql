CREATE TABLE [dl].[FactReferralOnHold] (
    [ReferralOnHoldId]            INT            NOT NULL,
    [ReferralId]                  INT            NOT NULL,
    [ReferralOnHoldStartDate]     DATETIME2 (7)  NOT NULL,
    [ReferralOnHoldEndDate]       DATETIME2 (7)  NULL,
    [ReferralOnHoldReviewDate]    DATETIME2 (7)  NULL,
    [ReasonId]                    INT            NULL,
    [ReferralOnHoldComments]      NVARCHAR (MAX) NULL,
    [ReferralOnHoldCreatedDate]   DATETIME2 (7)  NOT NULL,
    [ReferralOnHoldCreatedUserId] INT            NOT NULL,
    CONSTRAINT [PK_dl_FactReferralOnHold] PRIMARY KEY CLUSTERED ([ReferralOnHoldId] ASC)
);


GO

