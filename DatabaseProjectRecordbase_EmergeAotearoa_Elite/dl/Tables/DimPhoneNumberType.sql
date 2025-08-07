CREATE TABLE [dl].[DimPhoneNumberType] (
    [PhoneNumberTypeID]       INT            NOT NULL,
    [PhoneNumberTypeValue]    NVARCHAR (200) NOT NULL,
    [PhoneNumberTypeText]     NVARCHAR (200) NOT NULL,
    [PhoneNumberTypeParentId] INT            NULL,
    [PhoneNumberTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPhoneNumberType] PRIMARY KEY CLUSTERED ([PhoneNumberTypeID] ASC)
);


GO

