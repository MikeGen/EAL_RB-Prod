CREATE TABLE [dl].[DimLivingSituation] (
    [LivingSituationID]       INT            NOT NULL,
    [LivingSituationValue]    NVARCHAR (200) NOT NULL,
    [LivingSituationText]     NVARCHAR (200) NOT NULL,
    [LivingSituationParentId] INT            NULL,
    [LivingSituationIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimLivingSituation] PRIMARY KEY CLUSTERED ([LivingSituationID] ASC)
);


GO

