CREATE TABLE [dl].[DimCarerAllowanceReceived] (
    [CarerAllowanceReceivedID]       INT            NOT NULL,
    [CarerAllowanceReceivedValue]    NVARCHAR (200) NOT NULL,
    [CarerAllowanceReceivedText]     NVARCHAR (200) NOT NULL,
    [CarerAllowanceReceivedParentId] INT            NULL,
    [CarerAllowanceReceivedIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCarerAllowanceReceived] PRIMARY KEY CLUSTERED ([CarerAllowanceReceivedID] ASC)
);


GO

