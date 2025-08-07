CREATE TABLE [dl].[FactPersonContactAttorneyType] (
    [PersonContactAttorneyTypeId]            INT      NOT NULL,
    [PersonContactId]                        INT      NOT NULL,
    [AttorneyTypeId]                         INT      NOT NULL,
    [PersonContactAttorneyTypeCreatedDate]   DATETIME NOT NULL,
    [PersonContactAttorneyTypeCreatedUserId] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactPersonContactAttorneyType] PRIMARY KEY CLUSTERED ([PersonContactAttorneyTypeId] ASC)
);


GO

