CREATE TABLE [stage].[Stage_WorkPreferences] (
    [ID]                     INT            NOT NULL,
    [EmploymentPlanID]       INT            NOT NULL,
    [Position]               NVARCHAR (300) NOT NULL,
    [IndustryID]             INT            NOT NULL,
    [Location]               NVARCHAR (300) NOT NULL,
    [RegionID]               INT            NOT NULL,
    [WorkingHours]           NVARCHAR (300) NULL,
    [HoursPerWeek]           FLOAT (53)     NULL,
    [PreferredDaysMonday]    BIT            NULL,
    [PreferredDaysTuesday]   BIT            NULL,
    [PreferredDaysWednesday] BIT            NULL,
    [PreferredDaysThursday]  BIT            NULL,
    [PreferredDaysFriday]    BIT            NULL,
    [PreferredDaysSaturday]  BIT            NULL,
    [PreferredDaysSunday]    BIT            NULL,
    [RawDescription]         NVARCHAR (MAX) NULL,
    [UDF1]                   NVARCHAR (MAX) NULL,
    [UDF2]                   NVARCHAR (MAX) NULL,
    [UDF3]                   NVARCHAR (MAX) NULL,
    [UDF4]                   NVARCHAR (MAX) NULL,
    [UDF5]                   NVARCHAR (MAX) NULL,
    [CreatedDate]            DATETIME       NOT NULL,
    [CreatedUserID]          INT            NOT NULL,
    [ModifiedDate]           DATETIME       NULL,
    [ModifiedUserID]         INT            NULL,
    [DeletedDate]            DATETIME       NULL,
    [DeletedUserID]          INT            NULL,
    [HTMLDescription]        NVARCHAR (MAX) NULL
);


GO

