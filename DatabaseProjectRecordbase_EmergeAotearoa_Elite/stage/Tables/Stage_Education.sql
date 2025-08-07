CREATE TABLE [stage].[Stage_Education] (
    [ID]                    INT            NOT NULL,
    [PersonID]              INT            NOT NULL,
    [Name]                  NVARCHAR (300) NOT NULL,
    [Institution]           NVARCHAR (300) NOT NULL,
    [Location]              NVARCHAR (300) NOT NULL,
    [Accredited]            BIT            NOT NULL,
    [StartDate]             DATETIME       NULL,
    [EndDate]               DATETIME       NULL,
    [HoursPerWeek]          REAL           NULL,
    [StudyComments]         NVARCHAR (MAX) NULL,
    [StudyUDF1]             NVARCHAR (MAX) NULL,
    [StudyUDF2]             NVARCHAR (MAX) NULL,
    [StudyUDF3]             NVARCHAR (MAX) NULL,
    [StudyUDF4]             NVARCHAR (MAX) NULL,
    [StudyUDF5]             NVARCHAR (MAX) NULL,
    [YearAchieved]          INT            NULL,
    [QualificationTypeID]   INT            NULL,
    [QualificationComments] NVARCHAR (MAX) NULL,
    [QualificationUDF1]     NVARCHAR (MAX) NULL,
    [QualificationUDF2]     NVARCHAR (MAX) NULL,
    [QualificationUDF3]     NVARCHAR (MAX) NULL,
    [QualificationUDF4]     NVARCHAR (MAX) NULL,
    [QualificationUDF5]     NVARCHAR (MAX) NULL,
    [CreatedDate]           DATETIME       NOT NULL,
    [CreatedUserID]         INT            NOT NULL,
    [ModifiedDate]          DATETIME       NULL,
    [ModifiedUserID]        INT            NULL,
    [DeletedDate]           DATETIME       NULL,
    [DeletedUserID]         INT            NULL,
    [ConvertedUserID]       INT            NULL,
    [ConvertedDate]         DATETIME       NULL
);


GO

