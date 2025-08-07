CREATE TABLE [stage].[Stage_PersonRisk] (
    [ID]               INT                NOT NULL,
    [PersonID]         INT                NOT NULL,
    [RiskTypeID]       INT                NOT NULL,
    [Description]      NVARCHAR (250)     NOT NULL,
    [RawEarlySigns]    NVARCHAR (MAX)     NULL,
    [HTMLEarlySigns]   NVARCHAR (MAX)     NULL,
    [RawStrategy]      NVARCHAR (MAX)     NULL,
    [HTMLStrategy]     NVARCHAR (MAX)     NULL,
    [RawComments]      NVARCHAR (MAX)     NULL,
    [HTMLComments]     NVARCHAR (MAX)     NULL,
    [ReviewDate]       DATETIME           NULL,
    [HistoricalID]     INT                NULL,
    [CreatedDate]      DATETIME           NOT NULL,
    [CreatedUserID]    INT                NOT NULL,
    [ModifiedDate]     DATETIME           NULL,
    [ModifiedUserID]   INT                NULL,
    [DeletedDate]      DATETIME           NULL,
    [DeletedUserID]    INT                NULL,
    [InactiveDate]     DATETIME           NULL,
    [InactiveUserID]   INT                NULL,
    [AlertFlag]        BIT                NOT NULL,
    [HistoricDate]     DATETIME2 (7)      NULL,
    [ReviewDateOffset] DATETIMEOFFSET (7) NULL
);


GO

