CREATE VIEW pbi.vw_DimActivityClassification
AS 

SELECT     ac.ActivityClassificationID, ac.ActivityClassificationCode, ac.ActivityClassificationName, 
           CASE  
                WHEN ac.ActivityClassificationID IN (379 ,386 ,400 ,426 ,427 ,428 ,429 ,438 ,459 ,272 ,273 ,274 ,275 ,276 ,277 ,349 ,181 ,202 ,
				                                     215 ,216 ,217 ,218 ,219 ,233 ,132 ,34 ,83)   THEN  'DNA'
				WHEN ac.ActivityClassificationID IN (401, 425, 435, 439, 456, 457, 464, 468, 481, 278, 279, 280, 321, 350, 361, 453, 182, 188, 
				                                     200, 225, 229, 234, 241, 104, 133, 139, 153, 6  , 55 , 35 , 84, 397, 415, 455, 474, 298, 
													 338, 362, 447, 189, 222, 223, 259, 72, 91, 121, 140, 170, 23, 42 )   THEN  'Face to Face'
				WHEN ac.ActivityClassificationID IN (307, 369, 196, 98 , 147, 49)     THEN  'Travel'
                ELSE 'Other'
           END  as ActivityClassificationGroup
FROM       dl.DimActivityClassification ac

GO

