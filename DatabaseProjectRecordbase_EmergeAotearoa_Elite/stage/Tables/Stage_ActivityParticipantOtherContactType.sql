CREATE TABLE [stage].[Stage_ActivityParticipantOtherContactType] (
    [ID]                   INT            NOT NULL,
    [Name]                 NVARCHAR (MAX) NOT NULL,
    [IsEmployer]           BIT            NOT NULL,
    [CreatedDate]          DATETIME       NOT NULL,
    [CreatedUserID]        INT            NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [ModifiedUserID]       INT            NULL,
    [DeletedDate]          DATETIME       NULL,
    [DeletedUserID]        INT            NULL,
    [IsHealthProfessional] BIT            NOT NULL,
    [IsFamily]             BIT            NOT NULL
);


GO

