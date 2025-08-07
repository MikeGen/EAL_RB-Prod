CREATE TABLE [dl].[FactPersonIwi] (
    [PersonIwiId]            INT           NOT NULL,
    [PersonId]               INT           NOT NULL,
    [ReferenceIwiId]         INT           NOT NULL,
    [PersonIwiCreatedUserId] INT           NOT NULL,
    [PersonIwiCreatedDate]   DATETIME2 (7) NOT NULL
);


GO

