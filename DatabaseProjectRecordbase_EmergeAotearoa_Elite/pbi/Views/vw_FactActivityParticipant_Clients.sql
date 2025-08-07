CREATE VIEW pbi.vw_FactActivityParticipant_Clients
AS 


SELECT  apClt.ActivityID,
        apClt.ReferralID, 
        apClt.EntityID     AS ClientPersonID,
		apEmp.EntityID     AS EmpUserID,
		a.ActivityStartDate,    -- denormalising for convenience
		a.TeamID,               -- denormalising for convenience
        a.ActivityTypeID,       -- denormalising for convenience
        r.ReferralReceivedDate, -- denormalising for convenience
        r.ReferralEndDate,      -- denormalising for convenience
        r.ReferralReferralType  -- denormalising for convenience

FROM       dl.FactActivityParticipant  apClt 
LEFT  JOIN dl.FactActivityParticipant  apEmp ON apEmp.ActivityID = apClt.ActivityID AND apEmp.ActivityParticipantEntityType = 'User'    -- note there could be multiple rows for 1 participant. So do Not count without Distinct
INNER JOIN dl.FactActivity             a     ON a.ActivityID     = apClt.ActivityID     -- added to denormalise for convenience
INNER JOIN dl.FactReferral             r     ON r.ReferralID     = apClt.ReferralID
WHERE   apClt.ActivityParticipantEntityType = 'Person'

GO

