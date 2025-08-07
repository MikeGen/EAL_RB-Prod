CREATE TABLE [dl].[DimAbsenceTaskType] (
    [AbsenceTaskTypeID]                      INT            NOT NULL,
    [TeamFunctionID]                         INT            NULL,
    [AbsenceTaskTypeName]                    NVARCHAR (300) NOT NULL,
    [AbsenceTaskTypeDescription]             NVARCHAR (MAX) NULL,
    [AbsenceTaskTypeExpectedCompletionHours] INT            NULL,
    [AbsenceTaskTypeSortIndex]               INT            NULL,
    [AbsenceTaskTypeRelatedUrl]              NVARCHAR (500) NULL,
    CONSTRAINT [PK_dl_DimAbsenceTaskType] PRIMARY KEY CLUSTERED ([AbsenceTaskTypeID] ASC)
);


GO

