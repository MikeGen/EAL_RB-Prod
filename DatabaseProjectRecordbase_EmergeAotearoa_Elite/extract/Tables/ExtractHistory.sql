CREATE TABLE [extract].[ExtractHistory] (
    [ID]                   INT      IDENTITY (1, 1) NOT NULL,
    [ExtractIsIncremental] BIT      NULL,
    [ExtractDate]          DATETIME NULL,
    [ExtractStartTime]     DATETIME NOT NULL,
    [StageEndTime]         DATETIME NULL,
    [LoadEndTime]          DATETIME NULL,
    [TransformEndTime]     DATETIME NULL
);


GO

