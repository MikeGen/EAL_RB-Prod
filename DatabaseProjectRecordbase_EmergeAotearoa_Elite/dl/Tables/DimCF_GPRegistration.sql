CREATE TABLE [dl].[DimCF_GPRegistration] (
    [CF_GPRegistrationID]       INT            NOT NULL,
    [CF_GPRegistrationValue]    NVARCHAR (200) NOT NULL,
    [CF_GPRegistrationText]     NVARCHAR (200) NOT NULL,
    [CF_GPRegistrationParentId] INT            NULL,
    [CF_GPRegistrationIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCF_GPRegistration] PRIMARY KEY CLUSTERED ([CF_GPRegistrationID] ASC)
);


GO

