CREATE TABLE [dl].[DimAwhiOraGPPractices] (
    [AwhiOraGPPracticesID]       INT            NOT NULL,
    [AwhiOraGPPracticesValue]    NVARCHAR (200) NOT NULL,
    [AwhiOraGPPracticesText]     NVARCHAR (200) NOT NULL,
    [AwhiOraGPPracticesParentId] INT            NULL,
    [AwhiOraGPPracticesIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimAwhiOraGPPractices] PRIMARY KEY CLUSTERED ([AwhiOraGPPracticesID] ASC)
);


GO

