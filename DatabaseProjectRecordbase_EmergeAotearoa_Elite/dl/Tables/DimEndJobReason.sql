CREATE TABLE [dl].[DimEndJobReason] (
    [EndJobReasonID]       INT            NOT NULL,
    [EndJobReasonValue]    NVARCHAR (200) NOT NULL,
    [EndJobReasonText]     NVARCHAR (200) NOT NULL,
    [EndJobReasonParentId] INT            NULL,
    [EndJobReasonIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEndJobReason] PRIMARY KEY CLUSTERED ([EndJobReasonID] ASC)
);


GO

