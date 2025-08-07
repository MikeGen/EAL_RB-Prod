CREATE TABLE [stage].[Stage_UserSession] (
    [ID]                              INT            NOT NULL,
    [UserID]                          INT            NOT NULL,
    [SignOnDate]                      DATETIME       NOT NULL,
    [IPAddress]                       VARCHAR (50)   NOT NULL,
    [BrowserName]                     VARCHAR (50)   NOT NULL,
    [BrowserVersion]                  VARCHAR (50)   NOT NULL,
    [ApplicationId]                   INT            NULL,
    [UserAgent]                       NVARCHAR (MAX) NULL,
    [ImpersonatedByUserId]            INT            NULL,
    [RecordbaseIdentitySignOnSession] NVARCHAR (64)  NULL
);


GO

