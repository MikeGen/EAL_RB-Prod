CREATE TABLE [dl].[DimReferralStatusType] (
    [ReferralStatusTypeID]          INT           NOT NULL,
    [ReferralStatusTypeCode]        NVARCHAR (10) NULL,
    [ReferralStatusTypeText]        NVARCHAR (50) NULL,
    [ReferralStatusTypeDescription] VARCHAR (MAX) NULL,
    [ReferralStatusTypeGroup]       NVARCHAR (50) NULL,
    [ReferralStatusTypeStatusOrder] INT           NULL,
    CONSTRAINT [PK_dl_DimReferralStatusType] PRIMARY KEY CLUSTERED ([ReferralStatusTypeID] ASC)
);


GO

