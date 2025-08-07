CREATE TABLE [stage].[Stage_PersonContact] (
    [ID]                         INT            NOT NULL,
    [RelatedContactTypeID]       INT            NOT NULL,
    [PersonID]                   INT            NOT NULL,
    [Name]                       NVARCHAR (200) NOT NULL,
    [Relationship]               NVARCHAR (200) NOT NULL,
    [EmailAddress]               NVARCHAR (300) NULL,
    [Phone]                      NVARCHAR (50)  NULL,
    [PhoneAlternate]             NVARCHAR (50)  NULL,
    [Fax]                        NVARCHAR (50)  NULL,
    [Address]                    NVARCHAR (MAX) NULL,
    [Comments]                   NVARCHAR (MAX) NULL,
    [IsHiddenFromPerson]         BIT            NOT NULL,
    [HiddenReason]               NVARCHAR (300) NULL,
    [ConsentToContact]           BIT            NOT NULL,
    [ConsentReviewDate]          DATETIME       NULL,
    [InformationDisclosureNotes] NVARCHAR (MAX) NULL,
    [IsEmergencyContact]         BIT            NOT NULL,
    [PreferredContactMethodID]   INT            NULL,
    [PreferredContactTime]       NVARCHAR (100) NULL,
    [CreatedDate]                DATETIME       NOT NULL,
    [CreatedUserID]              INT            NOT NULL,
    [ModifiedDate]               DATETIME       NULL,
    [ModifiedUserID]             INT            NULL,
    [DeletedDate]                DATETIME       NULL,
    [DeletedUserID]              INT            NULL,
    [InactiveDate]               DATETIME       NULL,
    [InactiveUserID]             INT            NULL,
    [EnduringPowerOfAttorney]    BIT            NULL
);


GO

