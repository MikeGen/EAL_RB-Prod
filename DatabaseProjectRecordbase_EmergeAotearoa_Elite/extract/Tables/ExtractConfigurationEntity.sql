CREATE TABLE [extract].[ExtractConfigurationEntity] (
    [EntityName]          NVARCHAR (300) NOT NULL,
    [EntityIsIncremental] BIT            NOT NULL,
    [EntityExtractDate]   DATETIME       NULL,
    [EntityType]          NVARCHAR (50)  NOT NULL,
    [EntityIgnoreAudits]  BIT            NOT NULL,
    [EntityKeepDeletes]   BIT            NOT NULL,
    [EntityHasId]         BIT            NOT NULL,
    [EntityHasInactive]   INT            NULL,
    [EntityUsesCreated]   INT            NULL,
    [EntityUsesDeleted]   INT            NULL,
    CONSTRAINT [CHK_EntityUsesDeleted] CHECK ([EntityUsesDeleted]=(0) OR [EntityUsesDeleted]=(1) AND [EntityKeepDeletes]=(1)),
    CONSTRAINT [CHK_HasId] CHECK ([EntityHasId]=(0) AND [EntityIgnoreAudits]=(1) OR [EntityHasId]=(1))
);


GO

