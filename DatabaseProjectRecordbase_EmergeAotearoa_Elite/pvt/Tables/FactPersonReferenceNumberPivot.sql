CREATE TABLE [pvt].[FactPersonReferenceNumberPivot] (
    [PersonID] INT            NOT NULL,
    [ACC]      NVARCHAR (MAX) NULL,
    [SWN]      NVARCHAR (MAX) NULL,
    [CSC]      NVARCHAR (MAX) NULL,
    [IRD]      NVARCHAR (MAX) NULL,
    [HU]       NVARCHAR (MAX) NULL,
    [PAS]      NVARCHAR (MAX) NULL,
    [MC]       NVARCHAR (MAX) NULL,
    [MOVC]     NVARCHAR (MAX) NULL,
    [SHRPR]    NVARCHAR (MAX) NULL,
    [CID]      NVARCHAR (MAX) NULL,
    [OTC]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_pvt_FactPersonReferenceNumberPivot] PRIMARY KEY CLUSTERED ([PersonID] ASC)
);


GO

