CREATE TABLE [stage].[Stage_Prescriber] (
    [Id]                 INT             NOT NULL,
    [Name]               NVARCHAR (50)   NOT NULL,
    [RegistrationNumber] NVARCHAR (50)   NOT NULL,
    [PracticeName]       NVARCHAR (300)  NOT NULL,
    [PracticeSubheading] NVARCHAR (300)  NULL,
    [PracticeAddress]    NVARCHAR (1000) NOT NULL,
    [PracticePhone]      NVARCHAR (50)   NOT NULL,
    [CreatedDate]        DATETIME        NOT NULL,
    [CreatedUserID]      INT             NOT NULL,
    [ModifiedDate]       DATETIME        NULL,
    [ModifiedUserID]     INT             NULL,
    [InactiveDate]       DATETIME        NULL,
    [InactiveUserID]     INT             NULL,
    [DeletedDate]        DATETIME        NULL,
    [DeletedUserID]      INT             NULL
);


GO

