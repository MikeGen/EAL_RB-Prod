CREATE TABLE [emp].[FactPersonContinuousEmployment] (
    [ID]                           INT      IDENTITY (1, 1) NOT NULL,
    [ClientID]                     INT      NOT NULL,
    [StartDate]                    DATETIME NOT NULL,
    [EndDate]                      DATETIME NULL,
    [TotalDaysContiuousEmployment] INT      NULL
);


GO

