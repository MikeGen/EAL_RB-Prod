CREATE TABLE [dl].[DimSmokingStatus] (
    [SmokingStatusID]       INT            NOT NULL,
    [SmokingStatusValue]    NVARCHAR (200) NOT NULL,
    [SmokingStatusText]     NVARCHAR (200) NOT NULL,
    [SmokingStatusParentId] INT            NULL,
    [SmokingStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSmokingStatus] PRIMARY KEY CLUSTERED ([SmokingStatusID] ASC)
);


GO

