CREATE TABLE [dl].[FactEmail] (
    [EmailID]             INT           NOT NULL,
    [EmailEmail]          VARCHAR (300) NOT NULL,
    [EmailConsentToEmail] BIT           NOT NULL,
    [EmailIsPrimary]      BIT           NOT NULL,
    [EmailEntityType]     VARCHAR (50)  NOT NULL,
    [EntityID]            INT           NOT NULL,
    [EmailCreatedDate]    DATETIME      NOT NULL,
    [EmailCreatedUserID]  INT           NOT NULL,
    CONSTRAINT [PK_dl_FactEmail] PRIMARY KEY CLUSTERED ([EmailID] ASC)
);


GO

