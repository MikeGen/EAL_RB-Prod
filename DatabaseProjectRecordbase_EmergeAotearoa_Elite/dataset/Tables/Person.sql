CREATE TABLE [dataset].[Person] (
    [PersonID]                            INT            NOT NULL,
    [PersonTitle]                         NVARCHAR (200) NULL,
    [PersonFirstName]                     NVARCHAR (255) NOT NULL,
    [PersonMiddleNames]                   NVARCHAR (255) NULL,
    [PersonLastName]                      NVARCHAR (255) NOT NULL,
    [PersonPreferredName]                 NVARCHAR (255) NULL,
    [PersonMaidenName]                    NVARCHAR (255) NULL,
    [PersonFullName]                      NVARCHAR (512) NULL,
    [PersonDateOfBirth]                   DATE           NOT NULL,
    [PersonDeceasedDate]                  DATETIME       NULL,
    [PersonReferenceNumber]               NVARCHAR (50)  NULL,
    [PersonGender]                        NVARCHAR (200) NOT NULL,
    [PersonGenderIdentity]                NVARCHAR (200) NULL,
    [PersonMaritalStatus]                 NVARCHAR (200) NULL,
    [PersonResidency]                     NVARCHAR (200) NULL,
    [PersonNationality]                   NVARCHAR (200) NULL,
    [PersonCountryOfBirth]                NVARCHAR (200) NULL,
    [PersonPrimaryEthnicity]              NVARCHAR (MAX) NULL,
    [PersonPrimaryEthnicityStatsNZLevel1] NVARCHAR (200) NULL,
    [PersonSecondaryEthnicity]            NVARCHAR (MAX) NULL,
    [PersonTertiaryEthnicity]             NVARCHAR (MAX) NULL,
    [PersonPrimaryDailyActivity]          NVARCHAR (200) NULL,
    [PersonOccupation]                    NVARCHAR (50)  NULL,
    [PersonLivingSituation]               NVARCHAR (200) NULL,
    [PersonIsPrivate]                     BIT            NOT NULL,
    [PersonQuaternaryEthnicity]           NVARCHAR (MAX) NULL,
    [PersonQuinaryEthnicity]              NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dataset_Person] PRIMARY KEY CLUSTERED ([PersonID] ASC)
);


GO

