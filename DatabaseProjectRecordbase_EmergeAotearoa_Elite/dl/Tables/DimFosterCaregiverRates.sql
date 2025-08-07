CREATE TABLE [dl].[DimFosterCaregiverRates] (
    [FosterCaregiverRatesId]                INT            NOT NULL,
    [FosterCaregiverRatesStartDate]         DATETIME2 (7)  NOT NULL,
    [FosterCaregiverRatesEndDate]           DATETIME2 (7)  NULL,
    [FosterCaregiverRatesAgeStart]          INT            NOT NULL,
    [FosterCaregiverRatesAgeEnd]            INT            NOT NULL,
    [FosterCaregiverRatesWeeklyBoard]       NUMERIC (9, 2) NULL,
    [FosterCaregiverRatesWeeklyPocketMoney] NUMERIC (9, 2) NULL,
    [FosterCaregiverRatesAnnualBirthday]    NUMERIC (9, 2) NULL,
    [FosterCaregiverRatesAnnualChristmas]   NUMERIC (9, 2) NULL,
    [FosterCaregiverRatesQuarterlyClothing] NUMERIC (9, 2) NULL,
    CONSTRAINT [PK_dl_DimFosterCaregiverRates] PRIMARY KEY CLUSTERED ([FosterCaregiverRatesId] ASC)
);


GO

