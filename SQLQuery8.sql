--Part – A
--1.
--Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
	PRINT 5 / 0;
BEGIN TRY

	DECLARE @A INT = 10,@B INT = 10;

	DECLARE @RESULT INT;
	SET @RESULT = @A / @B;

	PRINT @RESULT;
END TRY

BEGIN CATCH

	PRINT 'Error occurs that is - Divide by zero error.'

END CATCH
--2.
--Try to convert string to integer and handle the error using try…catch block.
	GO
CREATE OR ALTER PROCEDURE PR_DivideNumbers
	@A	INT,
	@B	INT
AS
BEGIN
	BEGIN TRY
		DECLARE @RESULT INT;
		SET @RESULT = @A / @B;

		PRINT 'Result = ' + CAST(@RESULT AS VARCHAR);
	END TRY
	BEGIN CATCH
		PRINT 'Error occurs that is - Divide by zero error.'
	END CATCH
END;
GO

EXEC PR_DivideNumbers 10,2;
EXEC PR_DivideNumbers 10,0;
--3.
--Create a procedure that prints the sum of two numbers: take both numbers as integer & handle exception with all error functions if any one enters string value in numbers otherwise print result.
GO
CREATE OR ALTER PROCEDURE PR_AddNumbers
	@N1 INT,@N2 INT
AS
BEGIN
	BEGIN TRY
		DECLARE @SUM INT;
		SET @SUM = @N1 + @N2;

		PRINT 'Sum = ' + CAST(@SUM AS VARCHAR);
	END TRY
	BEGIN CATCH
		-- ERROR FUNCTIONS

		SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage,
			ERROR_PROCEDURE() AS ErrorProcedure
	END CATCH;
END;
GO

EXEC PR_AddNumbers 10,20;
EXEC PR_AddNumbers 10,'DARSHAN';
--4.
--Handle a Primary Key Violation while inserting data into student table and print the error details such as the error message, error number, severity, and state.
GO
CREATE OR ALTER PROCEDURE PR_AddNumbers
    @N1 VARCHAR(10),
    @N2 VARCHAR(10)
AS
BEGIN

BEGIN TRY

    DECLARE @A INT
    DECLARE @B INT
    DECLARE @SUM INT

    SET @A = CAST(@N1 AS INT)
    SET @B = CAST(@N2 AS INT)				-- 14th line

    SET @SUM = @A + @B

    PRINT 'Sum = ' + CAST(@SUM AS VARCHAR)

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage,
        ERROR_PROCEDURE() AS ErrorProcedure

END CATCH
END;
GO

EXEC PR_AddNumbers 10,'DARSHAN';
--5.
--Throw custom exception using stored procedure which accepts StudentID as input & that throws Error like no StudentID is available in database.
GO
CREATE OR ALTER PROCEDURE PR_CheckStudent
	@SID INT
AS
BEGIN
	BEGIN TRY
		
		IF NOT EXISTS
		(
			SELECT * FROM STUDENT WHERE StudentID = @SID
		)

		THROW 50001, 'No StudentID is available in database', 1;
		
		ELSE
			PRINT 'Student exists in database';

	END TRY

	BEGIN CATCH
			
	SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_STATE() AS ErrorState,
        ERROR_MESSAGE() AS ErrorMessage

	END CATCH
END;
GO

EXEC PR_CheckStudent 1;
EXEC PR_CheckStudent 111;
--6.
--Handle a Foreign Key Violation while inserting data into Enrollment table and print appropriate error message.
GO
CREATE OR ALTER PROCEDURE PR_CheckStudent_RaiseError
    @SID INT
AS
BEGIN
Begin Try
	DECLARE @Count INT
	SELECT @Count = COUNT(*)
    FROM STUDENT
    WHERE StudentID = @SID

    IF @Count = 0
        RAISERROR('No StudentID is available in database',16,1)
    ELSE
        PRINT 'StudentID exists in database'

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_MESSAGE() AS ErrorMessage,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine

END CATCH

END
GO

EXEC PR_CheckStudent_RaiseError 111; 