CREATE TABLE [stage].[Stage_Address] (
    [ID]                  INT                NOT NULL,
    [Name]                NVARCHAR (50)      NULL,
    [Line1]               NVARCHAR (200)     NOT NULL,
    [Line2]               NVARCHAR (200)     NULL,
    [Line3]               NVARCHAR (200)     NULL,
    [Suburb]              NVARCHAR (100)     NULL,
    [TownCity]            NVARCHAR (50)      NOT NULL,
    [CountryID]           INT                NULL,
    [PostCode]            NVARCHAR (50)      NULL,
    [IsPostalAddress]     BIT                NOT NULL,
    [MapReference]        NVARCHAR (200)     NULL,
    [EntityType]          NVARCHAR (50)      NOT NULL,
    [EntityID]            INT                NOT NULL,
    [CreatedDate]         DATETIME           NOT NULL,
    [CreatedUserID]       INT                NOT NULL,
    [ModifiedDate]        DATETIME           NULL,
    [ModifiedUserID]      INT                NULL,
    [DeletedDate]         DATETIME           NULL,
    [DeletedUserID]       INT                NULL,
    [IsPrimaryAddress]    BIT                NOT NULL,
    [ResidenceTypeID]     INT                NULL,
    [Comments]            NVARCHAR (MAX)     NULL,
    [AccommodationTypeID] INT                NULL,
    [StateID]             INT                NULL,
    [StartDate]           DATETIMEOFFSET (7) NULL,
    [EndDate]             DATETIMEOFFSET (7) NULL,
    [AddressSearchUsed]   BIT                DEFAULT ((0)) NOT NULL
);


GO

