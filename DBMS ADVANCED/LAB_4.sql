--Part – A 
--1. Write a function to print "hello world". 
	create function fn_helloworld()
		returns varchar(20)
		as
		begin 
			return 'hello world'
		end
	select dbo.fn_helloworld()

--2. Write a function which returns addition of two numbers.
	create function fn_add_of_two_numbers(@num1 int ,@num2 int)
	returns int
	as
	begin
		declare @sum as int
		set @sum=0
		set @sum=@num1+@num2
		return @sum
	end
	select dbo.fn_add_of_two_numbers(10,12)

--3. Write a function to check whether the given number is ODD or EVEN.
	create function fn_odd_even(@num int)
	returns varchar(20)
	as
	begin
		if(@num%2=0)
			return 'even'

		return 'odd'
	end
select dbo.fn_odd_even(20)

--4. Write a function which returns a table with details of a person whose first name starts with B. 
	create function fn_name_start_b()
	returns table 
	as
	return (select * from Person where FirstName like 'b%')
select  * from fn_name_start_b()

--5. Write a function which returns a table with unique first names from the person table. 
	create or alter function fn_unqiuename()
	returns table
	as
	return (select distinct FirstName from Person)
select * from fn_unqiuename()
--6. Write a function to print number from 1 to N. (Using while loop)
	create or alter function fn_1ton(@n int)
	returns varchar(100)
	as
	begin
	declare @ans as varchar(100),@i as int
	set @ans=''
	set @i=1
	while(@i<=@n)
		begin
		set @ans=@ans+cast(@i as varchar)+' '
		set @i=@i+1;
		end
	return @ans
	end
select dbo.fn_1ton(10)

--7. Write a function to find the factorial of a given integer. 
	create or alter function fn_fact(@n int )
	returns int
	as
	begin
		declare @ans as int, @i as int
		set @ans=1
		set @i=1
		while(@i!=@n)
			begin
				set @ans=@ans*@i
				set @i=@i+1
			end
		return @ans
	end
select dbo.fn_fact(10)

--Part – B 
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
	create or alter function fn_compare_int(@n1 int,@n2 int)
	returns varchar(100) 
	as
	begin
		declare @result as varchar(20)
		set @result=case
					when @n1>@n2 then cast(@n1 as varchar)+' '+'is greater'
					when @n2>@n1 then cast(@n2 as varchar)+' '+'is greater'
					else 'both are equal'
					end
		return @result
	end
	select dbo.fn_compare_int(21,25)
--9. Write a function to print the sum of even numbers between 1 to 20. 
	create or alter function fn_sum_even(@n int )
	returns int
	as
	begin
		declare @ans as int, @i as int
		set @ans=0
		set @i=1
		while(@i!=@n+1)
			begin
				if(@i%2=0)
					set @ans=@ans+@i
				set @i=@i+1
			end
		return @ans
	end
select dbo.fn_sum_even(20)
--10. Write a function that checks if a given string is a palindrome
	create or alter function fn_palindrome_str(@str varchar(100))
	returns varchar(100)
	as
	begin
		declare @temp as varchar(100)
		set @temp=@str
		if(@str=REVERSE(@temp))
			return 'palindrome'
		return 'not palindrome'
	end
select dbo.fn_palindrome_str('khuhk')

--Part – C 
--11. Write a function to check whether a given number is prime or not. 
	create or alter function fn_prime(@n int)
	returns varchar(100)
	as
	begin
	declare @i as int
	declare @msg as varchar(100)
	set @msg='prime'
	set @i=2
	while(@i!=@n)
	begin
		if(@n%@i=0)
		begin
		set @msg='not prime'
		break;
		end
		set @i=@i+1
	end
	return @msg
	end
select dbo.fn_prime(10)
--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 
--13. Write a function which accepts two parameters year & month in integer and returns total days each year. 
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991. 