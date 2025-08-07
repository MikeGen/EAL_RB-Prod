CREATE TABLE [dl].[DimUserType] (
    [UserTypeID]          INT            NOT NULL,
    [UserTypeName]        NVARCHAR (50)  NOT NULL,
    [UserTypeDescription] NVARCHAR (300) NULL,
    [UserTypeIsHidden]    BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimUserType] PRIMARY KEY CLUSTERED ([UserTypeID] ASC)
);


GO

