CREATE TABLE [dl].[FactPersonStatus] (
    [PersonStatusID]                      INT           NOT NULL,
    [PersonID]                            INT           NOT NULL,
    [PersonStatusTypeID]                  INT           NOT NULL,
    [PersonStatusStartDate]               DATETIME      NOT NULL,
    [PersonStatusEndDate]                 DATETIME      NULL,
    [PersonStatusDetail]                  VARCHAR (300) NULL,
    [PersonStatusCreatedUserID]           INT           NOT NULL,
    [PersonStatusCreatedDate]             DATETIME      NOT NULL,
    [PersonStatusAbsenceApprovedByFunder] BIT           NULL,
    [AbsenceReasonId]                     INT           NULL,
    CONSTRAINT [PK_dl_FactPersonStatus] PRIMARY KEY CLUSTERED ([PersonStatusID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactPersonStatus_PersonStatusTypeID_StartDate]
    ON [dl].[FactPersonStatus]([PersonStatusTypeID] ASC, [PersonStatusStartDate] ASC)
    INCLUDE([PersonID], [PersonStatusEndDate]);


GO

