CREATE TABLE [dl].[FactEducation] (
    [EducationID]                    INT            NOT NULL,
    [PersonID]                       INT            NOT NULL,
    [EducationName]                  NVARCHAR (300) NOT NULL,
    [EducationInstitution]           NVARCHAR (300) NOT NULL,
    [EducationLocation]              NVARCHAR (300) NOT NULL,
    [EducationAccredited]            BIT            NOT NULL,
    [EducationStartDate]             DATETIME       NULL,
    [EducationEndDate]               DATETIME       NULL,
    [EducationHoursPerWeek]          REAL           NULL,
    [EducationStudyComments]         NVARCHAR (MAX) NULL,
    [EducationStudyUDF1]             NVARCHAR (MAX) NULL,
    [EducationStudyUDF2]             NVARCHAR (MAX) NULL,
    [EducationStudyUDF3]             NVARCHAR (MAX) NULL,
    [EducationStudyUDF4]             NVARCHAR (MAX) NULL,
    [EducationStudyUDF5]             NVARCHAR (MAX) NULL,
    [EducationYearAchieved]          INT            NULL,
    [QualificationTypeID]            INT            NULL,
    [EducationQualificationComments] NVARCHAR (MAX) NULL,
    [EducationQualificationUDF1]     NVARCHAR (MAX) NULL,
    [EducationQualificationUDF2]     NVARCHAR (MAX) NULL,
    [EducationQualificationUDF3]     NVARCHAR (MAX) NULL,
    [EducationQualificationUDF4]     NVARCHAR (MAX) NULL,
    [EducationQualificationUDF5]     NVARCHAR (MAX) NULL,
    [EducationCreatedDate]           DATETIME       NOT NULL,
    [EducationCreatedUserID]         INT            NOT NULL,
    [ConvertedUserID]                INT            NULL,
    [EducationConvertedDate]         DATETIME       NULL,
    CONSTRAINT [PK_dl_FactEducation] PRIMARY KEY CLUSTERED ([EducationID] ASC)
);


GO

