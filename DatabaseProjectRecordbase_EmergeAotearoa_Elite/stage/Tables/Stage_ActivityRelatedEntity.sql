CREATE TABLE [stage].[Stage_ActivityRelatedEntity] (
    [ID]                INT           NOT NULL,
    [ActivityID]        INT           NOT NULL,
    [RelatedEntityType] NVARCHAR (50) NOT NULL,
    [RelatedEntityID]   INT           NOT NULL,
    [CreatedUserID]     INT           NOT NULL,
    [CreatedDate]       DATETIME      NOT NULL,
    [ModifiedUserID]    INT           NULL,
    [ModifiedDate]      DATETIME      NULL,
    [DeletedUserID]     INT           NULL,
    [DeletedDate]       DATETIME      NULL
);


GO

