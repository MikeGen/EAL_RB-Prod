CREATE TABLE [stage].[Stage_FosterCaregiverRates] (
    [Id]                INT            NOT NULL,
    [StartDate]         DATETIME2 (7)  NOT NULL,
    [EndDate]           DATETIME2 (7)  NULL,
    [AgeStart]          INT            NOT NULL,
    [AgeEnd]            INT            NOT NULL,
    [WeeklyBoard]       NUMERIC (9, 2) NULL,
    [WeeklyPocketMoney] NUMERIC (9, 2) NULL,
    [AnnualBirthday]    NUMERIC (9, 2) NULL,
    [AnnualChristmas]   NUMERIC (9, 2) NULL,
    [QuarterlyClothing] NUMERIC (9, 2) NULL
);


GO

