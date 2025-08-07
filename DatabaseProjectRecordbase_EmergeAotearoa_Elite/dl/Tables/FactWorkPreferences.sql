CREATE TABLE [dl].[FactWorkPreferences] (
    [WorkPreferencesID]                     INT            NOT NULL,
    [EmploymentPlanID]                      INT            NOT NULL,
    [WorkPreferencesPosition]               NVARCHAR (300) NOT NULL,
    [IndustryID]                            INT            NOT NULL,
    [WorkPreferencesLocation]               NVARCHAR (300) NOT NULL,
    [RegionID]                              INT            NOT NULL,
    [WorkPreferencesWorkingHours]           NVARCHAR (300) NULL,
    [WorkPreferencesHoursPerWeek]           FLOAT (53)     NULL,
    [WorkPreferencesPreferredDaysMonday]    BIT            NULL,
    [WorkPreferencesPreferredDaysTuesday]   BIT            NULL,
    [WorkPreferencesPreferredDaysWednesday] BIT            NULL,
    [WorkPreferencesPreferredDaysThursday]  BIT            NULL,
    [WorkPreferencesPreferredDaysFriday]    BIT            NULL,
    [WorkPreferencesPreferredDaysSaturday]  BIT            NULL,
    [WorkPreferencesPreferredDaysSunday]    BIT            NULL,
    [WorkPreferencesRawDescription]         NVARCHAR (MAX) NULL,
    [WorkPreferencesUDF1]                   NVARCHAR (MAX) NULL,
    [WorkPreferencesUDF2]                   NVARCHAR (MAX) NULL,
    [WorkPreferencesUDF3]                   NVARCHAR (MAX) NULL,
    [WorkPreferencesUDF4]                   NVARCHAR (MAX) NULL,
    [WorkPreferencesUDF5]                   NVARCHAR (MAX) NULL,
    [WorkPreferencesCreatedDate]            DATETIME       NOT NULL,
    [WorkPreferencesCreatedUserID]          INT            NOT NULL,
    [WorkPreferencesHTMLDescription]        NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_FactWorkPreferences] PRIMARY KEY CLUSTERED ([WorkPreferencesID] ASC)
);


GO

