CREATE TABLE [dl].[DimIPMHAPractice] (
    [IPMHAPracticeID]       INT            NOT NULL,
    [IPMHAPracticeValue]    NVARCHAR (200) NOT NULL,
    [IPMHAPracticeText]     NVARCHAR (200) NOT NULL,
    [IPMHAPracticeParentId] INT            NULL,
    [IPMHAPracticeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIPMHAPractice] PRIMARY KEY CLUSTERED ([IPMHAPracticeID] ASC)
);


GO

