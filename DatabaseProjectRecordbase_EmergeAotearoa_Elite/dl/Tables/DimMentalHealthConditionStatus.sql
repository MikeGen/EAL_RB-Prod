CREATE TABLE [dl].[DimMentalHealthConditionStatus] (
    [MentalHealthConditionStatusID]       INT            NOT NULL,
    [MentalHealthConditionStatusValue]    NVARCHAR (200) NOT NULL,
    [MentalHealthConditionStatusText]     NVARCHAR (200) NOT NULL,
    [MentalHealthConditionStatusParentId] INT            NULL,
    [MentalHealthConditionStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimMentalHealthConditionStatus] PRIMARY KEY CLUSTERED ([MentalHealthConditionStatusID] ASC)
);


GO

