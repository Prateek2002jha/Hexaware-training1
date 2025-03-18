-- create table using given schema

Use MarchDB

create table Employee(
Id int,
name varchar(max),
mobilenumber bigint,
email varchar(max),
dob date,
license varchar(50),
passport varchar(max)
)


-- alter the table by adding or removing columns
-- add some columns

alter table Trainee Add email varchar(50) null
alter table Trainee alter column name 
--dlete column from table
alter table Trainee drop column email


-- alter table by adding primary key 

alter table Employee alter column Id int not null

alter table Employee add constraint PK_Id primary key(Id) 

create table EmployeeSalary(
salaryId int primary key not null

)
drop table EmployeeSalary




