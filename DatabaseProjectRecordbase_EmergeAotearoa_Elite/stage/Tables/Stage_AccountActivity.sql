CREATE TABLE [stage].[Stage_AccountActivity] (
    [ID]                              INT            NOT NULL,
    [AccountID]                       INT            NOT NULL,
    [Location]                        NVARCHAR (300) NULL,
    [Subject]                         NVARCHAR (300) NOT NULL,
    [DescriptionHTML]                 NVARCHAR (MAX) NULL,
    [DescriptionRaw]                  NVARCHAR (MAX) NULL,
    [StartDate]                       DATETIME       NULL,
    [EndDate]                         DATETIME       NULL,
    [AccountActivityTypeID]           INT            NOT NULL,
    [AccountActivityClassificationID] INT            NOT NULL,
    [CreatedDate]                     DATETIME       NOT NULL,
    [CreatedUserID]                   INT            NOT NULL,
    [ModifiedDate]                    DATETIME       NULL,
    [ModifiedUserID]                  INT            NULL,
    [DeletedDate]                     DATETIME       NULL,
    [DeletedUserID]                   INT            NULL,
    [UDF1]                            NVARCHAR (MAX) NULL,
    [UDF2]                            NVARCHAR (MAX) NULL,
    [UDF3]                            NVARCHAR (MAX) NULL,
    [UDF4]                            NVARCHAR (MAX) NULL,
    [UDF5]                            NVARCHAR (MAX) NULL,
    [OtherParticipants]               NVARCHAR (MAX) NULL,
    [TeamID]                          INT            NULL,
    [AudienceSize]                    INT            NULL
);


GO

