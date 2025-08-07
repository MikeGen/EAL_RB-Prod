CREATE   VIEW AttachmentPerson AS
SELECT 
a.AttachmentID AS [AttachmentID],
CASE WHEN a.AttachmentEntityType = 'Person' THEN a.EntityID ELSE CASE WHEN a.AttachmentEntityType = 'Activity' THEN ap.EntityID END END AS [PersonID]
FROM dl.FactAttachment a
LEFT JOIN dl.FactActivityParticipant ap on a.EntityID = ap.ActivityID and a.AttachmentEntityType = 'Activity' and ap.ActivityParticipantEntityType = 'Person'

GO

