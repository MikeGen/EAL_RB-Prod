CREATE TABLE [stage].[Stage_TeamFunction] (
    [ID]                           INT            NOT NULL,
    [TeamConfigurationID]          INT            NOT NULL,
    [Code]                         NVARCHAR (50)  NULL,
    [Name]                         NVARCHAR (50)  NOT NULL,
    [Description]                  NVARCHAR (MAX) NULL,
    [AllowConcurrentReferrals]     BIT            NOT NULL,
    [IsAccomodationBased]          BIT            NOT NULL,
    [RecentlyDischargedPeriodDays] INT            NOT NULL,
    [DefaultTaskProcessID]         INT            NULL,
    [CreatedDate]                  DATETIME       NOT NULL,
    [CreatedUserID]                INT            NOT NULL,
    [ModifiedDate]                 DATETIME       NULL,
    [ModifiedUserID]               INT            NULL,
    [DeletedDate]                  DATETIME       NULL,
    [DeletedUserID]                INT            NULL,
    [AllowExitWithoutDischarge]    BIT            NOT NULL
);


GO

