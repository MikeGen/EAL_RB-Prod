

create   procedure [transform].[up_CalenderInsert]
	@MaxDate datetime
as
/*
Date/Who	History
30-Apr-10	Creation. Source: http://my.opera.com/duncans/blog/show.dml/2355927 and subsequently altered.
P.Phipps	See also http://my.opera.com/duncans/blog/show.dml/2355926 on how to add a time dimension to Analysis Services
			Depending on the requirements for the first day of the week, the datefirst may need to be set.

example: exec up_CalenderInsert '31-dec-2020'
truncate table DimCalendar
check: select MAX(DateKey) from DimCalendar
select top 100 * from DimCalendar order by DateKey

Issue - The Week column is not correct calculation as a week can overlap years which causes issues when creating a dimension. 
Following the recommendations of Chris Webb et al. in Expert Cube Development with Microsoft SQL Server 2008 Analysis Services
the date time dimension needs an additional attribute of a week key. The values of the week are for you to define.
Since a week is not limited by year, create an arbitrary begin date, say first Thursday (Friday) in 1900-01-01. 
Each week key is calculated from that date. This will give you a weekly calendar that you can use as you would a day element.
My current workaround is to use the Weekname column. This is okay but it means that the first and last weeks of the year do not always have 7 days. 
It does mean that all full weeks start on the datefirst setting.

*/

declare @CurrentMaxDate datetime
declare @TheDate datetime
set @CurrentMaxDate = (Select COALESCE(MAX(ActualDate),'31-Dec-1970') from [transform].DimCalendar)
set @TheDate = dateadd(d, 1, @CurrentMaxDate)

set nocount on
set DateFirst 1 -- set Monday to the first day of the week.

WHILE @TheDate <= @MaxDate BEGIN
	INSERT INTO [transform].[DimCalendar]
			   ([DateKey],[ActualDate],[DateName],[Year],[YearName],[Quarter],[QuarterName],[Month],[MonthName]
			   ,[Week],[WeekName],[DayOfYear],[DayOfYearName],[DayOfQuarter],[DayOfQuarterName],[DayOfMonth],[DayOfMonthName],[DayOfWeek]
			   ,[DayOfWeekName],[WeekOfYear],[WeekOfYearName],[MonthOfYear],[MonthOfYearName],[MonthOfQuarter],[MonthOfQuarterName]
			   ,[QuarterOfYear],[QuarterOfYearName])
	select convert(int, convert(char(8), @TheDate, 112)) as DateKey,
	@TheDate as ActualDate,
	datename(dw, @TheDate)+ ', ' + datename(mm, @TheDate) + ' ' + right('00' + convert(char(2), datepart(d, @TheDate)), 2) + ' ' + convert(char(4), datepart(yyyy, @TheDate)) as [DateName],
	dateadd(yyyy, datediff(yyyy, 0, @TheDate), 0) as [Year],
	convert(char(4), datepart(yyyy, @TheDate)) as YearName,
	dateadd(qq, datediff(qq, 0, @TheDate), 0) as [Quarter],
	convert(char(4), datepart(yyyy, @TheDate)) + ' Q ' + convert(char(1), datepart(qq, @TheDate)) as QuarterName,
	dateadd(mm, datediff(mm, 0, @TheDate), 0) as [Month],
	convert(varchar(9), datename(mm, @TheDate)) + ' ' + convert(char(4), datepart(yyyy, @TheDate)) as [MonthName],
	dateadd(wk, datediff(wk, 0, @TheDate), 0) as [Week],
	'Week ' + right('0' + convert(varchar, datepart(wk, @TheDate)),2) + ', ' + convert(char(4), datepart(yyyy, @TheDate)) as WeekName,
	datepart(dy, @TheDate) as [DayOfYear],
	rtrim('Day ' + convert(char(3), datepart(dy, @TheDate))) as DayOfYearName,
	datediff(d, dateadd(qq, datediff(qq, 0, @TheDate), 0), @TheDate) + 1 as DayOfQuarter,
	rtrim('Day ' + convert(char(3),datediff(d, dateadd(qq, datediff(qq, 0, @TheDate), 0), @TheDate) + 1)) as DayOfQuarterName,
	DATEPART(DAY, @TheDate) as [DayOfMonth],
	rtrim('Day ' + convert(char(3),DATEPART(DAY, @TheDate))) as [DayOfMonthName],
	datepart(dw, @TheDate) as [DayOfWeek],
	'Day ' + convert(char(1), datepart(dw, @TheDate)) as DayOfWeekName,
	datepart(wk, @TheDate) as WeekOfYear,
	rtrim('Week ' + convert(char(2), datepart(wk, @TheDate))) as WeekOfYearName,
	datepart(mm, @TheDate) as MonthOfYear,
	rtrim('Month ' + convert(char(2),datepart(mm, @TheDate))) as MonthOfYearName,	
	datediff(mm, dateadd(qq, datediff(qq, 0, @TheDate), 0), @TheDate) + 1 as MonthOfQuarter,
	rtrim('Month ' + convert(char(2), datediff(mm, dateadd(qq, datediff(qq, 0, @TheDate), 0), @TheDate) + 1)) as MonthOfQuarterName,
	datepart(qq, @TheDate) as QuarterOfYear,
	rtrim('Quarter ' + convert(char(1), datepart(qq, @TheDate))) as QuarterOfYearName

	set @TheDate = dateadd(d, 1, @TheDate)

end

GO

