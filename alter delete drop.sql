
-- To create databse write DDL query/ statement
-- syntax 
create database TestDB1


select name from master.sys.databases

select * from master.sys.master_files

-- call store procedure to get list of databases

exec sp_databases

select name as DATABASE_Name,size as DATABASE_SIZE from master.sys.master_files

select name as DATABASE_Name from master.sys.master_files
select size as DATABASE_SIZE from master.sys.master_files

--Alter database with name

alter database TestDB1 modify name =MarchDB

--delete database from physical path

--drop database Testdb


-- test database exists at location before deletion


drop database If exists TestDB




