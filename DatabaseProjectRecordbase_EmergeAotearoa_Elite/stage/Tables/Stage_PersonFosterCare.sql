CREATE TABLE [stage].[Stage_PersonFosterCare] (
    [Id]              INT           NOT NULL,
    [CaregiverId]     INT           NOT NULL,
    [ChildId]         INT           NOT NULL,
    [StartDate]       DATETIME2 (7) NOT NULL,
    [EndDate]         DATETIME2 (7) NULL,
    [IsRespite]       BIT           NOT NULL,
    [CreatedUserId]   INT           NOT NULL,
    [CreatedDate]     DATETIME2 (7) NOT NULL,
    [ModifiedUserId]  INT           NULL,
    [ModifiedDate]    DATETIME2 (7) NULL,
    [DeletedUserId]   INT           NULL,
    [DeletedDate]     DATETIME2 (7) NULL,
    [PlacementSiteId] INT           NOT NULL
);


GO

