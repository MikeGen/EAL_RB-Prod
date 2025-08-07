

CREATE FUNCTION [dbo].[fnDateKeyToSmallDate]
(
	-- Add the parameters for the function here
	@DateKey int
)
RETURNS Date
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ReturnDate date

	-- Add the T-SQL statements to compute the return value here	
	select @ReturnDate = Cast(ActualDate as Date) from transform.DimCalendar where DateKey = @DateKey

	-- Return the result of the function
	RETURN @ReturnDate

END

GO

