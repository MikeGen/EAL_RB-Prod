
    CREATE   VIEW [dbo].[ServiceEpisodes] AS
    SELECT
        ID,
        PersonID,
        ServiceStartDate,
        ServiceEndDate,
        CONCAT(PersonID, '-', ServiceStartDate, '-', ServiceEndDate) AS ServiceEpisodeID
    FROM [legacy].[FactReferral];

GO

