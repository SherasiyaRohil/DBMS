

--Part – A
--1.
--Create trigger for blocking student deletion.
 Create or alter trigger Blocking_Stuent
 on student
 instead of delete
 as
 begin
 print 'You can not Delete Student'
 end

 delete from STUDENT
 Where StudentID=1

 drop trigger Blocking_Stuent
--2.
--Create trigger for making course read-only.
	Go
	create or alter trigger CcourseReadonly
	on course
	instead of insert,update,delete
	as 
	begin
		print'you can only read the data'
	end

	select * from COURSE

	delete from COURSE
	WHERE CourseCredits =4

	Drop trigger courseReadonly

--3.
--Create trigger for preventing faculty removal.
	Go
	create or alter trigger faculty_removal
	on faculty
	instead of delete
	as
	begin
		print'you can not delete faculty'
	end
	select* from FACULTY

	delete from FACULTY
	where FacultyID=104

	drop trigger faculty_removal
--4.
--Create instead of trigger to log all operations on COURSE (INSERT/UPDATE/DELETE) into Log table. (Example: INSERT/UPDATE/DELETE operations are blocked for you in course table)
	create or alter trigger AllOperatinonCourse
	on course
	instead of insert,update,delete
	as
	begin
		insert into Log values('INSERT/UPDATE/DELETE operation are blocked for you in course table',getdate())
	end

	delete from COURSE
	where CourseCredits=4

	select * from Log
	select * from COURSE

--5.
--Create trigger to Block student to update their enrollment year and print message ‘students are not allowed to update their enrollment year’
	create or alter trigger Block_student
	on student
	instead of update
	as
	begin
		if update(StuEnrollmentYear)
			begin
				print('student are not allowed to update their enrollment year')
			end
	end

	drop trigger Block_student

	select * from STUDENT

--6.
--Create trigger for student age validation (Min 18).
create or alter trigger Block_student

	