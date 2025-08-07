CREATE TABLE [dl].[FactPersonFosterCare] (
    [PersonFosterCareId]            INT           NOT NULL,
    [CaregiverId]                   INT           NOT NULL,
    [ChildId]                       INT           NOT NULL,
    [PersonFosterCareStartDate]     DATETIME2 (7) NOT NULL,
    [PersonFosterCareEndDate]       DATETIME2 (7) NULL,
    [PersonFosterCareIsRespite]     BIT           NOT NULL,
    [PersonFosterCareCreatedUserId] INT           NOT NULL,
    [PersonFosterCareCreatedDate]   DATETIME2 (7) NOT NULL,
    [PlacementSiteId]               INT           NOT NULL,
    CONSTRAINT [PK_dl_FactPersonFosterCare] PRIMARY KEY CLUSTERED ([PersonFosterCareId] ASC)
);


GO

