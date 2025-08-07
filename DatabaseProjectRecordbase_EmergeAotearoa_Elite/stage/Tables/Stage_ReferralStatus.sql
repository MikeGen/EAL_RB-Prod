CREATE TABLE [stage].[Stage_ReferralStatus] (
    [ID]                         INT           NOT NULL,
    [ReferralID]                 INT           NOT NULL,
    [ReferralStatusTypeID]       INT           NOT NULL,
    [StartDate]                  DATETIME      NOT NULL,
    [ReferralStatusTypeReasonID] INT           NULL,
    [InactiveUserID]             INT           NULL,
    [InactiveDate]               DATETIME      NULL,
    [CreatedUserID]              INT           NOT NULL,
    [CreatedDate]                DATETIME      NOT NULL,
    [ModifiedUserID]             INT           NULL,
    [ModifiedDate]               DATETIME      NULL,
    [DeletedUserID]              INT           NULL,
    [DeletedDate]                DATETIME      NULL,
    [Comments]                   VARCHAR (MAX) NULL
);


GO

