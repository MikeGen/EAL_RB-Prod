CREATE TABLE [dl].[DimPronouns] (
    [PronounsID]       INT            NOT NULL,
    [PronounsValue]    NVARCHAR (200) NOT NULL,
    [PronounsText]     NVARCHAR (200) NOT NULL,
    [PronounsParentId] INT            NULL,
    [PronounsIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPronouns] PRIMARY KEY CLUSTERED ([PronounsID] ASC)
);


GO

