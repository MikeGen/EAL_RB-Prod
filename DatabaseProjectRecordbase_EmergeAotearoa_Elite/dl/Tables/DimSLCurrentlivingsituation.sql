CREATE TABLE [dl].[DimSLCurrentlivingsituation] (
    [SLCurrentlivingsituationID]       INT            NOT NULL,
    [SLCurrentlivingsituationValue]    NVARCHAR (200) NOT NULL,
    [SLCurrentlivingsituationText]     NVARCHAR (200) NOT NULL,
    [SLCurrentlivingsituationParentId] INT            NULL,
    [SLCurrentlivingsituationIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSLCurrentlivingsituation] PRIMARY KEY CLUSTERED ([SLCurrentlivingsituationID] ASC)
);


GO

