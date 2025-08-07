CREATE TABLE [dl].[FactGroupActivity] (
    [GroupActivityID]            INT      NOT NULL,
    [ClonedFromID]               INT      NULL,
    [GroupActivityCreatedDate]   DATETIME NOT NULL,
    [GroupActivityCreatedUserId] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactGroupActivity] PRIMARY KEY CLUSTERED ([GroupActivityID] ASC)
);


GO

