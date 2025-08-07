CREATE TABLE [transform].[DimCalendar] (
    [DateKey]            INT           NOT NULL,
    [ActualDate]         DATETIME      NOT NULL,
    [DateName]           NVARCHAR (70) NOT NULL,
    [Year]               DATETIME      NOT NULL,
    [YearName]           CHAR (4)      NOT NULL,
    [Quarter]            DATETIME      NOT NULL,
    [QuarterName]        VARCHAR (8)   NOT NULL,
    [Month]              DATETIME      NOT NULL,
    [MonthName]          VARCHAR (14)  NOT NULL,
    [Week]               DATETIME      NOT NULL,
    [WeekName]           VARCHAR (13)  NOT NULL,
    [DayOfYear]          INT           NOT NULL,
    [DayOfYearName]      VARCHAR (7)   NOT NULL,
    [DayOfQuarter]       INT           NOT NULL,
    [DayOfQuarterName]   VARCHAR (7)   NOT NULL,
    [DayOfMonth]         INT           NOT NULL,
    [DayOfMonthName]     VARCHAR (7)   NOT NULL,
    [DayOfWeek]          INT           NOT NULL,
    [DayOfWeekName]      VARCHAR (5)   NOT NULL,
    [WeekOfYear]         INT           NOT NULL,
    [WeekOfYearName]     VARCHAR (7)   NOT NULL,
    [MonthOfYear]        INT           NOT NULL,
    [MonthOfYearName]    VARCHAR (8)   NOT NULL,
    [MonthOfQuarter]     INT           NOT NULL,
    [MonthOfQuarterName] VARCHAR (8)   NOT NULL,
    [QuarterOfYear]      INT           NOT NULL,
    [QuarterOfYearName]  VARCHAR (9)   NOT NULL,
    CONSTRAINT [PK_transform_DimCalendar] PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO

