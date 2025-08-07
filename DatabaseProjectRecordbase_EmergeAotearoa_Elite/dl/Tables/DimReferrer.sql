CREATE TABLE [dl].[DimReferrer] (
    [ReferrerID]          INT            NOT NULL,
    [ReferrerGroupID]     INT            NULL,
    [ReferrerCode]        NVARCHAR (20)  NOT NULL,
    [ReferrerName]        NVARCHAR (50)  NOT NULL,
    [ReferrerDescription] NVARCHAR (MAX) NULL,
    [ReferrerIsInbound]   BIT            NULL,
    [ReferrerIsOutbound]  BIT            NULL,
    CONSTRAINT [PK_dl_DimReferrer] PRIMARY KEY CLUSTERED ([ReferrerID] ASC)
);


GO

