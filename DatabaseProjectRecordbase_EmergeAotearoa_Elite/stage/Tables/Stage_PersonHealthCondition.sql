CREATE TABLE [stage].[Stage_PersonHealthCondition] (
    [Id]                    INT           NOT NULL,
    [PersonId]              INT           NOT NULL,
    [HealthConditionType]   NVARCHAR (50) NOT NULL,
    [HealthConditionTypeId] INT           NOT NULL,
    [Notes]                 VARCHAR (MAX) NULL,
    [Rank]                  INT           NULL,
    [CreatedDate]           DATETIME      NOT NULL,
    [CreatedUserId]         INT           NOT NULL,
    [ModifiedDate]          DATETIME      NULL,
    [ModifiedUserId]        INT           NULL,
    [DeletedDate]           DATETIME      NULL,
    [DeletedUserId]         INT           NULL,
    [IsCurrent]             BIT           NOT NULL
);


GO

