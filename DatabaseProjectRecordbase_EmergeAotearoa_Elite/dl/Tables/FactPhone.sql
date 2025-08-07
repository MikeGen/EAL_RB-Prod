CREATE TABLE [dl].[FactPhone] (
    [PhoneID]            INT          NOT NULL,
    [PhoneName]          VARCHAR (50) NULL,
    [PhonePhoneNumber]   VARCHAR (60) NULL,
    [PhoneNumberTypeID]  INT          NULL,
    [PhoneEntityType]    VARCHAR (50) NOT NULL,
    [EntityID]           INT          NOT NULL,
    [PhoneCreatedDate]   DATETIME     NOT NULL,
    [PhoneCreatedUserID] INT          NOT NULL,
    CONSTRAINT [PK_dl_FactPhone] PRIMARY KEY CLUSTERED ([PhoneID] ASC)
);


GO

