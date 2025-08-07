CREATE TABLE [dl].[DimReasonForAdmission] (
    [ReasonForAdmissionID]       INT            NOT NULL,
    [ReasonForAdmissionValue]    NVARCHAR (200) NOT NULL,
    [ReasonForAdmissionText]     NVARCHAR (200) NOT NULL,
    [ReasonForAdmissionParentId] INT            NULL,
    [ReasonForAdmissionIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimReasonForAdmission] PRIMARY KEY CLUSTERED ([ReasonForAdmissionID] ASC)
);


GO

