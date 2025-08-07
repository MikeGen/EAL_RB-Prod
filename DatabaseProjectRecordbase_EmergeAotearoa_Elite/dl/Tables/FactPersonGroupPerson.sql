CREATE TABLE [dl].[FactPersonGroupPerson] (
    [PersonGroupPersonId]            INT           NOT NULL,
    [PersonGroupId]                  INT           NOT NULL,
    [PersonId]                       INT           NOT NULL,
    [PersonGroupPersonCreatedDate]   DATETIME2 (7) NOT NULL,
    [PersonGroupPersonCreatedUserID] INT           NOT NULL
);


GO

