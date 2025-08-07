CREATE TABLE [dl].[FactActivityRelatedEntity] (
    [ActivityRelatedEntityID]                INT           NOT NULL,
    [ActivityID]                             INT           NOT NULL,
    [ActivityRelatedEntityRelatedEntityType] NVARCHAR (50) NOT NULL,
    [RelatedEntityID]                        INT           NOT NULL,
    [ActivityRelatedEntityCreatedUserID]     INT           NOT NULL,
    [ActivityRelatedEntityCreatedDate]       DATETIME      NOT NULL,
    CONSTRAINT [PK_dl_FactActivityRelatedEntity] PRIMARY KEY CLUSTERED ([ActivityRelatedEntityID] ASC)
);


GO

