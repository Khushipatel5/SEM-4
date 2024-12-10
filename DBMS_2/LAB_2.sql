CREATE TABLE Department ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE Designation ( 
DesignationID INT PRIMARY KEY, 
DesignationName VARCHAR(100) NOT NULL UNIQUE 
); 

CREATE TABLE Person ( 
PersonID INT PRIMARY KEY IDENTITY(101,1), 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8, 2) NOT NULL, 
JoiningDate DATETIME NOT NULL, 
DepartmentID INT NULL, 
DesignationID INT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID), 
FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID) 
);



--Part – A 
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures. 

--DESIGNATION INSERT
create or alter procedure PR_Designation_Insert
	@DesignationID int,
	@DesignationName VARCHAR(100)
AS
BEGIN
	insert into Designation (DesignationID,DesignationName)
	values(@DesignationID,@DesignationName)
END
select * from Designation
exec PR_Designation_Insert 11,'Jobber'
exec PR_Designation_Insert 12,'Welder'
exec PR_Designation_Insert 13,'Clerk'
exec PR_Designation_Insert 14,'Manager'
exec PR_Designation_Insert 15,'CEO'

--DEPARTMENT INSERT
Alter procedure PR_Department_Insert
	@DepartmentID int,
	@DepartmentName VARCHAR(100)
AS
BEGIN
	insert into Department(DepartmentID,DepartmentName)
	values(@DepartmentID,@DepartmentName)
END

exec PR_Department_Insert 1,'Admin'
exec PR_Department_Insert 2,'IT'
exec PR_Department_Insert 3,'HR'
exec PR_Department_Insert 4,'Account'

select * from Department




--INSERT PERSON
create procedure PR_Person_Insert
	@FirstName varchar(100),
	@LastName VARCHAR(100) , 
	@Salary DECIMAL(8, 2), 
	@JoiningDate DATETIME , 
	@DepartmentID INT , 
	@DesignationID INT 
AS
BEGIN
 INSERT into Person (FirstName,LastName,Salary,JoiningDate,DepartmentID,DesignationID)
 values(@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID)
END

exec PR_Person_Insert 'Rahul','Anshu','56000','1990-01-01',1,12
exec PR_Person_Insert 'Hardik','Hinsu','18000','1990-09-25',2,11
exec PR_Person_Insert 'Bhavin','Kamani','25000','1991-05-22',NULL,11
exec PR_Person_Insert 'Bhoomi','Patel','39000','2014-02-20',1,13
exec PR_Person_Insert 'Rohit','Rajgor','17000','1990-07-23',2,15
exec PR_Person_Insert 'Priya','Mehta','25000','1990-10-18',2,NULL
exec PR_Person_Insert 'Neha','Trivedi','18000','2014-02-20',3,15

select * from Person

--Designation Update
Create procedure PR_Designation_Update
	@DesignationID int,
	@DesignationName VARCHAR(100)
AS
BEGIN
	update Designation 
	set DesignationName=@DesignationName
	where DesignationID=@DesignationID
END


--Department update
Create procedure PR_Department_Update
	@DepartmentID int,
	@DepartmentName VARCHAR(100)
AS
BEGIN
	update Department 
	set DepartmentName=@DepartmentName
	where DepartmentID=@DepartmentID
END

--PErson update
Create procedure PR_Person_Update
	@PersonID int,
	@FirstName VARCHAR(100)
AS
BEGIN
	update Person 
	set FirstName=@FirstName
	where PersonID=@PersonID
END


--delete Designation

Create procedure PR_Designation_Delete
	@DesignationID int
AS
BEGIN
	delete from Designation 
	where DesignationID=@DesignationID
END

exec PR_Designation_Delete 14
--delete department
Create procedure PR_Department_Delete
	@DepartmentID int
AS
BEGIN
	delete from Department 
	where DepartmentID=@DepartmentID
END
exec PR_Department_Delete 4

--delete person
Create procedure PR_Person_Delete
	@PersonID int
AS
BEGIN
	delete from Person 
	where PersonID=@PersonID
END

exec PR_Person_Delete 5
--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY 
------department------
create  or alter procedure PR_DEPT_SELECT 
@deptid int
as
begin 
	select * from Department
	where DepartmentID=@deptid;
end

----person----
create or alter  procedure PR_PERSON_SELECT
@personid int
as 
begin
	select * from person 
	where PersonID=@personid;
end

------designation----
create or alter  procedure PR_Designation_SELECT
@designationid int
as 
begin
	select * from Designation 
	where DesignationID=@designationid;
end

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take 
--columns on select list) 
create procedure PR_dept_per_desig_select
@personid int
as
begin
select * from person join Department on person.DepartmentID=Department.DepartmentID join Designation on Person.DesignationID=Designation.DesignationID where PersonID=@personid;
end
exec PR_dept_per_desig_select 101
--4. Create a Procedure that shows details of the first 3 persons. 
create procedure PR_PERSON_TOP3
as 
begin
	select top 3* from person;
end

exec PR_PERSON_TOP3



-----------PART B---------------
--5. Create a Procedure that takes the department name as input and returns a table with all workers working in that department. 
create or alter procedure PR_dept_workerlist
@departmentname varchar(100)
as 
begin
select * from Person
where DepartmentID=(select departmentID from Department where DepartmentName=@departmentname) 
end
exec PR_dept_workerlist admin


--6. Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name. 
create procedure pr_person_dept_desig_name
	@designationname varchar(100),
	@departmentname varchar (100)
	as
	begin
		select person.FirstName,person.Salary,person.JoiningDate,Department.DepartmentName
		from person join Department
		on Person.DepartmentID=Department.DepartmentID
		join Designation 
		on Person.DesignationID=Designation.DesignationID
		where DepartmentName=@departmentname and DesignationName=@designationname
	end

	exec pr_person_dept_desig_name 'clerk','admin'


--7. Create a Procedure that takes the first name as an input parameter and display all the details of the worker with their department & designation name.
create procedure pr_person_firstname
	@firstname varchar(100)
	as
	begin
		select * from person join Department
		on Person.DepartmentID=Department.DepartmentID
		join Designation 
		on Person.DesignationID=Designation.DesignationID
		where Person.FirstName=@firstname;
	end
	exec pr_person_firstname 'rahul'


--8. Create Procedure which displays department wise maximum, minimum & total salaries.

create or alter procedure pr_min_max_avg_dept
	as	
	begin
		select departmentid,max(salary) as 'max', min(salary) as 'min', sum (salary) as 'total' from person group by departmentid;
	end

	exec pr_min_max_avg_dept

--9. Create Procedure which displays designation wise average & total salaries. 
create  or alter procedure pr_person_avg_total_designaionwise
	as
	begin
		select designationid,sum(salary)as total,avg(salary)as average from person group by DesignationID
	end

	exec pr_person_avg_total_designaionwise

------------PART C-------------
--10. Create Procedure that Accepts Department Name and Returns Person Count. 
create or alter procedure pr_department_personcount
	@departmentname varchar(100)
	as
	begin
		select count(personid) from department join person
		on Person.DepartmentID=Department.DepartmentID
		where DepartmentName=@departmentname;
	end 

	exec pr_department_personcount 'admin'


--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than input salary value along with their department and designation details. 
create procedure pr_person_salary 
	@salary int
	as
	begin
		select department.DepartmentName,Designation.DesignationName,Person.Salary 
		from Person join Department
		on Department.DepartmentID=Person.DepartmentID
		join Designation
		on Designation.DesignationID=Person.DesignationID
		where Person.Salary>@salary
	end
	exec pr_person_salary 15000


--12. Create a procedure to find the department(s) with the highest total salary among all departments. 
create procedure pr_person_maxtotalsalary
	as 
	begin
		SELECT DepartmentName
		FROM person
		JOIN department ON person.DepartmentID = department.DepartmentID
		GROUP BY DepartmentName
		HAVING SUM(Salary) = (
			SELECT TOP 1 SUM(Salary)
			FROM person
			GROUP BY DepartmentID
			ORDER BY SUM(Salary) DESC )
	end 
--13. Create a procedure that takes a designation name as input and returns a list of all workers under that designation who joined within the last 10 years, along with their department. 
create or alter procedure pr_designation_10year
	@designationname varchar(100)
	as
	begin 
		select Person.FirstName,Departmentname from 
		person join Designation
		on Person.DesignationID=Designation.DesignationID
		join Department
		on Department.DepartmentID=Person.DepartmentID
		where DATEDIFF(year,JoiningDate,getdate())<10 and DesignationName=@designationname;
	end
	exec pr_designation_10year 'Welder'

--14. Create a procedure to list the number of workers in each department who do not have a designation assigned.
create or alter procedure pr_person_have_no_designation
as
begin
	select Department.DepartmentName, count(person.PersonID) as count_worker from 
	person join department on 
	Person.DepartmentID=Department.DepartmentID 
	where person.DesignationID is null
	group by Department.DepartmentName
end
exec pr_person_have_no_designation

--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 12000. 
create or alter procedure pr_salary_avg12000
as 
begin
	select DepartmentName, 
        AVG(Salary) AS avg_salary, 
        person.DepartmentID ,Department.DepartmentName, 
        AVG(person.Salary) AS avg_salary, 
        person.DepartmentID from
	person join Department 
	on Person.DepartmentID=Department.DepartmentID
	group by person.DepartmentID,Department.DepartmentName
	having avg(Salary)>12000
end
exec pr_salary_avg12000 


