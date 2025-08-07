CREATE TABLE [stage].[Stage_Lookup] (
    [ID]             INT            NOT NULL,
    [LookupGroupID]  INT            NOT NULL,
    [Value]          NVARCHAR (50)  NULL,
    [Text]           NVARCHAR (200) NOT NULL,
    [SortIndex]      INT            NULL,
    [ParentID]       INT            NULL,
    [HistoricalID]   INT            NULL,
    [InactiveUserID] INT            NULL,
    [InactiveDate]   DATETIME       NULL,
    [CreatedUserID]  INT            NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [ModifiedUserID] INT            NULL,
    [ModifiedDate]   DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [Notes]          VARCHAR (MAX)  NULL,
    [IconID]         INT            NULL,
    [IsDefault]      BIT            NOT NULL
);


GO

