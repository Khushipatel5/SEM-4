CREATE TABLE Products ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
); 
--  Insert data into the Products table 
INSERT INTO Products (Product_id, Product_Name, Price) VALUES 
(1, 'Smartphone', 35000), 
(2, 'Laptop', 65000), 
(3, 'Headphones', 5500), 
(4, 'Television', 85000), 
(5, 'Gaming Console', 32000);

--Part - A 
--1. Create a cursor Product_Cursor to fetch all the rows from a products table. 
declare @Product_id int,@Product_Name varchar(250),@Price decimal(10,2)

declare Product_Cursor cursor
for select Product_id,Product_Name,Price from Products

Open Product_Cursor

Fetch next from Product_Cursor into 
@Product_id,@Product_Name,@Price

while @@FETCH_STATUS=0
	begin
	Print CAST(@Product_id as varchar)+'-'+@Product_Name+'-'+CAST(@Price as varchar);

	Fetch next from Product_Cursor into 
	@Product_id,@Product_Name,@Price
	end
close Product_Cursor
deallocate Product_Cursor
--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. 
--(Example: 1_Smartphone) 
declare @Product_id2 int,@Product_Name2 varchar(250)
declare Product_Cursor_Fetch Cursor
for 
select Product_id,Product_Name from Products

open Product_Cursor_Fetch

Fetch next from Product_Cursor_Fetch into 
@Product_id2,@Product_Name2

while  @@FETCH_STATUS=0
	begin
		print Cast(@Product_id2 as varchar)+'_'+@Product_Name2
		Fetch next from Product_Cursor_Fetch into 
		@Product_id2,@Product_Name2
	end
close Product_Cursor_Fetch
deallocate Product_Cursor_Fetch
--3. Create a Cursor to Find and Display Products Above Price 30,000.
declare @Product_Name3 varchar(250),@Price3 decimal(10,2)

declare Cursor_Price cursor
for 
select Product_Name,Price from products

open Cursor_Price

fetch next from Cursor_Price into 
@Product_Name3,@Price3

while @@FETCH_STATUS=0
	begin
	if(@Price3>30000)
		begin
		print(@Product_Name3)
		end
	fetch next from Cursor_Price into 
	@Product_Name3,@Price3
	end
close Cursor_Price
deallocate Cursor_Price
--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table. 
declare @Product_id4 int,@Product_Name4 varchar(250),@Price4 decimal(10,2)

declare Product_CursorDelete cursor
for 
select Product_id,Product_Name,Price from products

open Product_CursorDelete

fetch next from Product_CursorDelete into 
@Product_id4,@Product_Name4,@Price4

while @@FETCH_STATUS=0
	begin
	delete from Products where Product_id=@Product_id4

	fetch next from Product_CursorDelete into 
	@Product_id4,@Product_Name4,@Price4
	end
close Product_CursorDelete
deallocate Product_CursorDelete
--Part – B 
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases 
--the price by 10%. 
declare @Product_id5 int,@Product_Name5 varchar(250),@Price5 decimal(10,2),@Price_Updated decimal(10,2)

declare Product_CursorUpdate cursor
for 
select Product_id,Product_Name,Price from Products

open Product_CursorUpdate

fetch next from Product_CursorUpdate into 
@Product_id5,@Product_Name5,@Price5

while @@FETCH_STATUS=0
begin
	set @Price_Updated=@Price5+(0.1*@Price5)
	Print cast(@Product_id5 as varchar)+' '+@Product_Name5+' '+cast(@Price_Updated as varchar)
	fetch next from Product_CursorUpdate into 
	@Product_id5,@Product_Name5,@Price5
end
close Product_CursorUpdate
deallocate Product_CursorUpdate
--6. Create a Cursor to Rounds the price of each product to the nearest whole number. 
declare @Product_Name6 varchar(250),@Price6 decimal(10,2)

declare Product_Price_Round cursor
for 
select Product_Name,Price from Products

open Product_Price_Round 

fetch next from Product_Price_Round into 
@Product_Name6,@Price6

while @@FETCH_STATUS=0
begin
	print  @Product_Name6+' '+cast(round(@Price6,2) as varchar)
	fetch next from Product_Price_Round into 
	@Product_Name6,@Price6
end

close Product_Price_Round
deallocate Product_Price_Round

--Part – C 
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table) 

create table NewProducts(
	NewProduct_id INT PRIMARY KEY, 
	NewProduct_Name VARCHAR(250) NOT NULL, 
	NewPrice DECIMAL(10, 2) NOT NULL
); 


declare  @Product_id7 int,@Product_Name7 varchar(250),@Price7 decimal(10,2)

declare Product_Laptop cursor
for 
select Product_id,Product_Name,Price from Products where Product_Name='Laptop'

open Product_Laptop 

fetch next from Product_Laptop into 
@Product_id7,@Product_Name7,@Price7

while @@FETCH_STATUS=0
begin

	insert into NewProducts(NewProduct_id,NewProduct_Name,NewPrice)
	values(@Product_id7,@Product_Name7,@Price7)

	fetch next from Product_Laptop into 
	@Product_id7,@Product_Name7,@Price7
end

close Product_Laptop
deallocate Product_Laptop

select * from NewProducts

--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products 
--with a price above 50000 to an archive table, removing them from the original Products table.

create table ArchiveProducts(
	NewProduct_id INT PRIMARY KEY, 
	NewProduct_Name VARCHAR(250) NOT NULL, 
	NewPrice DECIMAL(10, 2) NOT NULL
); 

declare  @Product_id8 int,@Product_Name8 varchar(250),@Price8 decimal(10,2)

declare Product_Archive_High cursor
for 
select Product_id,Product_Name,Price from Products 

open Product_Archive_High 

fetch next from Product_Archive_High into 
@Product_id8,@Product_Name8,@Price8

while @@FETCH_STATUS=0
begin
	if(@Price8>50000)
	begin
		insert into ArchiveProducts(NewProduct_id,NewProduct_Name,NewPrice) values(@Product_id8,@Product_Name8,@Price8)
		delete from Products where Product_id=@Product_id8
	end
	

	fetch next from Product_Archive_High into 
	@Product_id8,@Product_Name8,@Price8
end

close Product_Archive_High
deallocate Product_Archive_High

select * from ArchiveProducts

select * from Products