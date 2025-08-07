CREATE TABLE [dataset].[Referral] (
    [ReferralID]                       INT            NOT NULL,
    [PersonID]                         INT            NOT NULL,
    [ReferralArea]                     NVARCHAR (50)  NOT NULL,
    [ReferralTeamCode]                 NVARCHAR (10)  NOT NULL,
    [ReferralTeamName]                 NVARCHAR (100) NOT NULL,
    [ReferralTeamType]                 NVARCHAR (20)  NOT NULL,
    [ReferralSourceType]               NVARCHAR (10)  NOT NULL,
    [ReferralSource]                   NVARCHAR (200) NOT NULL,
    [ExternalReferrerCode]             NVARCHAR (20)  NULL,
    [InternalReferringTeam]            NVARCHAR (100) NULL,
    [InternalReferringTeamType]        NVARCHAR (20)  NULL,
    [OriginalReferrerCode]             NVARCHAR (20)  NOT NULL,
    [OriginalReferrerName]             NVARCHAR (50)  NOT NULL,
    [ReferralReceivedDate]             DATETIME       NOT NULL,
    [ReferralWaitlistDate]             DATETIME       NULL,
    [ReferralWaitlistReason]           NVARCHAR (300) NULL,
    [ReferralWaitlistCode]             NVARCHAR (50)  NULL,
    [ReferralAcceptDate]               DATETIME       NULL,
    [ReferralAcceptReason]             NVARCHAR (300) NULL,
    [ReferralAcceptCode]               NVARCHAR (50)  NULL,
    [ReferralDeclineDate]              DATETIME       NULL,
    [ReferralDeclineReason]            NVARCHAR (300) NULL,
    [ReferralDeclineCode]              NVARCHAR (50)  NULL,
    [ReferralDischargeDate]            DATETIME       NULL,
    [ReferralDischargeReason]          NVARCHAR (300) NULL,
    [ReferralDischargeCode]            NVARCHAR (50)  NULL,
    [DischargeOutboundDestination]     NVARCHAR (50)  NULL,
    [DischargeOutboundDestinationCode] NVARCHAR (20)  NULL,
    [ReferralEndDate]                  DATETIME       NULL,
    [ServiceStartDate]                 DATETIME       NULL,
    [ServiceEndDate]                   DATETIME       NULL,
    [ReferralCurrentStatus]            NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_dataset_Referral] PRIMARY KEY CLUSTERED ([ReferralID] ASC)
);


GO

