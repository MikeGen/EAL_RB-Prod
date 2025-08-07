CREATE TABLE [dl].[FactReferralStatus] (
    [ReferralStatusID]            INT           NOT NULL,
    [ReferralID]                  INT           NOT NULL,
    [ReferralStatusTypeID]        INT           NOT NULL,
    [ReferralStatusStartDate]     DATETIME      NOT NULL,
    [ReferralStatusTypeReasonID]  INT           NULL,
    [ReferralStatusCreatedUserID] INT           NOT NULL,
    [ReferralStatusCreatedDate]   DATETIME      NOT NULL,
    [ReferralStatusComments]      VARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_FactReferralStatus] PRIMARY KEY CLUSTERED ([ReferralStatusID] ASC)
);


GO

