CREATE TABLE [stage].[Stage_TeamReferralStatusTypeReason] (
    [Id]                         INT           NOT NULL,
    [TeamId]                     INT           NOT NULL,
    [ReferralStatusTypeReasonId] INT           NOT NULL,
    [CreatedDate]                DATETIME2 (7) NOT NULL,
    [CreatedUserId]              INT           NOT NULL,
    [ModifiedDate]               DATETIME2 (7) NULL,
    [ModifiedUserId]             INT           NULL,
    [DeletedDate]                DATETIME2 (7) NULL,
    [DeletedUserId]              INT           NULL
);


GO

