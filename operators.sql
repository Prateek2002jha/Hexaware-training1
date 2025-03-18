select * from Employee
insert into Employee values
('104','Prateek','8591454489','absd@gmail.com','9999-12-12','Lic389','psp821')
-- sort table according to the ID
select * from Employee order by Id asc

insert into Employee values
('105','Mihir','85914544454','absd@gmail.com','2999-12-12','Lic340','psp877')

insert into Employee values
('107','sakshi','859145444545','absd@gmail.com','2399-12-12','Lic3533','psp8766')

-- sort table according to the name
select * from Employee order by name asc

--- select record with id 101 and 102
select * from Employee where Id>=101 and id<=103
 -- in operator
select * from Employee where Id in(104,107)
-- between operator
select * from Employee where Id between 102 and 104
--- or operator
select * from Employee where Id =104 or Id=105

-- not operator
select * from Employee where id is not null


-- record for the starting letter A
select * from Employee where name like 'A%'

-- record for the starting letter s and ending letter i
select * from Employee where name like 's%i'

-- records for letter ending with i

select  * from Employee where name like '_i%'


-- records for letter at second last position
select * from Employee where name like '%i_'

select * from Employee where id is not null
select * from Employee order by Id asc offset 2 rows
fetch next 3 rows only

select Top 3 * from Employee


