CREATE TABLE [dl].[FactUserSession] (
    [UserSessionID]                              INT            NOT NULL,
    [UserID]                                     INT            NOT NULL,
    [UserSessionSignOnDate]                      DATETIME       NOT NULL,
    [UserSessionIPAddress]                       VARCHAR (50)   NOT NULL,
    [UserSessionBrowserName]                     VARCHAR (50)   NOT NULL,
    [UserSessionBrowserVersion]                  VARCHAR (50)   NOT NULL,
    [ApplicationId]                              INT            NULL,
    [UserSessionUserAgent]                       NVARCHAR (MAX) NULL,
    [ImpersonatedByUserId]                       INT            NULL,
    [UserSessionRecordbaseIdentitySignOnSession] NVARCHAR (64)  NULL
);


GO

CREATE CLUSTERED INDEX [IX_FactUserSession_UserSessionID]
    ON [dl].[FactUserSession]([UserSessionID] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactUserSession_UserID]
    ON [dl].[FactUserSession]([UserID] ASC)
    INCLUDE([UserSessionSignOnDate]);


GO

