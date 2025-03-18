Use CourierManagementSystem
-- User Table
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20),
    Address TEXT);

CREATE TABLE Courier (
    CourierID INT IDENTITY(1,1) PRIMARY KEY,
    SenderName VARCHAR(255) NOT NULL,
    SenderAddress TEXT NOT NULL,
    ReceiverName VARCHAR(255) NOT NULL,
    ReceiverAddress TEXT NOT NULL,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);

-- CourierServices Table
CREATE TABLE CourierServices (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);

CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);


CREATE TABLE Location (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);


CREATE TABLE Payment (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

INSERT INTO Users (Name, Email, Password, ContactNumber, Address)
VALUES 
('Prateek Jha', 'prateekjha62002@gmail.com', 'password123', '8591454453', '123 Main St, Pune'),
('Mihir Jha', 'mihirjha@gmail.com', 'securePass', '8692543435', '456 bangalore street, bangalore');

select * from Users

INSERT INTO Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES 
('Rahul Sharma', 'Bandra West, Mumbai', 'Priya Singh', 'Connaught Place, Delhi', 5.75, 'In Transit', 'TRK123456', '2025-03-01'),
('Ankit Mehta', 'MG Road, Bengaluru', 'Sneha Patil', 'Hitech City, Hyderabad', 10.50, 'Delivered', 'TRK654321', '2025-02-25');

select * from Courier

INSERT INTO CourierServices (ServiceName, Cost)
VALUES 
('Express Delivery', 150.00),
('Standard Delivery', 100.00);

select * from CourierServices

INSERT INTO Employee (Name, Email, ContactNumber, Role, Salary)
VALUES 
('Rohit Verma', 'rohit.v@gmail.com', '9988776655', 'Delivery Executive', 35000.00),
('Aisha Khan', 'aisha.k@gmail.com', '8899665544', 'Manager', 55000.00);

select * from Employee

INSERT INTO Location (LocationName, Address)
VALUES 
('Warehouse Mumbai', 'Andheri East, Mumbai'),
('Branch Pune', 'FC Road, Pune');

select * from Location

INSERT INTO Payment (CourierID, LocationID, Amount, PaymentDate)
VALUES 
(1, 1, 150.00, '2025-02-20'),
(2, 2, 100.00, '2025-03-05');

select * from Payment
