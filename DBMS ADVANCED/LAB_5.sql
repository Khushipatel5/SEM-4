-- Creating PersonInfo Table 
CREATE TABLE PersonInfo ( 
PersonID INT PRIMARY KEY, 
PersonName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8,2) NOT NULL, 
JoiningDate DATETIME NULL, 
City VARCHAR(100) NOT NULL, 
Age INT NULL, 
BirthDate DATETIME NOT NULL 
); 

-- Creating PersonLog Table 
CREATE TABLE PersonLog ( 
PLogID INT PRIMARY KEY IDENTITY(1,1), 
PersonID INT NOT NULL, 
PersonName VARCHAR(250) NOT NULL, 
Operation VARCHAR(50) NOT NULL, 
UpdateDate DATETIME NOT NULL, 
);

--Part – A 
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display 
--a message “Record is Affected.” 
create trigger tr_operation
on PersonInfo
after insert,update,delete
as
begin
	print('RECORD IS AFFECTED')
end

insert into PersonInfo values(1,'ABC',35000,GETDATE(),'Jamnagar',18,'2005-12-2')
drop trigger tr_operation
--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog. 
create trigger tr_after_insert
on PersonInfo
after insert
as
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	select @PersonId = PersonID from inserted;
	select @PersonName = PersonName from inserted;
	insert into PersonLog values(@PersonId,@PersonName,'INSERT',GETDATE())
end
drop trigger tr_after_insert
insert into PersonInfo values(3,'khushi',35000,GETDATE(),'Jamnagar',18,'2005-12-7')
select * from PersonInfo
select * from PersonLog

create trigger tr_after_update
on PersonInfo
after update
as
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	select @PersonId = PersonID from inserted;
	select @PersonName = PersonName from inserted;
	insert into PersonLog values(@PersonId,@PersonName,'UPDATE',GETDATE())
end
update PersonInfo
set PersonName='KHUSHI'
where PersonID=2
drop trigger tr_after_update
select * from PersonInfo
select * from PersonLog

create trigger tr_after_delete
on PersonInfo
after delete
as
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	select @PersonId = PersonID from deleted;
	select @PersonName = PersonName from deleted;
	insert into PersonLog values(@PersonId,@PersonName,'DELETE',GETDATE())
end
drop trigger tr_after_delete

select * from PersonInfo
delete from PersonInfo where PersonID=1
--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo 
--table. For that, log all operations performed on the person table into PersonLog. 
create trigger tr_insteadof_insert
on PersonInfo
instead of insert
as
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	select @PersonId = PersonID from inserted;
	select @PersonName = PersonName from inserted;
	insert into PersonLog values(@PersonId,@PersonName,'INSERT',GETDATE())
end
drop trigger tr_insteadof_insert
select * from PersonInfo
select * from PersonLog

create trigger tr_insteadof_delete
on PersonInfo
instead of delete
as
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	select @PersonId = PersonID from deleted;
	select @PersonName = PersonName from deleted;
	insert into PersonLog values(@PersonId,@PersonName,'DELETE',GETDATE())
end
delete from PersonInfo where PersonID=2
drop trigger tr_insteadof_delete
select * from PersonInfo
select * from PersonLog

create trigger tr_insteadof_update
on PersonInfo
instead of update
as
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	select @PersonId = PersonID from inserted;
	select @PersonName = PersonName from inserted;
	insert into PersonLog values(@PersonId,@PersonName,'UPDATE',GETDATE())
end
update PersonInfo set PersonName='khuhi' where PersonID=2
drop trigger tr_insteadof_update
select * from PersonInfo
select * from PersonLog

--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into uppercase whenever the record is inserted. 
create trigger tr_name_uppercase
on PersonInfo
after insert 
as 
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	select @PersonId = PersonID from inserted;
	select @PersonName=PersonName from inserted
	set @PersonName=upper(@PersonName)
	update PersonInfo 
	set PersonName=@PersonName
	where PersonID=@PersonId
	insert into PersonLog values(@PersonId,@PersonName,'Insertupper',GETDATE())
end
drop trigger tr_name_uppercase
insert into PersonInfo values(5,'vanita',35000,GETDATE(),'Jamnagar',19,'2005-12-8')

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table. 
create trigger tr_duplicate_prevent
on personInfo
instead of insert
as
begin
insert into personInfo(PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
select PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate from inserted 
where PersonName not in (Select PersonName from PersonInfo)
end
insert into PersonInfo values(6,'vanita',35000,GETDATE(),'Jamnagar',19,'2005-12-8')

--6. Create trigger that prevent Age below 18 years.

create trigger tr_age_below18
on PersonInfo
instead of insert
as
begin
	declare @PersonId int;
	declare @PersonName varchar(50);
	declare @age int;
	select @age =age from inserted
	select @PersonId = PersonID from inserted;
	select @PersonName = PersonName from inserted;
	if(@age>18)
		insert into PersonLog values(@PersonId,@PersonName,'INSERT',GETDATE())
	else
		print('AGE IS BELOW 18!!');
end
drop trigger tr_age_below18