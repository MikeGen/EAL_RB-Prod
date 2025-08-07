CREATE TABLE [dl].[DimSLFWHawkes] (
    [SLFWHawkesID]       INT            NOT NULL,
    [SLFWHawkesValue]    NVARCHAR (200) NOT NULL,
    [SLFWHawkesText]     NVARCHAR (200) NOT NULL,
    [SLFWHawkesParentId] INT            NULL,
    [SLFWHawkesIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSLFWHawkes] PRIMARY KEY CLUSTERED ([SLFWHawkesID] ASC)
);


GO

