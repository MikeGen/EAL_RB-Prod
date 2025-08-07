CREATE TABLE [dl].[DimMentalCondition] (
    [MentalConditionID]       INT            NOT NULL,
    [MentalConditionValue]    NVARCHAR (200) NOT NULL,
    [MentalConditionText]     NVARCHAR (200) NOT NULL,
    [MentalConditionParentId] INT            NULL,
    [MentalConditionIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimMentalCondition] PRIMARY KEY CLUSTERED ([MentalConditionID] ASC)
);


GO

