CREATE TABLE [dl].[FactAccountContact] (
    [AccountContactID]               INT            NOT NULL,
    [AccountID]                      INT            NOT NULL,
    [TitleID]                        INT            NULL,
    [AccountContactFirstName]        NVARCHAR (50)  NOT NULL,
    [AccountContactLastName]         NVARCHAR (50)  NOT NULL,
    [AccountContactPosition]         NVARCHAR (300) NULL,
    [AccountContactEmailAddress]     NVARCHAR (300) NULL,
    [AccountContactPhone]            NVARCHAR (50)  NULL,
    [AccountContactAlternativePhone] NVARCHAR (50)  NULL,
    [AccountContactFax]              NVARCHAR (50)  NULL,
    [AccountContactCommentsHTML]     NVARCHAR (MAX) NULL,
    [AccountContactCommentsRaw]      NVARCHAR (MAX) NULL,
    [AccountContactCreatedDate]      DATETIME       NOT NULL,
    [AccountContactCreatedUserID]    INT            NOT NULL,
    [AccountContactUDF1]             NVARCHAR (MAX) NULL,
    [AccountContactUDF2]             NVARCHAR (MAX) NULL,
    [AccountContactUDF3]             NVARCHAR (MAX) NULL,
    [AccountContactUDF4]             NVARCHAR (MAX) NULL,
    [AccountContactUDF5]             NVARCHAR (MAX) NULL,
    [AccountContactMobile]           NVARCHAR (50)  NULL,
    CONSTRAINT [PK_dl_FactAccountContact] PRIMARY KEY CLUSTERED ([AccountContactID] ASC)
);


GO

