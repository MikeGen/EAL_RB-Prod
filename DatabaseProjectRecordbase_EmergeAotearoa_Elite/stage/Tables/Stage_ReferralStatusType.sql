CREATE TABLE [stage].[Stage_ReferralStatusType] (
    [ID]          INT           NOT NULL,
    [Code]        NVARCHAR (10) NULL,
    [Text]        NVARCHAR (50) NULL,
    [Description] VARCHAR (MAX) NULL,
    [Group]       NVARCHAR (50) NULL,
    [StatusOrder] INT           NULL
);


GO

