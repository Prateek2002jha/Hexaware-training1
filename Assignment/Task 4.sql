use CourierManagementSystem

--23. Retrieve Payments with Courier Information  
select
    p.PaymentID,
    p.Amount,
    p.PaymentDate,
    c.CourierID,
    c.SenderName,
    c.SenderAddress,
    c.ReceiverName,
    c.ReceiverAddress,
    c.Weight,
    c.Status,
    c.TrackingNumber,
    c.DeliveryDate
from
    Payment p
inner join
    Courier c ON p.CourierID = c.CourierID;

--24 Retrieve payments with location information
select
    p.PaymentID,
    p.Amount,
    p.PaymentDate,
    l.LocationID,
    l.LocationName,
    l.Address
from 
    Payment p
inner join
    Location l ON p.LocationID = l.LocationID;


--25. Retrieve Payments with Courier and Location Information
select
    p.PaymentID,
    p.Amount,
    p.PaymentDate,
    c.CourierID,
    c.SenderName,
    c.ReceiverName,
    l.LocationID,
    l.LocationName,
    l.Address
from 
    Payment p
inner join
    Courier c ON p.CourierID = c.CourierID
inner join 
    Location l ON p.LocationID = l.LocationID;

--26. List all payments with courier details
select 
    p.PaymentID,
    p.Amount,
    p.PaymentDate,
    c.SenderName,
    c.ReceiverName,
    c.TrackingNumber,
    c.Status
from 
    Payment p
inner join 
    Courier c ON p.CourierID = c.CourierID;


-- 27 . Total payments received for each courier
select
  c.CourierID,
  c.SenderName,
  sum(p.Amount) as TotalPayments
  from 
  Courier c
  left join
  Payment p on c.CourierID= p.CourierID
  group by
  c.CourierID , c.SenderName;

  --28 28. List payments made on a specific date
  select 
    p.PaymentID,
    p.Amount,
    p.PaymentDate,
    c.SenderName,
    c.ReceiverName
from
    Payment p
inner join
    Courier c ON p.CourierID = c.CourierID
where
    p.PaymentDate = '2025-03-05';  

	--29 29. Get Courier Information for Each Payment

	select
    p.PaymentID,
    p.Amount,
    p.PaymentDate,
    c.CourierID,
    c.SenderName,
    c.ReceiverName,
    c.TrackingNumber,
    c.Status
from
    Payment p
inner join
    Courier c ON p.CourierID = c.CourierID;


--30. Get Payment Details with Location

select 
    p.paymentid, p.amount, p.paymentdate, l.locationname, l.address
from 
    payment p
join 
    location l on p.locationid = l.locationid;

--31  Calculating Total Payments for Each Courier

select 
    c.courierid, c.sendername, sum(p.amount) as total_payment
from 
    courier c
join 
    payment p on c.courierid = p.courierid
group by 
    c.courierid, c.sendername;


--32 List Payments Within a Date Range

select 
    paymentid, amount, paymentdate
from 
    payment
where 
    paymentdate between '2025-01-01' and '2025-12-31';

--33. Retrieve a list of all users and their corresponding courier records, including cases
--where there are no matches on either side

select 
    u.userid, u.name, c.courierid, c.sendername, c.receivername
from 
    users u
left join 
    courier c on u.userid = c.courierid
union
select 
    u.userid, u.name, c.courierid, c.sendername, c.receivername
from 
    users u
right join 
    courier c on u.userid = c.courierid;



--34 Retrieve a list of all couriers and their corresponding services, 
--including cases where there are no matches on either side

select 
    c.courierid, c.sendername, cs.servicename, cs.cost
from 
    courier c
left join 
    courierservices cs on c.courierid = cs.serviceid
union
select 
    c.courierid, c.sendername, cs.servicename, cs.cost
from 
    courier c
right join 
    courierservices cs on c.courierid = cs.serviceid;


--35. Retrieve a list of all employees and their corresponding payments, 
--including cases where there are no matches on either side
select 
    e.employeeid, e.name, p.paymentid, p.amount
from 
    employee e
left join 
    payment p on e.employeeid = p.courierid
union
select 
    e.employeeid, e.name, p.paymentid, p.amount
from 
    employee e
right join 
    payment p on e.employeeid = p.courierid;


--36. List all users and all courier services, showing all possible combinations

select 
    u.name as username, cs.servicename
from 
    users u
cross join 
    courierservices cs;


--37. List all employees and all locations, showing all possible combinations
select 
    e.name as employeename, l.locationname
from 
    employee e
cross join 
    location l;

--38. Retrieve a list of couriers and their corresponding sender information (if available)
select 
    c.courierid, c.sendername, c.senderaddress
from 
    courier c
where 
    c.sendername is not null;


--39 39. Retrieve a list of couriers and their corresponding receiver information (if available)
select 
    c.courierid, c.receivername, c.receiveraddress
from 
    courier c
where 
    c.receivername is not null;


--40 40. Retrieve a list of couriers along with the courier service details (if available)
select 
    c.courierid, c.sendername, cs.servicename, cs.cost
from 
    courier c
left join 
    courierservices cs on c.courierid = cs.serviceid;


--41. Retrieve a list of employees and the number of couriers assigned to each employee

select 
    e.employeeid, e.name, count(c.courierid) as total_couriers
from 
    employee e
left join 
    courier c on e.employeeid = c.courierid
group by 
    e.employeeid, e.name;


--42. Retrieve a list of locations and the total payment amount received at each location
select 
    l.locationname, sum(p.amount) as total_payment
from 
    location l
left join 
    payment p on l.locationid = p.locationid
group by 
    l.locationname;


-- 43. Retrieve all couriers sent by the same sender (based on SenderName)
select 
    sendername, count(courierid) as total_couriers
from 
    courier
group by 
    sendername
having 
    count(courierid) >= 1;

--44. List all employees who share the same role
select 
    role, string_agg(name, ', ') as employees
from 
    employee
group by 
    role
having 
    count(employeeid) >= 1;

--45. Retrieve all payments made for couriers sent from the same location
select 
    l.locationname, sum(p.amount) as total_payment
from 
    payment p
join 
    location l on p.locationid = l.locationid
group by 
    l.locationname;


--46. Retrieve all couriers sent from the same location (based on SenderAddress)
select 
    senderaddress, count(courierid) as total_couriers
from 
    courier
group by 
    senderaddress
having 
    count(courierid) > 1; -- error 

--47 List employees and the number of couriers they have delivered
select 
    e.name, count(c.courierid) as delivered_count
from 
    employee e
left join 
    courier c on e.employeeid = c.courierid
group by 
    e.name;


--48. Find couriers that were paid an amount greater than the cost of 
--their respective courier services

select 
    c.courierid, c.sendername, p.amount, cs.cost
from 
    courier c
join 
    payment p on c.courierid = p.courierid
join 
    courierservices cs on c.courierid = cs.serviceid
where 
    p.amount > cs.cost;















