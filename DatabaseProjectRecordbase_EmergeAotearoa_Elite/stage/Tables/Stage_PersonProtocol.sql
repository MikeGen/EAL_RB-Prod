CREATE TABLE [stage].[Stage_PersonProtocol] (
    [Id]               INT                NOT NULL,
    [PersonId]         INT                NOT NULL,
    [Title]            NVARCHAR (250)     NULL,
    [RawDescription]   NVARCHAR (MAX)     NULL,
    [HTMLDescription]  NVARCHAR (MAX)     NULL,
    [RawPurpose]       NVARCHAR (MAX)     NULL,
    [HTMLPurpose]      NVARCHAR (MAX)     NULL,
    [RawSteps]         NVARCHAR (MAX)     NULL,
    [HTMLSteps]        NVARCHAR (MAX)     NULL,
    [RawComments]      NVARCHAR (MAX)     NULL,
    [HTMLComments]     NVARCHAR (MAX)     NULL,
    [ReviewDate]       DATETIME           NULL,
    [HistoricalId]     INT                NULL,
    [CreatedDate]      DATETIME           NOT NULL,
    [CreatedUserId]    INT                NOT NULL,
    [ModifiedDate]     DATETIME           NULL,
    [ModifiedUserId]   INT                NULL,
    [DeletedDate]      DATETIME           NULL,
    [DeletedUserId]    INT                NULL,
    [InactiveDate]     DATETIME           NULL,
    [InactiveUserId]   INT                NULL,
    [HistoricDate]     DATETIME2 (7)      NULL,
    [ReviewDateOffset] DATETIMEOFFSET (7) NULL
);


GO

