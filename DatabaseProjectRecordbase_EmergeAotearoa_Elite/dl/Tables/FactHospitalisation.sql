CREATE TABLE [dl].[FactHospitalisation] (
    [HospitalisationID]            INT            NOT NULL,
    [PersonStatusID]               INT            NOT NULL,
    [HospitalisationBelongings]    NVARCHAR (MAX) NULL,
    [HospitalisationOldReasons]    NVARCHAR (MAX) NULL,
    [HospitalisationPlanned]       BIT            NOT NULL,
    [HospitalisationCreatedUserID] INT            NOT NULL,
    [HospitalisationCreatedDate]   DATETIME       NOT NULL,
    CONSTRAINT [PK_dl_FactHospitalisation] PRIMARY KEY CLUSTERED ([HospitalisationID] ASC)
);


GO

