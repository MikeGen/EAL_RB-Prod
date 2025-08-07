CREATE TABLE [stage].[Stage_IncidentRiskType] (
    [ID]             INT             NOT NULL,
    [Name]           NVARCHAR (40)   NOT NULL,
    [Code]           INT             NOT NULL,
    [Action]         NVARCHAR (4000) NULL,
    [CreatedUserID]  INT             NOT NULL,
    [CreatedDate]    DATETIME        NOT NULL,
    [ModifiedUserID] INT             NULL,
    [ModifiedDate]   DATETIME        NULL,
    [DeletedUserID]  INT             NULL,
    [DeletedDate]    DATETIME        NULL
);


GO

