

CREATE   FUNCTION [elite].[GetLocalDate]
(
)
    RETURNS DATETIME
    with SCHEMABINDING
AS
BEGIN
    DECLARE @LocalTime DATETIME
    DECLARE @TimeZone varchar(50);

    SELECT TOP (1) @TimeZone = [ConfigurationSettingValue] FROM [dl].[DimConfigurationSetting] WHERE [ConfigurationSettingCode] = 'DefaultTimeZone'
    IF (@TimeZone IS NULL or @TimeZone = 'W. Australia Standard Time' or @TimeZone = 'AUS Eastern Standard Time')
        BEGIN
            SET @TimeZone = 'NEW ZEALAND STANDARD TIME'
        END
    SELECT @LocalTime  = CONVERT(datetime, SWITCHOFFSET(GETUTCDATE(), DATEPART(TZOFFSET, GETUTCDATE() AT TIME ZONE @Timezone)))
    RETURN @LocalTime
END

GO

