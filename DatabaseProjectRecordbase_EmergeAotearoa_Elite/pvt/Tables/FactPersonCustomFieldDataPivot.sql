CREATE TABLE [pvt].[FactPersonCustomFieldDataPivot] (
    [PersonID]                INT            NOT NULL,
    [GPOnly]                  NVARCHAR (MAX) NULL,
    [GPRegistration]          NVARCHAR (MAX) NULL,
    [Additionalgenderdetails] NVARCHAR (MAX) NULL,
    [BenefitType]             NVARCHAR (MAX) NULL,
    [InternalAuditDate]       NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_pvt_FactPersonCustomFieldDataPivot] PRIMARY KEY CLUSTERED ([PersonID] ASC)
);


GO

