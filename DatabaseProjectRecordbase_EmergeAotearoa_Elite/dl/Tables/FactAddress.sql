CREATE TABLE [dl].[FactAddress] (
    [AddressID]                INT                NOT NULL,
    [AddressName]              NVARCHAR (50)      NULL,
    [AddressLine1]             NVARCHAR (200)     NOT NULL,
    [AddressLine2]             NVARCHAR (200)     NULL,
    [AddressLine3]             NVARCHAR (200)     NULL,
    [AddressSuburb]            NVARCHAR (100)     NULL,
    [AddressTownCity]          NVARCHAR (50)      NOT NULL,
    [CountryID]                INT                NULL,
    [AddressPostCode]          NVARCHAR (50)      NULL,
    [AddressIsPostalAddress]   BIT                NOT NULL,
    [AddressMapReference]      NVARCHAR (200)     NULL,
    [AddressEntityType]        NVARCHAR (50)      NOT NULL,
    [EntityID]                 INT                NOT NULL,
    [AddressCreatedDate]       DATETIME           NOT NULL,
    [AddressCreatedUserID]     INT                NOT NULL,
    [AddressIsPrimaryAddress]  BIT                NOT NULL,
    [ResidenceTypeID]          INT                NULL,
    [AddressComments]          NVARCHAR (MAX)     NULL,
    [AccommodationTypeID]      INT                NULL,
    [StateID]                  INT                NULL,
    [AddressStartDate]         DATETIMEOFFSET (7) NULL,
    [AddressEndDate]           DATETIMEOFFSET (7) NULL,
    [AddressAddressSearchUsed] BIT                DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dl_FactAddress] PRIMARY KEY CLUSTERED ([AddressID] ASC)
);


GO

