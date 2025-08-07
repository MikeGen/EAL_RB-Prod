CREATE TABLE [dl].[DimPersonStatusType] (
    [PersonStatusTypeID]          INT           NOT NULL,
    [PersonStatusTypeCode]        NVARCHAR (20) NULL,
    [PersonStatusTypeText]        NVARCHAR (50) NULL,
    [PersonStatusTypeDescription] VARCHAR (300) NULL,
    [PersonStatusTypeGroup]       NVARCHAR (50) NULL,
    CONSTRAINT [PK_dl_DimPersonStatusType] PRIMARY KEY CLUSTERED ([PersonStatusTypeID] ASC)
);


GO

