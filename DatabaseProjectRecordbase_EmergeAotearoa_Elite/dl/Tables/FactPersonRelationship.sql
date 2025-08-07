CREATE TABLE [dl].[FactPersonRelationship] (
    [PersonRelationshipID]                  INT           NOT NULL,
    [PersonID]                              INT           NOT NULL,
    [UserID]                                INT           NOT NULL,
    [RelationshipTypeID]                    INT           NOT NULL,
    [PersonRelationshipStartDate]           DATETIME      NOT NULL,
    [PersonRelationshipEndDate]             DATETIME      NULL,
    [PersonRelationshipDetail]              VARCHAR (300) NULL,
    [PersonRelationshipCreatedUserID]       INT           NOT NULL,
    [PersonRelationshipCreatedDate]         DATETIME      NOT NULL,
    [ReferralId]                            INT           NULL,
    [PersonRelationshipIsPrimaryCaseworker] BIT           NOT NULL,
    CONSTRAINT [PK_dl_FactPersonRelationship] PRIMARY KEY CLUSTERED ([PersonRelationshipID] ASC)
);


GO

