CREATE TABLE [dl].[FactPersonHealthCondition] (
    [PersonHealthConditionId]                  INT           NOT NULL,
    [PersonId]                                 INT           NOT NULL,
    [PersonHealthConditionHealthConditionType] NVARCHAR (50) NOT NULL,
    [HealthConditionTypeId]                    INT           NOT NULL,
    [PersonHealthConditionNotes]               VARCHAR (MAX) NULL,
    [PersonHealthConditionRank]                INT           NULL,
    [PersonHealthConditionCreatedDate]         DATETIME      NOT NULL,
    [PersonHealthConditionCreatedUserId]       INT           NOT NULL,
    [PersonHealthConditionIsCurrent]           BIT           NOT NULL,
    CONSTRAINT [PK_dl_FactPersonHealthCondition] PRIMARY KEY CLUSTERED ([PersonHealthConditionId] ASC)
);


GO

