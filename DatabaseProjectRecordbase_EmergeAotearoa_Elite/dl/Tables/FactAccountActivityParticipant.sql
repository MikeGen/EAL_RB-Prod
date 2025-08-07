CREATE TABLE [dl].[FactAccountActivityParticipant] (
    [AccountActivityParticipantID]            INT      NOT NULL,
    [AccountActivityID]                       INT      NOT NULL,
    [UserID]                                  INT      NOT NULL,
    [AccountActivityParticipantCreatedDate]   DATETIME NOT NULL,
    [AccountActivityParticipantCreatedUserID] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactAccountActivityParticipant] PRIMARY KEY CLUSTERED ([AccountActivityParticipantID] ASC)
);


GO

