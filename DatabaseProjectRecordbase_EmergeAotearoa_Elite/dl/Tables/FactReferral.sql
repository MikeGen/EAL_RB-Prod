CREATE TABLE [dl].[FactReferral] (
    [ReferralID]                    INT            NOT NULL,
    [PersonID]                      INT            NOT NULL,
    [ReferralReceivedDate]          DATETIME       NOT NULL,
    [SourceReferrerID]              INT            NULL,
    [SourceReferralID]              INT            NULL,
    [TeamID]                        INT            NULL,
    [OrganisationID]                INT            NULL,
    [CurrentReferralStatusTypeID]   INT            NULL,
    [ReferralPriorityID]            INT            NULL,
    [ReferralExpectedArrivalDate]   DATETIME       NULL,
    [ReferralExpectedDepartureDate] DATETIME       NULL,
    [ReferralActualArrivalDate]     DATETIME       NULL,
    [ReferralActualDepartureDate]   DATETIME       NULL,
    [ReferralEndDate]               DATETIME       NULL,
    [ReferralNotes]                 NVARCHAR (MAX) NULL,
    [OldReferralID]                 INT            NULL,
    [OldMovementID]                 INT            NULL,
    [ReferralUDF1]                  NVARCHAR (MAX) NULL,
    [ReferralUDF2]                  NVARCHAR (MAX) NULL,
    [ReferralUDF3]                  NVARCHAR (MAX) NULL,
    [ReferralUDF4]                  NVARCHAR (MAX) NULL,
    [ReferralUDF5]                  NVARCHAR (MAX) NULL,
    [InterviewUserID]               INT            NULL,
    [ReferralInterviewDate]         DATETIME       NULL,
    [ReferralCreatedUserID]         INT            NOT NULL,
    [ReferralCreatedDate]           DATETIME       NOT NULL,
    [ReferralReferralType]          VARCHAR (32)   NOT NULL,
    [ReferralPresentingIssueId1]    INT            NULL,
    [ReferralPresentingIssueId2]    INT            NULL,
    [ReferralPresentingIssueId3]    INT            NULL,
    CONSTRAINT [PK_dl_FactReferral] PRIMARY KEY CLUSTERED ([ReferralID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [tmp1]
    ON [dl].[FactReferral]([ReferralCreatedDate] ASC);


GO

