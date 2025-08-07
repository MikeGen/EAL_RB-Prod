CREATE TABLE [stage].[Stage_PersonRelationship] (
    [ID]                  INT           NOT NULL,
    [PersonID]            INT           NOT NULL,
    [UserID]              INT           NOT NULL,
    [RelationshipTypeID]  INT           NOT NULL,
    [StartDate]           DATETIME      NOT NULL,
    [EndDate]             DATETIME      NULL,
    [Detail]              VARCHAR (300) NULL,
    [InactiveUserID]      INT           NULL,
    [InactiveDate]        DATETIME      NULL,
    [CreatedUserID]       INT           NOT NULL,
    [CreatedDate]         DATETIME      NOT NULL,
    [ModifiedUserID]      INT           NULL,
    [ModifiedDate]        DATETIME      NULL,
    [DeletedUserID]       INT           NULL,
    [DeletedDate]         DATETIME      NULL,
    [ReferralId]          INT           NULL,
    [IsPrimaryCaseworker] BIT           NOT NULL
);


GO

