CREATE TABLE [dl].[DimReferralStatusTypeReason] (
    [ReferralStatusTypeReasonID]          INT            NOT NULL,
    [ReferralStatusTypeID]                INT            NOT NULL,
    [ReferralStatusTypeReasonCode]        NVARCHAR (50)  NULL,
    [ReferralStatusTypeReasonDescription] NVARCHAR (300) NULL,
    CONSTRAINT [PK_dl_DimReferralStatusTypeReason] PRIMARY KEY CLUSTERED ([ReferralStatusTypeReasonID] ASC)
);


GO

