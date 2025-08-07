CREATE TABLE [dl].[DimUser] (
    [UserID]                        INT            NOT NULL,
    [UserUsername]                  NVARCHAR (300) NULL,
    [UserFirstName]                 NVARCHAR (50)  NULL,
    [UserLastName]                  NVARCHAR (50)  NULL,
    [UserPreferredName]             NVARCHAR (50)  NULL,
    [UserEmailAddress]              NVARCHAR (300) NULL,
    [UserPosition]                  NVARCHAR (50)  NULL,
    [ReportsToUserID]               INT            NULL,
    [AspNetUserID]                  VARCHAR (100)  NULL,
    [SID]                           VARCHAR (50)   NULL,
    [UserEmployeeNumber]            NVARCHAR (50)  NULL,
    [OldUserID]                     INT            NULL,
    [UserLicenceType]               VARCHAR (50)   NOT NULL,
    [UserIsRecordbaseAdministrator] BIT            NOT NULL,
    [UserIsChampion]                BIT            NOT NULL,
    [UserTypeID]                    INT            NOT NULL,
    [UserDisabledDate]              DATETIME       NULL,
    [DisabledUserID]                INT            NULL,
    [UserDisabledNotes]             NVARCHAR (MAX) NULL,
    [UseriCalendarEnabled]          BIT            NOT NULL,
    [UseriCalendarToken]            NVARCHAR (50)  NULL,
    [UserIsVolunteer]               BIT            NULL,
    [EmploymentTypeId]              INT            NULL,
    [UserFTE]                       DECIMAL (3, 1) NULL,
    [UserComments]                  NVARCHAR (MAX) NULL,
    [PersonId]                      INT            NULL,
    [PositionId]                    INT            NULL,
    [UserRecordbaseIdentitySubject] INT            NULL,
    [UserCreatedUserID]             INT            NULL,
    [UserCreatedDate]               DATETIME       NULL,
    CONSTRAINT [PK_dl_DimUser] PRIMARY KEY CLUSTERED ([UserID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [idx_DimUser_UserID]
    ON [dl].[DimUser]([UserID] ASC);


GO

