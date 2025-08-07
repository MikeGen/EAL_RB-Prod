CREATE TABLE [dl].[DimSmokingBriefAdviceGiven] (
    [SmokingBriefAdviceGivenID]       INT            NOT NULL,
    [SmokingBriefAdviceGivenValue]    NVARCHAR (200) NOT NULL,
    [SmokingBriefAdviceGivenText]     NVARCHAR (200) NOT NULL,
    [SmokingBriefAdviceGivenParentId] INT            NULL,
    [SmokingBriefAdviceGivenIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSmokingBriefAdviceGiven] PRIMARY KEY CLUSTERED ([SmokingBriefAdviceGivenID] ASC)
);


GO

