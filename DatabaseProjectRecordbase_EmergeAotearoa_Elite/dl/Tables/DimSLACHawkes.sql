CREATE TABLE [dl].[DimSLACHawkes] (
    [SLACHawkesID]       INT            NOT NULL,
    [SLACHawkesValue]    NVARCHAR (200) NOT NULL,
    [SLACHawkesText]     NVARCHAR (200) NOT NULL,
    [SLACHawkesParentId] INT            NULL,
    [SLACHawkesIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSLACHawkes] PRIMARY KEY CLUSTERED ([SLACHawkesID] ASC)
);


GO

