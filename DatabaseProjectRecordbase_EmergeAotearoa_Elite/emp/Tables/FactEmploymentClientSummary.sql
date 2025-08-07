CREATE TABLE [emp].[FactEmploymentClientSummary] (
    [ID]                            INT      IDENTITY (1, 1) NOT NULL,
    [ClientID]                      INT      NOT NULL,
    [DateKey]                       INT      NOT NULL,
    [CurrentlyEmployed]             BIT      NOT NULL,
    [LastContactWithClient]         DATETIME NULL,
    [AccreditedStudy]               BIT      NULL,
    [TotalDaysContinuousEmployment] INT      NULL,
    [HasVolunteerWork]              BIT      NULL,
    [HasWorkExperience]             BIT      NULL,
    [HasTemporaryWork]              BIT      NULL,
    [ContinuousEmploymentID]        INT      NULL
);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentClientSummary_DateKey]
    ON [emp].[FactEmploymentClientSummary]([DateKey] ASC)
    INCLUDE([AccreditedStudy], [ClientID], [CurrentlyEmployed], [LastContactWithClient], [TotalDaysContinuousEmployment]) WITH (FILLFACTOR = 100);


GO

