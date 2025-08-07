CREATE TABLE [transform].[FactPCOMS] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [PersonID]         INT            NULL,
    [PersonAge]        INT            NULL,
    [PeriodOfCareID]   INT            NULL,
    [AssessmentDate]   DATETIME       NULL,
    [Session]          INT            NULL,
    [SessionType]      NVARCHAR (255) NULL,
    [InitialScore]     FLOAT (53)     NULL,
    [ORSMissed]        INT            NULL,
    [ORSQ1]            FLOAT (53)     NULL,
    [ORSQ2]            FLOAT (53)     NULL,
    [ORSQ3]            FLOAT (53)     NULL,
    [ORSQ4]            FLOAT (53)     NULL,
    [ORSTotal]         FLOAT (53)     NULL,
    [ORSCutoff]        FLOAT (53)     NULL,
    [SRSMissed]        INT            NULL,
    [SRSQ1]            FLOAT (53)     NULL,
    [SRSQ2]            FLOAT (53)     NULL,
    [SRSQ3]            FLOAT (53)     NULL,
    [SRSQ4]            FLOAT (53)     NULL,
    [SRSTotal]         FLOAT (53)     NULL,
    [SRSCutoff]        FLOAT (53)     NULL,
    [ExpectedProgress] FLOAT (53)     NULL,
    [RiskValue]        FLOAT (53)     NULL
);


GO

