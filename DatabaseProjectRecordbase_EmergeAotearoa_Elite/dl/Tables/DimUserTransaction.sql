CREATE TABLE [dl].[DimUserTransaction] (
    [TStart]                    DATETIME       NULL,
    [TEnd]                      DATETIME       NULL,
    [TUserId]                   INT            NULL,
    [UserId]                    INT            NULL,
    [Username]                  NVARCHAR (300) NULL,
    [FirstName]                 NVARCHAR (50)  NULL,
    [LastName]                  NVARCHAR (50)  NULL,
    [PreferredName]             NVARCHAR (50)  NULL,
    [EmailAddress]              NVARCHAR (300) NULL,
    [Position]                  NVARCHAR (50)  NULL,
    [ReportsToUserID]           INT            NULL,
    [EmployeeNumber]            NVARCHAR (50)  NULL,
    [LicenceType]               VARCHAR (50)   NULL,
    [IsRecordbaseAdministrator] BIT            NULL,
    [IsChampion]                BIT            NULL,
    [UserTypeID]                INT            NULL,
    [DisabledDate]              DATETIME       NULL,
    [DisabledUserID]            INT            NULL,
    [DisabledNotes]             NVARCHAR (MAX) NULL,
    [IsVolunteer]               BIT            NULL,
    [EmploymentTypeId]          INT            NULL,
    [FTE]                       DECIMAL (3, 1) NULL,
    [Comments]                  NVARCHAR (MAX) NULL
);


GO

