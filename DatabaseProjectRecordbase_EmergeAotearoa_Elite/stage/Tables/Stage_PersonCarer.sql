CREATE TABLE [stage].[Stage_PersonCarer] (
    [ID]                         INT           NOT NULL,
    [PersonID]                   INT           NOT NULL,
    [Name]                       NVARCHAR (50) NOT NULL,
    [CarerTypeID]                INT           NULL,
    [CarerRelationshipID]        INT           NULL,
    [AllowanceReceivedID]        INT           NULL,
    [LivesWithClient]            BIT           NULL,
    [DateOfBirth]                SMALLDATETIME NULL,
    [CreatedDate]                DATETIME      NOT NULL,
    [CreatedUserID]              INT           NOT NULL,
    [ModifiedDate]               DATETIME      NULL,
    [ModifiedUserID]             INT           NULL,
    [DeletedDate]                DATETIME      NULL,
    [DeletedUserID]              INT           NULL,
    [ReceivesSupportFromService] BIT           NULL
);


GO

