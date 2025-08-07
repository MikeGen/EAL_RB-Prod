CREATE TABLE [dl].[DimPrimaryTransport] (
    [PrimaryTransportID]       INT            NOT NULL,
    [PrimaryTransportValue]    NVARCHAR (200) NOT NULL,
    [PrimaryTransportText]     NVARCHAR (200) NOT NULL,
    [PrimaryTransportParentId] INT            NULL,
    [PrimaryTransportIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPrimaryTransport] PRIMARY KEY CLUSTERED ([PrimaryTransportID] ASC)
);


GO

