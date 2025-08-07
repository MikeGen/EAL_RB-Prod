CREATE TABLE [dl].[DimAccount] (
    [AccountID]                    INT            NOT NULL,
    [AccountName]                  NVARCHAR (300) NOT NULL,
    [AccountLocation]              NVARCHAR (200) NULL,
    [AccountDescriptionHTML]       NVARCHAR (MAX) NULL,
    [AccountDescriptionRaw]        NVARCHAR (MAX) NULL,
    [IndustryTypeID]               INT            NOT NULL,
    [AccountOwnerUserID]           INT            NOT NULL,
    [AccountPostalAddressLine1]    NVARCHAR (200) NOT NULL,
    [AccountPostalAddressLine2]    NVARCHAR (200) NULL,
    [AccountPostalAddressSuburb]   NVARCHAR (100) NULL,
    [AccountPostalAddressCity]     NVARCHAR (100) NOT NULL,
    [AccountPostalAddressPostCode] NVARCHAR (100) NULL,
    [PostalAddressCountryID]       INT            NULL,
    [AccountStreetAddressLine1]    NVARCHAR (200) NOT NULL,
    [AccountStreetAddressLine2]    NVARCHAR (200) NULL,
    [AccountStreetAddressSuburb]   NVARCHAR (100) NULL,
    [AccountStreetAddressCity]     NVARCHAR (100) NOT NULL,
    [RegionID]                     INT            NOT NULL,
    [StreetAddressCountryID]       INT            NOT NULL,
    [AccountPhone]                 NVARCHAR (50)  NULL,
    [AccountAlternativePhone]      NVARCHAR (50)  NULL,
    [AccountFax]                   NVARCHAR (50)  NULL,
    [AccountWebsiteAddress]        NVARCHAR (100) NULL,
    [AccountPrimaryEmailAddress]   NVARCHAR (100) NULL,
    [AccountUDF1]                  NVARCHAR (MAX) NULL,
    [AccountUDF2]                  NVARCHAR (MAX) NULL,
    [AccountUDF3]                  NVARCHAR (MAX) NULL,
    [AccountUDF4]                  NVARCHAR (MAX) NULL,
    [AccountUDF5]                  NVARCHAR (MAX) NULL,
    [AccountIsEmployer]            BIT            NOT NULL,
    [PrimaryContactID]             INT            NULL,
    [CompanyId]                    INT            NOT NULL,
    CONSTRAINT [PK_dl_DimAccount] PRIMARY KEY CLUSTERED ([AccountID] ASC)
);


GO

