CREATE TABLE [dl].[DimPerson] (
    [PersonID]                                          INT            NOT NULL,
    [TitleID]                                           INT            NULL,
    [PersonFirstName]                                   NVARCHAR (255) NOT NULL,
    [PersonMiddleNames]                                 NVARCHAR (255) NULL,
    [PersonLastName]                                    NVARCHAR (255) NOT NULL,
    [PersonPreferredName]                               NVARCHAR (255) NULL,
    [PersonMaidenName]                                  NVARCHAR (255) NULL,
    [PersonDateOfBirth]                                 DATE           NOT NULL,
    [GenderID]                                          INT            NOT NULL,
    [OldClientID]                                       INT            NULL,
    [MaritalStatusID]                                   INT            NULL,
    [HighestQualificationTypeID]                        INT            NULL,
    [ReligionID]                                        INT            NULL,
    [ResidencyID]                                       INT            NULL,
    [NationalityID]                                     INT            NULL,
    [CountryOfBirthID]                                  INT            NULL,
    [PrimaryDailyActivityID]                            INT            NULL,
    [PersonDeceasedDate]                                DATETIME       NULL,
    [PersonOccupation]                                  NVARCHAR (50)  NULL,
    [PersonDriversLicenceNumber]                        NVARCHAR (15)  NULL,
    [PersonDriversLicenceExpiry]                        DATETIME       NULL,
    [PrimaryTransportID]                                INT            NULL,
    [PersonVehicleRegistrationNumber]                   NVARCHAR (10)  NULL,
    [PersonVehicleMakeAndModel]                         NVARCHAR (30)  NULL,
    [PersonVehicleColor]                                NVARCHAR (20)  NULL,
    [PersonVehicleDescription]                          NVARCHAR (MAX) NULL,
    [PersonPhysicalDescription]                         NVARCHAR (MAX) NULL,
    [PersonCulturalNeeds]                               NVARCHAR (MAX) NULL,
    [PersonSpiritualNeeds]                              NVARCHAR (MAX) NULL,
    [PersonHeight]                                      NVARCHAR (50)  NULL,
    [PersonWeight]                                      NVARCHAR (50)  NULL,
    [PersonBuild]                                       NVARCHAR (50)  NULL,
    [PersonEyeColor]                                    NVARCHAR (50)  NULL,
    [PersonHairColor]                                   NVARCHAR (50)  NULL,
    [PersonHairStyle]                                   NVARCHAR (50)  NULL,
    [EducationalActivityTypeID]                         INT            NULL,
    [PersonEducationalActivityHoursPerWeek]             DECIMAL (6, 2) NULL,
    [PersonEducationBackground]                         NVARCHAR (MAX) NULL,
    [PersonCaresForOtherFamilyMembers]                  BIT            NULL,
    [PersonCaresForOtherFamilyMembersReason]            NVARCHAR (MAX) NULL,
    [PersonFamilyBackground]                            NVARCHAR (MAX) NULL,
    [EmploymentStatusID]                                INT            NULL,
    [PersonEmploymentStatusHoursPerWeek]                DECIMAL (6, 2) NULL,
    [EmploymentHistoryID]                               INT            NULL,
    [PersonLastEmploymentDate]                          DATETIME       NULL,
    [PersonEmploymentBackground]                        NVARCHAR (MAX) NULL,
    [PersonReferenceNumber]                             NVARCHAR (50)  NULL,
    [PersonUDF1]                                        NVARCHAR (MAX) NULL,
    [PersonUDF2]                                        NVARCHAR (MAX) NULL,
    [PersonUDF3]                                        NVARCHAR (MAX) NULL,
    [PersonUDF4]                                        NVARCHAR (MAX) NULL,
    [PersonUDF5]                                        NVARCHAR (MAX) NULL,
    [PersonSocialBackground]                            NVARCHAR (MAX) NULL,
    [PersonTreatmentBackground]                         NVARCHAR (MAX) NULL,
    [LivingSituationID]                                 INT            NULL,
    [PersonServiceUserConsent]                          BIT            NOT NULL,
    [PrimaryCarerID]                                    INT            NULL,
    [Ethnicity1ID]                                      INT            NULL,
    [Ethnicity2ID]                                      INT            NULL,
    [Ethnicity3ID]                                      INT            NULL,
    [Ethnicity4ID]                                      INT            NULL,
    [Ethnicity5ID]                                      INT            NULL,
    [PersonIsPrivate]                                   BIT            NOT NULL,
    [PersonFosterChildrenCapacity]                      INT            NULL,
    [PersonPreferedFosterCareService]                   VARCHAR (12)   NULL,
    [PersonMadePrivateOrPublicReason]                   NVARCHAR (MAX) NULL,
    [PersonMadePrivateOrPublicDate]                     DATETIME2 (7)  NULL,
    [MadePrivateOrPublicUserId]                         INT            NULL,
    [GenderIdentityId]                                  INT            NULL,
    [PersonCreatedUserID]                               INT            NULL,
    [PersonCreatedDate]                                 DATETIME       NULL,
    [PronounsId]                                        INT            NULL,
    [PersonAnotherGender]                               NVARCHAR (MAX) NULL,
    [PersonAnotherPronoun]                              NVARCHAR (MAX) NULL,
    [PersonAnotherGenderIdentity]                       NVARCHAR (MAX) NULL,
    [PersonIsIwiAffiliationKnown]                       BIT            NULL,
    [PersonDoesPersonWantToKnowMoreAboutIwiAffiliation] BIT            NULL,
    [PersonMarae]                                       NVARCHAR (MAX) NULL,
    [PersonWhanauName]                                  NVARCHAR (MAX) NULL,
    [PersonPepeha]                                      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_DimPerson] PRIMARY KEY CLUSTERED ([PersonID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [idx_DimPerson_PersonID]
    ON [dl].[DimPerson]([PersonID] ASC);


GO

CREATE NONCLUSTERED INDEX [DimPerson_Id]
    ON [dl].[DimPerson]([PersonID] ASC);


GO

