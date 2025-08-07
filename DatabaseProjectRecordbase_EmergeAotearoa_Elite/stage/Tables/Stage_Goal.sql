CREATE TABLE [stage].[Stage_Goal] (
    [ID]                    INT            NOT NULL,
    [Title]                 NVARCHAR (200) NOT NULL,
    [RawDescription]        NVARCHAR (MAX) NULL,
    [HTMLDescription]       NVARCHAR (MAX) NULL,
    [StartDate]             DATETIME       NOT NULL,
    [DueDate]               DATETIME       NULL,
    [OldGoalID]             INT            NULL,
    [PersonID]              INT            NOT NULL,
    [RawComments]           NVARCHAR (MAX) NULL,
    [HTMLComments]          NVARCHAR (MAX) NULL,
    [InactiveGoalReasonID]  INT            NULL,
    [InactiveDate]          DATETIME       NULL,
    [InactiveUserID]        INT            NULL,
    [CreatedDate]           DATETIME       NOT NULL,
    [CreatedUserID]         INT            NOT NULL,
    [ModifiedDate]          DATETIME       NULL,
    [ModifiedUserID]        INT            NULL,
    [DeletedDate]           DATETIME       NULL,
    [DeletedUserID]         INT            NULL,
    [ReferralID]            INT            NULL,
    [PersonalPlanID]        INT            NULL,
    [CloseCompletedDate]    DATETIME       NULL,
    [CloseNotCompletedDate] DATETIME       NULL,
    [CloseComments]         NVARCHAR (MAX) NULL,
    [CategoryID]            INT            NULL,
    [PriorityOutcome1Id]    INT            NULL,
    [PriorityOutcome2Id]    INT            NULL,
    [PriorityOutcome3Id]    INT            NULL
);


GO

