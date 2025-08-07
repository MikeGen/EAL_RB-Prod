CREATE TABLE [dl].[DimCustody] (
    [CustodyID]       INT            NOT NULL,
    [CustodyValue]    NVARCHAR (200) NOT NULL,
    [CustodyText]     NVARCHAR (200) NOT NULL,
    [CustodyParentId] INT            NULL,
    [CustodyIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCustody] PRIMARY KEY CLUSTERED ([CustodyID] ASC)
);


GO

