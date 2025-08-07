CREATE TABLE [dl].[DimActivityParticipantOtherContactType] (
    [ActivityParticipantOtherContactTypeID]                   INT            NOT NULL,
    [ActivityParticipantOtherContactTypeName]                 NVARCHAR (MAX) NOT NULL,
    [ActivityParticipantOtherContactTypeIsEmployer]           BIT            NOT NULL,
    [ActivityParticipantOtherContactTypeIsHealthProfessional] BIT            NOT NULL,
    [ActivityParticipantOtherContactTypeIsFamily]             BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimActivityParticipantOtherContactType] PRIMARY KEY CLUSTERED ([ActivityParticipantOtherContactTypeID] ASC)
);


GO

