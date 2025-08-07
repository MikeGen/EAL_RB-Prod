--adjust final line to grant execute permission to the user used by the WildBamboo ETL process

CREATE   PROCEDURE [emp].[BuildPersonContinuousEmployment]
    @PersonID int
AS

Begin Tran 

delete emp.FactPersonContinuousEmployment where ClientID = @PersonID

delete emp.FactContinuousEmploymentJobs where JobID in
(
	select v.VocationID from dl.FactVocation v
	join dl.FactEmploymentPlanOutcomeJob ev on v.VocationID = ev.EmploymentPlanOutcomeJobID 
	where v.PersonID = @PersonID
)

DECLARE @EOF bit
DECLARE @JobCnt int = 0
DECLARE @JobCntMax int
DECLARE @JobTransitionDays int = 0

DECLARE @NewContinuousEmployment bit

DECLARE @JobPersonID int = 0
DECLARE @PtrJobPersonID int
DECLARE @JobID int = 0
DECLARE @PtrJobID int
DECLARE @JobStartDate date = '1900-01-01'
DECLARE @JobEndDate date
DECLARE @PtrJobStartDate date
DECLARE @PtrJobEndDate date

DECLARE @ContinuousEmploymentStartDate date
DECLARE @ContinuousEmploymentEndDate date

DECLARE @NewContinuousEmploymentID int
DECLARE @jobs TABLE 
( 
    jobid INT 
)


SELECT @JobCntMax=COUNT(*) FROM dl.FactVocation WHERE PersonID = @PersonID AND VocationID IN
(SELECT EmploymentPlanOutcomeJobID FROM dl.FactEmploymentPlanOutcomeJobHours)

--Get the transition days from config
SELECT @JobTransitionDays = CAST(ConfigurationSettingValue AS integer) FROM dl.DimConfigurationSetting WHERE ConfigurationSettingCode = 'ContinuousEmploymentThreshold'

print @JobCntMax

SET @NewContinuousEmployment = 1
SET @EOF = 1
WHILE @EOF = 1 BEGIN
	SELECT TOP 1 @JobPersonID=v.PersonID, @JobID=v.VocationID, @JobStartDate=v.VocationStartDate, @JobEndDate=v.VocationEndDate 
	FROM dl.FactVocation v join
	dl.FactEmploymentPlanOutcomeJob ev on v.VocationID = ev.EmploymentPlanOutcomeJobID join
	dl.FactEmploymentPlan e on ev.EmploymentPlanID = e.EmploymentPlanID
	WHERE e.EmploymentPlanIsSupportPlan = 0
	AND v.PersonID = @PersonID
	AND Cast(CAST(v.PersonID AS varchar(10)) + convert(char(8), v.VocationStartDate, 112) + CAST(v.VocationID AS varchar(10)) as BigInt) > Cast(CAST(@JobPersonID as varchar(10)) + convert(char(8), @JobStartDate, 112) + CAST(@JobID AS varchar(10)) as BigInt)
	ORDER BY v.PersonID, v.VocationStartDate, v.VocationID
	
	
	
	IF @@ROWCOUNT = 0 OR (@JobCnt >= @JobCntMax) BEGIN -- End of table
		SET @EOF = 0		
		-- Insert Final Continuous Employment		
		if(@JobCntMax = 0 )
		  Print 'This client ' + CAST(@PersonID AS varchar(10)) + ' doesn''t have Job record'
		
		if @PtrJobPersonID is not null
		INSERT INTO emp.FactPersonContinuousEmployment (ClientID, StartDate, EndDate)
		VALUES (@PtrJobPersonID, @ContinuousEmploymentStartDate, @ContinuousEmploymentEndDate)

		SET @NewContinuousEmploymentID = @@IDENTITY
		INSERT INTO emp.FactContinuousEmploymentJobs (ContinuousEmploymentID, JobID)
		SELECT @NewContinuousEmploymentID, JobID FROM @Jobs

		DELETE @Jobs
	END
	ELSE BEGIN -- found row in table	    
		IF @NewContinuousEmployment = 1 BEGIN -- New Job
		     
		    SET @NewContinuousEmployment = 0 
		    
		    --***If the current job is related to a "support plan" then only use if there is a job related to an "employment plan" after.
		    
            --Check the new start date is less than or equal to previous end date (plus the transition value)
			IF @JobStartDate <= DATEADD(day, @JobTransitionDays, @PtrJobEndDate) OR (@PtrJobEndDate IS NULL and @JobCnt <> 0) BEGIN
				--if new end date is greater that previous end date set new ContinuousEmploymentenddate 
				IF @JobEndDate IS NULL or @JobEndDate > @PtrJobEndDate BEGIN
					SET @ContinuousEmploymentEndDate = @JobEndDate
					SET @PtrJobEndDate = @JobEndDate
					
				END
			END
			ELSE BEGIN				
				SET @NewContinuousEmployment = 1
				-- Insert Continuous Employment
				if @PtrJobPersonID is not null
				INSERT INTO emp.FactPersonContinuousEmployment (ClientID, StartDate, EndDate)
				VALUES (@PtrJobPersonID, @ContinuousEmploymentStartDate, @ContinuousEmploymentEndDate)
				
				SET @NewContinuousEmploymentID = @@IDENTITY
				INSERT INTO emp.FactContinuousEmploymentJobs (ContinuousEmploymentID, JobID)
				SELECT @NewContinuousEmploymentID, JobID FROM @Jobs	
				
				DELETE @Jobs			
			END
            
            if(@NewContinuousEmployment =1)
            Begin 
			SET @ContinuousEmploymentStartDate = @JobStartDate
			SET @ContinuousEmploymentEndDate = @JobEndDate
			
			SET @PtrJobStartDate = @JobStartDate
			SET @PtrJobEndDate = @JobEndDate
			
			SET @PtrJobPersonID = @JobPersonID	
			
			End		

		END
		ELSE BEGIN
			--Check the new start date is less than or equal to previous end date (plus the transition value)
			IF @JobStartDate <= DATEADD(day, @JobTransitionDays, @PtrJobEndDate) OR @PtrJobEndDate IS NULL BEGIN
				--if new end date is greater that previous end date set new ContinuousEmploymentenddate 
				IF @JobEndDate IS NULL or @JobEndDate > @PtrJobEndDate BEGIN
					SET @ContinuousEmploymentEndDate = @JobEndDate
					SET @PtrJobEndDate = @JobEndDate
				END
			END
			ELSE BEGIN				
				SET @NewContinuousEmployment = 1
				-- Insert Continuous Employment
				INSERT INTO emp.FactPersonContinuousEmployment (ClientID, StartDate, EndDate)
				VALUES (@PtrJobPersonID, @ContinuousEmploymentStartDate, @ContinuousEmploymentEndDate)			
				
				SET @NewContinuousEmploymentID = @@IDENTITY
				INSERT INTO emp.FactContinuousEmploymentJobs (ContinuousEmploymentID, JobID)
				SELECT @NewContinuousEmploymentID, JobID FROM @Jobs

				DELETE @Jobs

				--Set new ContinuousEmploymentStartDate and ContinuousEmploymentEndDate
				SET @ContinuousEmploymentStartDate = @JobStartDate
				SET @ContinuousEmploymentEndDate = @JobEndDate
				SET @PtrJobStartDate = @JobStartDate
			    SET @PtrJobEndDate = @JobEndDate
			
			END
			
		
		END
		INSERT INTO @Jobs (JobID)
		values (@JobID)

		SET @JobCnt = @JobCnt + 1
	
	END
END

Commit Tran

GO

