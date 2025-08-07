CREATE TABLE [dl].[DimLegalStatus] (
    [LegalStatusID]       INT            NOT NULL,
    [LegalStatusValue]    NVARCHAR (200) NOT NULL,
    [LegalStatusText]     NVARCHAR (200) NOT NULL,
    [LegalStatusParentId] INT            NULL,
    [LegalStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimLegalStatus] PRIMARY KEY CLUSTERED ([LegalStatusID] ASC)
);


GO

