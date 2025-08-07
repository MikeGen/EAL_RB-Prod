CREATE TABLE [extract].[ExtractConfiguration] (
    [Lock]                 CHAR (1) DEFAULT ('X') NOT NULL,
    [ExtractIsIncremental] BIT      NULL,
    [ExtractDate]          DATETIME NULL,
    CONSTRAINT [PK_ExtractConfiguration] PRIMARY KEY CLUSTERED ([Lock] ASC),
    CONSTRAINT [CHK_GlobalSettings] CHECK ([ExtractIsIncremental] IS NULL AND [ExtractDate] IS NULL OR [ExtractIsIncremental] IS NOT NULL AND [ExtractDate] IS NOT NULL),
    CONSTRAINT [CK_ExtractConfiguration_Locked] CHECK ([Lock]='X')
);


GO

