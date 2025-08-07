CREATE VIEW pbi.vw_DimSmokingStatus
AS 

SELECT s.SmokingStatusID, 
       s.SmokingStatusValue, 
       s.SmokingStatusText, 
       s.SmokingStatusParentId ,
	   parnt.SmokingStatusText ParentSmokingStatusText
FROM            dl.DimSmokingStatus s 
LEFT OUTER JOIN dl.DimSmokingStatus parnt ON parnt.SmokingStatusID = s.SmokingStatusParentId 
WHERE  s.SmokingStatusIsActive = 1

GO

