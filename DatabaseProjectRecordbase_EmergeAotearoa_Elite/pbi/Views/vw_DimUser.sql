CREATE VIEW [pbi].[vw_DimUser]
AS 
-- these are Staff / Employees of Emerge
SELECT du.UserID, 
       du.UserUsername, 
       du.UserFirstName, 
       du.UserLastName, 
       du.UserPreferredName, 
       du.UserPosition, 
       du.ReportsToUserID, 
       du.UserEmployeeNumber, 
       du.UserDisabledDate,
	   du.UserEmailAddress
FROM dl.DimUser du;

GO

