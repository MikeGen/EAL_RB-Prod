CREATE TABLE [dl].[DimActivityClassification] (
    [ActivityClassificationID]          INT            NOT NULL,
    [TeamConfigurationID]               INT            NOT NULL,
    [ActivityClassificationCode]        NVARCHAR (20)  NULL,
    [ActivityClassificationName]        NVARCHAR (50)  NOT NULL,
    [ActivityClassificationDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_DimActivityClassification] PRIMARY KEY CLUSTERED ([ActivityClassificationID] ASC)
);


GO

