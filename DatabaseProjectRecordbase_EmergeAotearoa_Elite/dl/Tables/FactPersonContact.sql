CREATE TABLE [dl].[FactPersonContact] (
    [PersonContactID]                         INT            NOT NULL,
    [RelatedContactTypeID]                    INT            NOT NULL,
    [PersonID]                                INT            NOT NULL,
    [PersonContactName]                       NVARCHAR (200) NOT NULL,
    [PersonContactRelationship]               NVARCHAR (200) NOT NULL,
    [PersonContactEmailAddress]               NVARCHAR (300) NULL,
    [PersonContactPhone]                      NVARCHAR (50)  NULL,
    [PersonContactPhoneAlternate]             NVARCHAR (50)  NULL,
    [PersonContactFax]                        NVARCHAR (50)  NULL,
    [PersonContactAddress]                    NVARCHAR (MAX) NULL,
    [PersonContactComments]                   NVARCHAR (MAX) NULL,
    [PersonContactIsHiddenFromPerson]         BIT            NOT NULL,
    [PersonContactHiddenReason]               NVARCHAR (300) NULL,
    [PersonContactConsentToContact]           BIT            NOT NULL,
    [PersonContactConsentReviewDate]          DATETIME       NULL,
    [PersonContactInformationDisclosureNotes] NVARCHAR (MAX) NULL,
    [PersonContactIsEmergencyContact]         BIT            NOT NULL,
    [PreferredContactMethodID]                INT            NULL,
    [PersonContactPreferredContactTime]       NVARCHAR (100) NULL,
    [PersonContactCreatedDate]                DATETIME       NOT NULL,
    [PersonContactCreatedUserID]              INT            NOT NULL,
    [PersonContactEnduringPowerOfAttorney]    BIT            NULL,
    CONSTRAINT [PK_dl_FactPersonContact] PRIMARY KEY CLUSTERED ([PersonContactID] ASC)
);


GO

