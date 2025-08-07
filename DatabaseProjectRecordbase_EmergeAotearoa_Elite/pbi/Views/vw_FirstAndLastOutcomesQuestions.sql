CREATE VIEW pbi.vw_FirstAndLastOutcomesQuestions
AS 



WITH DimQuestions (SortOrder, QuestionID, QuestionDesc) as
(
          SELECT 12 ,'Q1' , 'Hope for the future'
UNION ALL SELECT 11 ,'Q2' , 'Quality of life'
UNION ALL SELECT 10 ,'Q3' , 'Spirituality / Personal Beliefs (Wairua)'
UNION ALL SELECT 9  ,'Q4' , 'Daily living skills'
UNION ALL SELECT 8  ,'Q5' , 'Mental health (Hinengaro)'
UNION ALL SELECT 7  ,'Q6' , 'Physical health (Tinana)'
UNION ALL SELECT 6  ,'Q7' , 'Culture (Maoritanga)'
UNION ALL SELECT 5  ,'Q8' , 'Relationships (Whanau)'
UNION ALL SELECT 4  ,'Q9' , 'Autonomy (Mauri Ora)'
UNION ALL SELECT 3  ,'Q10', 'Housing and accommodation'
UNION ALL SELECT 2  ,'Q11', 'Money and finances'
UNION ALL SELECT 1  ,'Q12', 'Education, training, work (paid & unpaid)'
)
SELECT * FROM DimQuestions

GO

