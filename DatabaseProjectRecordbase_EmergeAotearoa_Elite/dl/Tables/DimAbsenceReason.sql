CREATE TABLE [dl].[DimAbsenceReason] (
    [AbsenceReasonID]       INT            NOT NULL,
    [AbsenceReasonValue]    NVARCHAR (200) NOT NULL,
    [AbsenceReasonText]     NVARCHAR (200) NOT NULL,
    [AbsenceReasonParentId] INT            NULL,
    [AbsenceReasonIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimAbsenceReason] PRIMARY KEY CLUSTERED ([AbsenceReasonID] ASC)
);


GO

