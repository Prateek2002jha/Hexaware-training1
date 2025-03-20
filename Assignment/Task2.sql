use CourierManagementSystem


--1. List all customers:  
select * from Users

--2. 2. List all orders for a specific customer:  
select * from Courier
where SenderName='Rahul Sharma';

--3 List all couriers
select * from Courier

--4. List all packages for a specific order:
select * from Courier
where CourierID ='10';

--5 List all deliveries for a specific courier:  
select* from Courier
where CourierId ='5';

--6		 List all undelivered packages:  
select * from Courier
where Status='Pending';

--7. List all packages that are scheduled for delivery today:
select * from Courier
where Status='Delivered'

--8. List all packages with a specific status:  
select * from Courier
where Status='In Transit';

--. Calculate the total number of packages for each courier.  
select SenderName,COUNT(*) AS TotalPackages
from Courier
Group by SenderName;

--10. Find the average delivery time for each courier  
select SenderName, AVG(DATEDIFF(day, DeliveryDate, GETDATE())) AS AvgDeliveryTime
from Courier
Group by SenderName;

--11. List all packages with a specific weight range:  

select * from Courier
where Weight<'10.00';

--12. Retrieve employees whose names contain 'Rohit'  
select * from Employee
where Name='Rohit Verma';


--13. Retrieve all courier records with payments greater than $50
select * from CourierServices
where Cost>50;