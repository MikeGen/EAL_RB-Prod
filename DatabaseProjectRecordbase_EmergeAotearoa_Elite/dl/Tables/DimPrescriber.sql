CREATE TABLE [dl].[DimPrescriber] (
    [PrescriberId]                 INT             NOT NULL,
    [PrescriberName]               NVARCHAR (50)   NOT NULL,
    [PrescriberRegistrationNumber] NVARCHAR (50)   NOT NULL,
    [PrescriberPracticeName]       NVARCHAR (300)  NOT NULL,
    [PrescriberPracticeSubheading] NVARCHAR (300)  NULL,
    [PrescriberPracticeAddress]    NVARCHAR (1000) NOT NULL,
    [PrescriberPracticePhone]      NVARCHAR (50)   NOT NULL,
    [PrescriberInactiveUserID]     INT             NULL,
    [PrescriberInactiveDate]       DATETIME        NULL,
    CONSTRAINT [PK_dl_DimPrescriber] PRIMARY KEY CLUSTERED ([PrescriberId] ASC)
);


GO

