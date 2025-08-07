CREATE TABLE [dl].[DimIPMHARole] (
    [IPMHARoleID]       INT            NOT NULL,
    [IPMHARoleValue]    NVARCHAR (200) NOT NULL,
    [IPMHARoleText]     NVARCHAR (200) NOT NULL,
    [IPMHARoleParentId] INT            NULL,
    [IPMHARoleIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIPMHARole] PRIMARY KEY CLUSTERED ([IPMHARoleID] ASC)
);


GO

