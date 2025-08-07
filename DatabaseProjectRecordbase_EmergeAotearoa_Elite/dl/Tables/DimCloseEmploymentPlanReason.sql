CREATE TABLE [dl].[DimCloseEmploymentPlanReason] (
    [CloseEmploymentPlanReasonID]       INT            NOT NULL,
    [CloseEmploymentPlanReasonValue]    NVARCHAR (200) NOT NULL,
    [CloseEmploymentPlanReasonText]     NVARCHAR (200) NOT NULL,
    [CloseEmploymentPlanReasonParentId] INT            NULL,
    [CloseEmploymentPlanReasonIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCloseEmploymentPlanReason] PRIMARY KEY CLUSTERED ([CloseEmploymentPlanReasonID] ASC)
);


GO

