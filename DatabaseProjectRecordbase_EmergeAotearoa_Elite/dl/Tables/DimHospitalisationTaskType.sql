CREATE TABLE [dl].[DimHospitalisationTaskType] (
    [HospitalisationTaskTypeID]                      INT            NOT NULL,
    [HospitalisationTaskTypeName]                    NVARCHAR (300) NOT NULL,
    [HospitalisationTaskTypeDescription]             NVARCHAR (MAX) NULL,
    [HospitalisationTaskTypeExpectedCompletionHours] INT            NULL,
    [HospitalisationTaskTypeRelatedUrl]              NVARCHAR (500) NULL,
    [HospitalisationTaskTypeSortIndex]               INT            NULL,
    CONSTRAINT [PK_dl_DimHospitalisationTaskType] PRIMARY KEY CLUSTERED ([HospitalisationTaskTypeID] ASC)
);


GO

