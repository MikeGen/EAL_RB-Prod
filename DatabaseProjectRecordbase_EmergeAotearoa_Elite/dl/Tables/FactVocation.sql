CREATE TABLE [dl].[FactVocation] (
    [VocationID]              INT            NOT NULL,
    [VocationPosition]        NVARCHAR (300) NOT NULL,
    [VocationLocation]        NVARCHAR (300) NULL,
    [PersonID]                INT            NOT NULL,
    [EmployerID]              INT            NULL,
    [VocationEmployerName]    NVARCHAR (300) NULL,
    [RegionID]                INT            NOT NULL,
    [VocationStartDate]       DATETIME       NOT NULL,
    [VocationEndDate]         DATETIME       NULL,
    [EmploymentTypeID]        INT            NULL,
    [VocationHTMLDescription] NVARCHAR (MAX) NULL,
    [VocationRawDescription]  NVARCHAR (MAX) NULL,
    [VocationIsMigrated]      BIT            NULL,
    [VocationCreatedDate]     DATETIME       NOT NULL,
    [VocationCreatedUserID]   INT            NOT NULL,
    [VocationSelfEmployed]    BIT            NOT NULL,
    [IndustryID]              INT            NULL,
    [VocationPayRatePerHour]  REAL           NULL,
    CONSTRAINT [PK_dl_FactVocation] PRIMARY KEY CLUSTERED ([VocationID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [FactVocation_PersonId]
    ON [dl].[FactVocation]([PersonID] ASC);


GO

