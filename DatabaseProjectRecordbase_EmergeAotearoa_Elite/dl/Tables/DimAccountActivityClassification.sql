CREATE TABLE [dl].[DimAccountActivityClassification] (
    [AccountActivityClassificationID]       INT            NOT NULL,
    [AccountActivityClassificationValue]    NVARCHAR (200) NOT NULL,
    [AccountActivityClassificationText]     NVARCHAR (200) NOT NULL,
    [AccountActivityClassificationParentId] INT            NULL,
    [AccountActivityClassificationIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimAccountActivityClassification] PRIMARY KEY CLUSTERED ([AccountActivityClassificationID] ASC)
);


GO

