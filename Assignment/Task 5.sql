use CourierManagementSystem

--49. Find couriers that have a weight greater than the average weight of all couriers:
select 
    courierid, sendername, weight
from 
    courier
where 
    weight > (select avg(weight) from courier);


-- 50  Find the names of all employees who have a salary greater than the average salary:
select 
    name, salary
from 
    employee
where 
    salary > (select avg(salary) from employee);


--51. Find the total cost of all courier services where the cost is less than the maximum cost:
select 
    sum(cost) as TotalCost
from 
    courierservices
where 
    cost < (select max(cost) from courierservices);

--52  Find all couriers that have been paid for:
select 
    c.courierid, c.sendername, p.amount
from 
    courier c
join 
    payment p on c.courierid = p.courierid;

--53. Find the locations where the maximum payment amount was made:
select 
    l.locationname, p.amount
from 
    location l
join 
    payment p on l.locationid = p.locationid
where 
    p.amount = (select max(amount) from payment);

--54. Find all couriers whose weight is greater than the weight of all couriers 
--sent by a specific sender (e.g., 'SenderName'):
select 
    courierid, sendername, weight
from 
    courier
where 
    weight > all (select weight from courier where sendername = 'SenderName');





