CREATE TABLE [stage].[Stage_PersonStatus] (
    [ID]                      INT           NOT NULL,
    [PersonID]                INT           NOT NULL,
    [PersonStatusTypeID]      INT           NOT NULL,
    [StartDate]               DATETIME      NOT NULL,
    [EndDate]                 DATETIME      NULL,
    [Detail]                  VARCHAR (300) NULL,
    [InactiveUserID]          INT           NULL,
    [InactiveDate]            DATETIME      NULL,
    [CreatedUserID]           INT           NOT NULL,
    [CreatedDate]             DATETIME      NOT NULL,
    [ModifiedUserID]          INT           NULL,
    [ModifiedDate]            DATETIME      NULL,
    [DeletedUserID]           INT           NULL,
    [DeletedDate]             DATETIME      NULL,
    [AbsenceApprovedByFunder] BIT           NULL,
    [AbsenceReasonId]         INT           NULL
);


GO

