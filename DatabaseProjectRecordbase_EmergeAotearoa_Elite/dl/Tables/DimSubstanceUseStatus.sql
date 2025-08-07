CREATE TABLE [dl].[DimSubstanceUseStatus] (
    [SubstanceUseStatusID]       INT            NOT NULL,
    [SubstanceUseStatusValue]    NVARCHAR (200) NOT NULL,
    [SubstanceUseStatusText]     NVARCHAR (200) NOT NULL,
    [SubstanceUseStatusParentId] INT            NULL,
    [SubstanceUseStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSubstanceUseStatus] PRIMARY KEY CLUSTERED ([SubstanceUseStatusID] ASC)
);


GO

