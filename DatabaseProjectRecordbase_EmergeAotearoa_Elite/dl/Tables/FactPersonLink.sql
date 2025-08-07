CREATE TABLE [dl].[FactPersonLink] (
    [PersonLinkId]            INT      NOT NULL,
    [PrimaryPersonId]         INT      NOT NULL,
    [LinkedPersonId]          INT      NOT NULL,
    [PersonLinkCreatedUserId] INT      NOT NULL,
    [PersonLinkCreatedDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_dl_FactPersonLink] PRIMARY KEY CLUSTERED ([PersonLinkId] ASC)
);


GO

