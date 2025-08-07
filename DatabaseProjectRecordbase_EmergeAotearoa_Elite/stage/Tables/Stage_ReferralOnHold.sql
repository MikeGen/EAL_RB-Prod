CREATE TABLE [stage].[Stage_ReferralOnHold] (
    [Id]             INT            NOT NULL,
    [ReferralId]     INT            NOT NULL,
    [StartDate]      DATETIME2 (7)  NOT NULL,
    [EndDate]        DATETIME2 (7)  NULL,
    [ReviewDate]     DATETIME2 (7)  NULL,
    [ReasonId]       INT            NULL,
    [Comments]       NVARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME2 (7)  NOT NULL,
    [CreatedUserId]  INT            NOT NULL,
    [ModifiedDate]   DATETIME2 (7)  NULL,
    [ModifiedUserId] INT            NULL,
    [DeletedDate]    DATETIME2 (7)  NULL,
    [DeletedUserId]  INT            NULL
);


GO

