CREATE TABLE [stage].[Stage_AccountContact] (
    [ID]               INT            NOT NULL,
    [AccountID]        INT            NOT NULL,
    [TitleID]          INT            NULL,
    [FirstName]        NVARCHAR (50)  NOT NULL,
    [LastName]         NVARCHAR (50)  NOT NULL,
    [Position]         NVARCHAR (300) NULL,
    [EmailAddress]     NVARCHAR (300) NULL,
    [Phone]            NVARCHAR (50)  NULL,
    [AlternativePhone] NVARCHAR (50)  NULL,
    [Fax]              NVARCHAR (50)  NULL,
    [CommentsHTML]     NVARCHAR (MAX) NULL,
    [CommentsRaw]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedUserID]    INT            NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedUserID]   INT            NULL,
    [DeletedDate]      DATETIME       NULL,
    [DeletedUserID]    INT            NULL,
    [UDF1]             NVARCHAR (MAX) NULL,
    [UDF2]             NVARCHAR (MAX) NULL,
    [UDF3]             NVARCHAR (MAX) NULL,
    [UDF4]             NVARCHAR (MAX) NULL,
    [UDF5]             NVARCHAR (MAX) NULL,
    [Mobile]           NVARCHAR (50)  NULL
);


GO

