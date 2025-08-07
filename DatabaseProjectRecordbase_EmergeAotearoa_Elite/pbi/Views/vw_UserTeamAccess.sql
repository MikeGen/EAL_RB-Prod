CREATE view [pbi].[vw_UserTeamAccess] as
-- Teams that a User has access to as a Service Manager or Recordbase User
select ut.UserID,
       ut.TeamID,
	   u.UserEmailAddress,
	   u.UserEmployeeNumber,
	   t.TeamUDF5,    -- Finance Cost Centers
	   t.TeamCode,
	   t.TeamName
from       dl.FactUserTeam    ut
inner join dl.DimUser         u  on u.UserID      = ut.UserID
inner join dl.DimTeam         t  on t.TeamID      = ut.TeamID
inner join dl.DimUserType     ty on ty.UserTypeID = u.UserTypeID
where t.TeamEndDate         is   null
and   ty.UserTypeIsHidden   =    0
and   ut.UserTeamDeletedDate is null
and   u.UserDisabledDate     is null
-- remove Finance/Quality Team users who have overarching access
and   upper(u.UserEmailAddress) not in 
        (
         'BASIL.DRAIN@EMERGEAOTEAORA.ORG.NZ'
        ,'DAVID.VANTURNHOUT@EMERGEAOTEAROA.ORG.NZ'
        ,'BRAD.PALMER@EMERGEAOTEAROA.ORG.NZ'
        ,'ELLA.LYNCH@EMERGEAOTEAROA.ORG.NZ'
        ,'JAY.GONSAL-KORALE@EMERGEAOTEAROA.ORG.NZ'
        ,'NICOLENE.PIENAAR@EMERGEAOTEAROA.ORG.NZ'
        ,'JASMINE.MOHAMMED@EMERGEAOTEAROA.ORG.NZ'
        ,'CHAMARA.ILLAN@EMERGEAOTEAROA.ORG.NZ'
        ,'RIKKI-LEE.JOYCE@EMERGEAOTEAROA.ORG.NZ'
        ,'GONDA.SOLLIE@EMERGEAOTEAROA.ORG.NZ'
        ,'TREVOR.COOPER@EMERGEAOTEAROA.ORG.NZ'
        ,'STEFEN.HASSELBERG@EMERGEAOTEAROA.ORG.NZ'
        ,'GREG.HUBBARD@EMERGEAOTEAROA.ORG.NZ'
        ,'KATHY.CRIBBETT@EMERGEAOTEAROA.ORG.NZ'
        ,'CATHERINE.BENNETT@EMERGEAOTEAROA.ORG.NZ'
        ,'ANDY.DIMOND@EMERGEAOTEAROA.ORG.NZ'
        ,'WENDY.BECK@EMERGEAOTEAROA.ORG.NZ'
        ,'NATHAN.BARTHOW@EMERGEAOTEAROA.ORG.NZ'
        ,'MICHELLE.BRADSHAW@EMERGEAOTEAROA.ORG.NZ'
        ,'ANDREW.BOLITHO@EMERGEAOTEAROA.ORG.NZ'
        ,'HELEN.EGAN@EMERGEAOTEAROA.ORG.NZ'
        ,'MARVIN.KAGIRI@EMERGEAOTEAROA.ORG.NZ'
        ,'FAYE.LOGAN@EMERGEAOTEAROA.ORG.NZ'
        ,'COLLEEN.ZIMRI@EMERGEAOTEAROA.ORG.NZ'
        ,'JOHN.COOK@EMERGEAOTEAROA.ORG.NZ'
        ,'CELENE.JOHNSON@EMERGEAOTEAROA.ORG.NZ'
        ,'CHRIS.MAXWELL@EMERGEAOTEAROA.ORG.NZ'
        )

GO

