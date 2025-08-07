CREATE TABLE [dl].[FactWorkPreferencesPreferredEmploymentType] (
    [WorkPreferencesPreferredEmploymentTypeID] INT NOT NULL,
    [EmploymentTypeID]                         INT NOT NULL,
    [WorkPreferencesID]                        INT NOT NULL,
    CONSTRAINT [PK_dl_FactWorkPreferencesPreferredEmploymentType] PRIMARY KEY CLUSTERED ([WorkPreferencesPreferredEmploymentTypeID] ASC)
);


GO

