CREATE TABLE [dl].[FactPersonReferenceNumber] (
    [PersonReferenceNumberID]              INT           NOT NULL,
    [PersonID]                             INT           NOT NULL,
    [ReferenceNumberTypeID]                INT           NOT NULL,
    [PersonReferenceNumberReferenceNumber] NVARCHAR (50) NOT NULL,
    [PersonReferenceNumberExpiryDate]      DATETIME      NULL,
    [PersonReferenceNumberCreatedDate]     DATETIME      NOT NULL,
    [PersonReferenceNumberCreatedUserID]   INT           NOT NULL,
    CONSTRAINT [PK_dl_FactPersonReferenceNumber] PRIMARY KEY CLUSTERED ([PersonReferenceNumberID] ASC)
);


GO

