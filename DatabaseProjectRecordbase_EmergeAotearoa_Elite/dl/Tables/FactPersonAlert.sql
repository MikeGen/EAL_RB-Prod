CREATE TABLE [dl].[FactPersonAlert] (
    [PersonAlertId]            INT                NOT NULL,
    [PersonId]                 INT                NOT NULL,
    [PersonAlertTitle]         NVARCHAR (256)     NOT NULL,
    [PersonAlertDetails]       NVARCHAR (MAX)     NOT NULL,
    [PersonAlertStartDate]     DATETIMEOFFSET (0) NULL,
    [PersonAlertEndDate]       DATETIMEOFFSET (0) NULL,
    [PersonAlertCreatedDate]   DATETIME2 (7)      NOT NULL,
    [PersonAlertCreatedUserId] INT                NOT NULL,
    CONSTRAINT [PK_dl_FactPersonAlert] PRIMARY KEY CLUSTERED ([PersonAlertId] ASC)
);


GO

