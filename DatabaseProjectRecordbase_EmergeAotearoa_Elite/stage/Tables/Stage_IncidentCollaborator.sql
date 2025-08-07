CREATE TABLE [stage].[Stage_IncidentCollaborator] (
    [ID]                INT            NOT NULL,
    [IncidentID]        INT            NOT NULL,
    [UserID]            INT            NOT NULL,
    [StartDate]         DATETIME       NOT NULL,
    [EndDate]           DATETIME       NULL,
    [Role]              NVARCHAR (150) NULL,
    [CanAddNotes]       BIT            NOT NULL,
    [CanAddAttachments] BIT            NOT NULL,
    [InactiveReason]    NVARCHAR (MAX) NULL,
    [Comments]          NVARCHAR (MAX) NULL,
    [CreatedUserID]     INT            NOT NULL,
    [CreatedDate]       DATETIME       NOT NULL,
    [ModifiedUserID]    INT            NULL,
    [ModifiedDate]      DATETIME       NULL,
    [DeletedUserID]     INT            NULL,
    [DeletedDate]       DATETIME       NULL,
    [InactiveUserID]    INT            NULL,
    [InactiveDate]      DATETIME       NULL
);


GO

