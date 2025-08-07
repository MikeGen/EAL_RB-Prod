CREATE TABLE [dl].[FactUserPerson] (
    [UserPersonID]            INT            NOT NULL,
    [UserID]                  INT            NOT NULL,
    [PersonID]                INT            NOT NULL,
    [UserPersonAccessGranted] BIT            NOT NULL,
    [UserPersonAccessDenied]  BIT            NOT NULL,
    [UserPersonStartDate]     DATETIME       NOT NULL,
    [UserPersonEndDate]       DATETIME       NULL,
    [UserPersonReason]        NVARCHAR (256) NULL,
    [RequestedByUserID]       INT            NULL,
    [UserPersonCreatedDate]   DATETIME       NOT NULL,
    [UserPersonCreatedUserID] INT            NOT NULL,
    CONSTRAINT [PK_dl_FactUserPerson] PRIMARY KEY CLUSTERED ([UserPersonID] ASC)
);


GO

