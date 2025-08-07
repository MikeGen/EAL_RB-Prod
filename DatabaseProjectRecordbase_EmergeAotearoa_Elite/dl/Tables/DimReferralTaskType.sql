CREATE TABLE [dl].[DimReferralTaskType] (
    [ReferralTaskTypeID]                      INT            NOT NULL,
    [TeamFunctionID]                          INT            NULL,
    [ReferralStatusTypeID]                    INT            NOT NULL,
    [ReferralTaskTypeName]                    NVARCHAR (300) NOT NULL,
    [ReferralTaskTypeDescription]             NVARCHAR (MAX) NULL,
    [ReferralTaskTypeExpectedCompletionHours] INT            NULL,
    [ReferralTaskTypeSortIndex]               INT            NULL,
    [ReferralTaskTypeRelatedUrl]              NVARCHAR (500) NULL,
    [TaskProcessID]                           INT            NULL,
    CONSTRAINT [PK_dl_DimReferralTaskType] PRIMARY KEY CLUSTERED ([ReferralTaskTypeID] ASC)
);


GO

