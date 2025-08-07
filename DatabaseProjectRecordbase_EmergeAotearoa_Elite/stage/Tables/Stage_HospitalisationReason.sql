CREATE TABLE [stage].[Stage_HospitalisationReason] (
    [ID]                   INT      NOT NULL,
    [HospitalisationID]    INT      NOT NULL,
    [ReasonForAdmissionID] INT      NOT NULL,
    [CreatedDate]          DATETIME NOT NULL,
    [CreatedUserID]        INT      NOT NULL,
    [ModifiedDate]         DATETIME NULL,
    [ModifiedUserID]       INT      NULL,
    [DeletedDate]          DATETIME NULL,
    [DeletedUserID]        INT      NULL
);


GO

