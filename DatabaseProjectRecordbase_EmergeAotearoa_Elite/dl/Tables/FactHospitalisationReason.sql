CREATE TABLE [dl].[FactHospitalisationReason] (
    [HospitalisationReasonID]            INT      NOT NULL,
    [HospitalisationID]                  INT      NOT NULL,
    [ReasonForAdmissionID]               INT      NOT NULL,
    [HospitalisationReasonCreatedDate]   DATETIME NOT NULL,
    [HospitalisationReasonCreatedUserID] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactHospitalisationReason] PRIMARY KEY CLUSTERED ([HospitalisationReasonID] ASC)
);


GO

