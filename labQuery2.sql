

create or alter procedure pr_insert
@studentid int,
@stuname varchar(100),
@stuemail varchar(100),
@stuphone varchar(20),
@studepartment varchar(10),
@studateofbirth date,
@stuenrollmentyear int

as 
begin
insert into STUDENT(studentid,stuname,stuemail,stuphone,studepartment,studateofbirth,stuenrollmentyear) values (@studentid,@stuname,@stuemail,@stuphone,@studepartment,@studateofbirth,@stuenrollmentyear)

end


exec pr_insert 10,'Harsh Parmar','harsh@univ.edu',9876543218,'CSE','2005-09-18',2023

exec pr_insert	20,'Om Patel','om@univ.edu',9876543211,'IT','2002-08-22',2022
 select * from STUDENT


 create or alter procedure pr_c_insert
 @COURSEID varchar(10),
 @COURSENAME varchar(100),
 @COURSECREDITS int,
 @COURSEDEPARTMENT varchar(50),
 @COURSESEMESTER int


as 
begin
insert into COURSE(COURSEID,COURSENAME ,COURSECREDITS,COURSEDEPARTMENT,COURSESEMESTER) values ( @COURSEID, @COURSENAME, @COURSECREDITS, @COURSEDEPARTMENT,@COURSESEMESTER)

end

exec pr_c_insert 'CS330','Computer Networks',4,'CSE',5
exec pr_c_insert 'EC120',	'Electronic Circuits',	3	,'ECE',	2
select * from COURSE


--3.	UPDATE Procedures: Create stored procedure SP_UPDATE_STUDENT to update Email and Phone in STUDENT table. (Update using studentID)

	
	create or alter procedure pr_S_UPDATE
	@StuEmail VARCHAR(100),
	@StuPhone VARCHAR(15),
	@StudentID INT

	AS
	BEGIN
	UPDATE STUDENT
	SET StuEmail=@StuEmail
	where StuPhone=@StuPhone

	end


exec pr_S_UPDATE 3,'XYZ@univ.edu','123456789'
select * from STUDENT



--4.	DELETE Procedures: Create stored procedure SP_DELETE_STUDENT to delete records from STUDENT where Student Name is Om Patel.

CREATE PROCEDURE SP_DELETE_STUDENT
    @Name VARCHAR(50)
AS
BEGIN
    DELETE FROM STUDENT
    WHERE StuName = @Name;
END

EXEC SP_DELETE_STUDENT 'Om Patel';
select * from STUDENT


--5.	SELECT BY PRIMARY KEY: Create stored procedures to select records by primary key (SP_SELECT_STUDENT_BY_ID) from Student table.

CREATE PROCEDURE SP_SELECT_STUDENT_BY_ID
    @StudentID INT
AS
BEGIN
    SELECT *
    FROM STUDENT
    WHERE StudentID = @StudentID;
END;

EXEC SP_SELECT_STUDENT_BY_ID 3
SELECT * FROM STUDENT
 

--6.	Create a stored procedure that shows details of the first 5 students ordered by EnrollmentYear.

	CREATE PROCEDURE SP_SELECT_TOP5_BY_ENROLLMENTYEAR
AS
BEGIN
    SELECT TOP 5 *
    FROM STUDENT
    ORDER BY StuEnrollmentYear;
END;

EXEC SP_SELECT_TOP5_BY_ENROLLMENTYEAR;


--PART=B

--7.	Create a stored procedure which displays faculty designation-wise count.


CREATE PROCEDURE SP_FACULTY_DESIGNATION_COUNT
AS
BEGIN
    SELECT 
        FACULTY,
        COUNT(*) AS TotalFaculty
    FROM FACULTY
    GROUP BY FACULTY;
END;

EXEC SP_FACULTY_DESIGNATION_COUNT;
