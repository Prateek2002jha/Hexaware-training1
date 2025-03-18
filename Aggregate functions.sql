alter table employee add salary bigint null
select * from Employee 
update Employee set salary=25000 where id =102
update Employee set salary=26000where id =103
update Employee set salary=28000 where id =104
update Employee set salary=52000 where id =105
update Employee set salary=65000 where id =106
update Employee set salary=68000 where id=101
update Employee set salary=72000 where id=107
--Aggregate functions

select count(id) as No_Of_Employees from Employee

-- function for minimum
select min(salary) as Minimumm_Salary from Employee

-- function for maximum
select max(salary) as Maximum_Salary from Employee

-- function for avg 

select avg(salary) as Average_Salary from Employee

-- function for Summation 
select SUM(salary) as Total_Salary from Employee

SELECT Id, salary
FROM Employee
WHERE salary = (SELECT MIN(salary) FROM Employee);


--Grouping function and it only works with aggregate function

select * from employee

select count(name) as No_Of_Employees, license from Employee group by license

-- count no of employees using same licsnse whose salary is <=10000

select count(name) as No_Of_Employees, 
license, salary from Employee 
group by license, salary having salary <=30000

insert into Employee values(108,
'Pawan', 3503953535,'absds@gmail.com',
'2424-13-8','Lic564',
'pass7891',34000)

select sum(salary),license,salary
from Employee
group by license,salary having salary<=30000

select sum(salary) as total_salary,license ,name from employee
where name like 'v%' 
group by license ,salary
having salary <=30000