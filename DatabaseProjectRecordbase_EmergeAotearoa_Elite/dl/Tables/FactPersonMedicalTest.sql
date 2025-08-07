CREATE TABLE [dl].[FactPersonMedicalTest] (
    [PersonMedicalTestID]            INT            NOT NULL,
    [PersonMedicalTestDate]          DATETIME       NOT NULL,
    [PersonID]                       INT            NOT NULL,
    [MedicalTestTypeID]              INT            NOT NULL,
    [PersonMedicalTestResult]        NVARCHAR (MAX) NULL,
    [PersonMedicalTestComments]      NVARCHAR (MAX) NULL,
    [PersonMedicalTestCreatedDate]   DATETIME       NOT NULL,
    [PersonMedicalTestCreatedUserID] INT            NOT NULL,
    CONSTRAINT [PK_dl_FactPersonMedicalTest] PRIMARY KEY CLUSTERED ([PersonMedicalTestID] ASC)
);


GO

