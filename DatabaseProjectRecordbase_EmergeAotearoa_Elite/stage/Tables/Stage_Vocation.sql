CREATE TABLE [stage].[Stage_Vocation] (
    [ID]               INT            NOT NULL,
    [Position]         NVARCHAR (300) NOT NULL,
    [Location]         NVARCHAR (300) NULL,
    [PersonID]         INT            NOT NULL,
    [EmployerID]       INT            NULL,
    [EmployerName]     NVARCHAR (300) NULL,
    [RegionID]         INT            NOT NULL,
    [StartDate]        DATETIME       NOT NULL,
    [EndDate]          DATETIME       NULL,
    [EmploymentTypeID] INT            NULL,
    [HTMLDescription]  NVARCHAR (MAX) NULL,
    [RawDescription]   NVARCHAR (MAX) NULL,
    [IsMigrated]       BIT            NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedUserID]    INT            NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedUserID]   INT            NULL,
    [DeletedDate]      DATETIME       NULL,
    [DeletedUserID]    INT            NULL,
    [SelfEmployed]     BIT            NOT NULL,
    [IndustryID]       INT            NULL,
    [PayRatePerHour]   REAL           NULL
);


GO

