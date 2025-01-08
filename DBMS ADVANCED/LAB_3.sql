CREATE TABLE Departments ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
ManagerID INT NOT NULL, 
Location VARCHAR(100) NOT NULL 
);
CREATE TABLE Employee ( 
EmployeeID INT PRIMARY KEY, 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
DoB DATETIME NOT NULL, 
Gender VARCHAR(50) NOT NULL, 
HireDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
Salary DECIMAL(10, 2) NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 
CREATE TABLE Projects ( 
ProjectID INT PRIMARY KEY, 
ProjectName VARCHAR(100) NOT NULL, 
StartDate DATETIME NOT NULL, 
EndDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location) 
VALUES  
(1, 'IT', 101, 'New York'), 
(2, 'HR', 102, 'San Francisco'), 
(3, 'Finance', 103, 'Los Angeles'), 
(4, 'Admin', 104, 'Chicago'), 
(5, 'Marketing', 105, 'Miami'); 
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID, 
Salary) 
VALUES  
(101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00), 
(102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00), 
(103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00), 
(104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00), 
(105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00); 
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) 
VALUES  
(201, 'Project Alpha', '2022-01-01', '2022-12-31', 1), 
(202, 'Project Beta', '2023-03-15', '2024-03-14', 2), 
(203, 'Project Gamma', '2021-06-01', '2022-05-31', 3), 
(204, 'Project Delta', '2020-10-10', '2021-10-09', 4), 
(205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);

select * from Employee
select * from Departments
select * from Projects
--Part – A 
--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based 
--on this you must give EmployeeID, DOB, Gender & Hiredate.  
create or alter procedure pr_Employee_first_last_name
	@name varchar(100)
	as
	begin
		select Employee.EmployeeID,employee.DoB,Employee.Gender,Employee.HireDate from Employee where
		Employee.FirstName=@name or Employee.LastName=@name;
	end
exec pr_Employee_first_last_name 'John'

--2. Create a Procedure that will accept Department Name and based on that gives employees list who 
--belongs to that department.  
create  procedure pr_departments_employeelist
@departmentname varchar(100)
	as
	begin
		select * from employee join Departments on Employee.DepartmentID=Departments.DepartmentID where Departments.DepartmentName=@departmentname
	end
exec pr_departments_employeelist 'admin'

--3.  Create a Procedure that accepts Project Name & Department Name and based on that you must give 
--all the project related details. 
create procedure pr_projectdepartmentname_projectdetails
	@projectname varchar(100),
	@deparmentname varchar(100)
	as
	begin
		select * from Projects join Departments on Projects.DepartmentID=Departments.DepartmentID where DepartmentName=@deparmentname and ProjectName=@projectname;
	end
exec pr_projectdepartmentname_projectdetails 'Project Alpha','IT'

--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those 
--employee list comes in output.  
create or alter procedure pr_integer_salarybetween
	@min int,
	@max int
	as
	begin
		select * from Employee where salary  between @min and @max;
	end
exec pr_integer_salarybetween 50000,82000

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date.
create procedure pr_date_employee_hired
	@date date
	as
	begin
		select * from Employee where HireDate=@date
	end
exec pr_date_employee_hired '2010-06-15'
--Part – B 
--6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be 
--served.  
create or alter procedure pr_gender_employeedetails
	@gender varchar(10)
	as
	begin
	select * from employee where gender like @gender+'%'
	end
exec pr_gender_employeedetails 'm'
--7. Create a Procedure that accepts First Name or Department Name as input and based on that employee 
--data will come.  
create or alter procedure pr_first_department_employeedetails
	@firstname varchar(100)
	as
	begin
		select * from Employee join Departments 
		on Employee.DepartmentID=Departments.DepartmentID
		where Employee.FirstName=@firstname or Departments.DepartmentName=@firstname
	end
exec pr_first_department_employeedetails 'John'
exec pr_first_department_employeedetails 'admin'

--8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will 
--get all the departments with all data.
create procedure pr_location_employeedetails
	@location varchar(10)
	as
	begin
		select * from Employee join Departments
		on Employee.DepartmentID=Departments.DepartmentID
		where Departments.Location like '%'+@location+'%'
	end
exec pr_location_employeedetails'a'
--Part – C 
--9. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project 
--related data.
create procedure pr_fromdate_todate_projectdetails
	@fromdate date,
	@todate date
	as
	begin
		select * from Projects where StartDate=@fromdate and EndDate=@todate
	end
exec pr_fromdate_todate_projectdetails '2022-01-01','2022-12-31'
--10. Create a procedure in which user will enter project name & location and based on that you must 
--provide all data with Department Name, Manager Name with Project Name & Starting Ending Dates. 
create  or alter procedure pr_projectname_location_detials
	@projectname varchar(100),
	@location varchar(100)
	as
	begin
		select Departments.DepartmentName,employee.FirstName as managername,Projects.ProjectName,projects.StartDate,Projects.EndDate 
		from Projects join Departments
		on Projects.DepartmentID=Departments.DepartmentID
		join Employee
		on Employee.EmployeeID=Departments.ManagerID
	end
exec pr_projectname_location_detials 'project gamma','Los angeles'