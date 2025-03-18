Use MarchDB

-- add new record in table 
-- license and passport should be unique
insert into Employee ( Id, name, mobilenumber, email, dob, license, passport)
values(103,'Vijay',5968464,'abc@gmail.com','1999-12-12','Lic156','psp789')


-- retrieve all records from table

select Id, name, mobilenumber, email, dob, license, passport from Employee

select * from Employee

--filter records by id= 103

select * from Employee where Id = 103

--formatting result set 

select e.Id as Employe_ID,
e.name as Employee_Name,
e.mobilenumber as Employee_MobileNumber,
e.email as Employee_EmailID, 
e.dob as Employee_DOB, 
e.license asEmployee_license, 
e.passport as Employee_passport

from Employee e

delete from Employee where id = 104

select * from Employee