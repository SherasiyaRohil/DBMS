--Cursor
--Part – A
	SELECT * FROM COURSE
--1. Create a cursor Course_Cursor to fetch all rows from COURSE table and display them.
	DECLARE @CID VARCHAR(10), @CNAME VARCHAR(100), @CREDITS INT, @DEPT VARCHAR(50), @SEM INT;

	DECLARE Course_Cursor CURSOR
	FOR SELECT CourseId,CourseName,CourseCredits,Coursedepartment,CourseSemester
	from COURSE
	
	OPEN Course_Cursor

	FETCH NEXT FROM Course_Cursor INTO @CID,@CNAME,@CREDITS,@DEPT,@SEM

	WHILE @@FETCH_STATUS=0
	BEGIN 
			PRINT (CAST(@CID AS VARCHAR)+' '+@CNAME+' '+CAST(@CREDITS AS VARCHAR)+' '+@DEPT+CAST(@SEM AS VARCHAR))
			
			FETCH NEXT FROM Course_Cursor INTO @CID,@CNAME,@CREDITS,@DEPT,@SEM
	END

	CLOSE Course_Cursor

	DEALLOCATE Course_Cursor

--2. Create a cursor Student_Cursor_Fetch to fetch records in form of StudentID_StudentName (Example:
--1_Raj Patel).

	DECLARE @SID INT , @STUNAME VARCHAR(50)

	DECLARE Student_Cursor_Fetch CURSOR
	FOR SELECT StudentID,StuName FROM STUDENT;

	OPEN Student_Cursor_Fetch

	FETCH NEXT FROM Student_Cursor_Fetch INTO @SID,@STUNAME

	WHILE @@FETCH_STATUS=0
	BEGIN 
			PRINT (CAST(@SID AS VARCHAR)+'_'+@STUNAME)

			FETCH NEXT FROM Student_Cursor_Fetch INTO @SID,@STUNAME
	END

	CLOSE Student_Cursor_Fetch

	DEALLOCATE Student_Cursor_Fetch



--3. Create a cursor to find and display all courses with Credits greater than 3.
	
	DECLARE @coursesID VARCHAR(100), @coursesNAME VARCHAR(100), @coursesCREDITS INT, @coursesDEPT VARCHAR(50), @coursesSEM INT;

	DECLARE Display_Course_Cursor CURSOR
	FOR SELECT CourseID,CourseName,CourseCredits,CourseDepartment,CourseSemester FROM COURSE where CourseCredits >3

	OPEN Display_Course_Cursor

	FETCH NEXT FROM Display_Course_Cursor INTO @coursesID,@coursesNAME,@coursesCREDITS,@coursesDEPT,@coursesSEM
		
	WHILE @@FETCH_STATUS=0
	BEGIN 
			PRINT (CAST(@coursesID AS VARCHAR)+' '+@coursesNAME+' '+CAST(@coursesCREDITS AS VARCHAR)+' '+@coursesDEPT+CAST(@coursesSEM AS VARCHAR))
			FETCH NEXT FROM Display_Course_Cursor INTO @coursesID,@coursesNAME,@coursesCREDITS,@coursesDEPT,@coursesSEM
	END
	
	CLOSE Display_Course_Cursor

	DEALLOCATE Display_Course_Cursor

--4. Create a cursor to display all students who enrolled in year 2021 or later.
	
	DECLARE @SID4 INT , @STUNAME4 VARCHAR(50),@YEAR INT
	DECLARE Student_Cursor CURSOR
	FOR SELECT StudentID,StuName,StuEnrollmentYear FROM STUDENT WHERE StuEnrollmentYear >=2021;

	OPEN Student_Cursor
	
	FETCH NEXT FROM Student_Cursor INTO @SID4,@STUNAME4,@YEAR
		
		WHILE @@FETCH_STATUS=0
		BEGIN 
				PRINT (CAST(@SID4 AS VARCHAR)+'_IS'+@STUNAME4+'enrolled in year'+CAST(@YEAR AS VARCHAR))
				FETCH NEXT FROM Student_Cursor INTO @SID4,@STUNAME4,@YEAR
		END

		CLOSE Student_Cursor

		DEALLOCATE Student_Cursor
--5. Create a cursor Course_CursorUpdate that retrieves all courses and increases Credits by 1 for courses
--with Credits less than 4.
	
DECLARE @CID5 VARCHAR(10), @CREDITS5 INT

DECLARE Course_CursorUpdate CURSOR FOR
SELECT CourseID,CourseCredits FROM COURSE WHERE CourseCredits < 4;

OPEN Course_CursorUpdate;

FETCH NEXT FROM Course_CursorUpdate INTO @CID5,@CREDITS5;

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE COURSE SET CourseCredits = CourseCredits + 1
	WHERE CourseID = @CID5;

	FETCH NEXT FROM Course_CursorUpdate INTO @CID5,@CREDITS5;
END;

CLOSE Course_CursorUpdate;

DEALLOCATE Course_CursorUpdate;

--6. Create a Cursor to fetch Student Name with Course Name (Example: Raj Patel is enrolled in Database
--Management System)

	DECLARE @SNAME VARCHAR(100), @CNAME6 VARCHAR(100)

DECLARE Enroll_Cursor CURSOR FOR
SELECT S.StuName,C.CourseName FROM
STUDENT S JOIN ENROLLMENT E
ON S.StudentID = E.StudentID
JOIN COURSE C
ON E.CourseID = C.CourseID

OPEN Enroll_Cursor;

FETCH NEXT FROM Enroll_Cursor INTO @SNAME,@CNAME6;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @SNAME + ' is enrollend in ' + @CNAME6;

	FETCH NEXT FROM Enroll_Cursor INTO @SNAME,@CNAME6;
END;

CLOSE Enroll_Cursor;

DEALLOCATE Enroll_Cursor;

--7. Create a cursor to insert data into new table if student belong to ‘CSE’ department. (create new table
--CSEStudent with relevant columns)
	
	CREATE TABLE CSEStudent
	(
    StudentID INT,
    StuName VARCHAR(100),
    StuDepartment VARCHAR(50)
	)
	DECLARE @SID7 INT, @SNAME7 VARCHAR(100), @DEPT7 VARCHAR(50)

DECLARE CSE_Cursor CURSOR FOR
SELECT StudentID,StuName,StuDepartment FROM STUDENT
WHERE StuDepartment = 'CSE';

OPEN CSE_Cursor;

FETCH NEXT FROM CSE_Cursor INTO @SID7,@SNAME7,@DEPT7;

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO CSEStudent(StudentID,StuName,StuDepartment)
	VALUES (@SID7,@SNAME7,@DEPT7);

	FETCH NEXT FROM CSE_Cursor INTO @SID7,@SNAME7,@DEPT7;
END;

CLOSE CSE_Cursor;

DEALLOCATE CSE_Cursor;