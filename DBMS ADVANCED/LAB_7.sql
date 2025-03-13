
-- Create the Customers table 
CREATE TABLE Customers ( 
Customer_id INT PRIMARY KEY,                 
Customer_Name VARCHAR(250) NOT NULL,         
Email VARCHAR(50) UNIQUE                     
); -- Create the Orders table 
CREATE TABLE Orders ( 
Order_id INT PRIMARY KEY,                    
Customer_id INT,                             
Order_date DATE NOT NULL,                    
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)  
);


--Part – A
--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
begin try
	declare @num1 int ,@num2 int,@ans int
	set @num1=10
	set @num2=0
	set @ans=@num1/@num2
end try
begin catch
	print('Divide by zero error')
end catch

--2. Try to convert string to integer and handle the error using try…catch block.
begin try
	declare @string varchar(100) 
	set @string='abc'
	set @string=cast(@string as int)
	print(@string)
end try
begin catch
	print('Cannot convert string to int')
end catch
--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle exception with all error functions if any one enters string value in numbers otherwise print result.
create or alter procedure pr_sum_two
@a varchar(10),@b varchar(10)
--@a int,@b int
as
begin
begin try
	declare @sum int
	set @a=cast(@a as int);
	set @b=cast(@b as int);
	set @sum=@a+@b
	print(@sum)
end try
begin catch
	print('string should not be added')
end catch
end
exec pr_sum_two 'a','2'
--4. Handle a Primary Key Violation while inserting data into customers table and print the error details such as the error message, error number, severity, and state.
begin try
	insert into Customers values(2,'Khushi','Khushi@gmail.com')
end try
begin catch
	print(Cast(Error_Number() as varchar(10)));
	print(Cast(Error_Severity() as varchar(10)));
	print(Cast(Error_State() as varchar(10)));
	print(Error_Message())
end catch
select * from Customers

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws Error like no Customer_id is available in database.
create procedure pr_customerid
@id int
as
begin 
	if not exists(select * from Customers where Customer_id=@id)
		throw 50001,'Customer id not available',1
	else
		--print(select * from Customers where Customer_id=@id)
		print('id exisits')
end
exec pr_customerid 10
--Part – B
--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error message.
begin try
	insert into Orders values(3,5,'2024-01-01')
end try
begin catch
	print(Cast(Error_Number() as varchar(10)));
	print(Cast(Error_Severity() as varchar(10)));
	print(Cast(Error_State() as varchar(10)));
	print(Error_Message())
end catch
select * from Orders

--7. Throw custom exception that throws error if the data is invalid.
create procedure pr_validinsertion
@id int
as
begin 
	if(@id<0 or (not exists(select * from Customers where Customer_id=@id)))
		throw 50002,'Customer id invalid',1;
	else
		print('Customer id is available')
end
exec pr_validinsertion -5
--8. Create a Procedure to Update Customer’s Email with Error Handling
create procedure pr_validemail
@email varchar(100),
@id int
as
begin 
	if(not exists(Select * from Customers where Customer_id=@id))
		throw 50003,'Customer id invalid',1;
	else
		Update Customers
		set Email=@email
		where Customer_id=@id
end
exec pr_validemail 'Kushi@gmail.com',1
select * from Customers
--Part – C
--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try anotherone”.
create or alter procedure pr_checkid
@name varchar(100),
@email varchar(100),
@id int
as
begin 
	if((not exists(select * from Customers where Customer_id=@id)))
			insert into Customers values(@id,@name,@email)

	else
			throw 50004,'The Customer_id is already taken. Try anotherone',1;

end
exec pr_checkid 'vanita','Vanita@gmail.com',4
--10. Handle Duplicate Email Insertion in Customers Table
create or alter procedure pr_duplicateemail
@name varchar(100),
@email varchar(100),
@id int
as
begin 
begin try
	if( exists(Select * from Customers where Email=@email))
		throw 50008,'Duplicate Email is not allowed',1;
	else
		insert into Customers values(@id,@name,@email)
end try
begin catch
	print(Cast(Error_Message() as varchar))
end catch
end


exec pr_duplicateemail 'Dharvi','Vanita@gmail.com',7



select * from Customers
delete from customers where Customer_id=5
select * from Customers