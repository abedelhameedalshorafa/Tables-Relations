
-------- part 1 ---------

create table Customers(
CustomerID int primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
Email varchar(255),
PhoneNumber varchar(20),
City varchar(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, City)
VALUES
    (1, 'Abedelhameed', 'Alshorafa', 'abedalshorafa95@gmail.com', '+962-777848419', 'Irbid'),
    (2, 'khalid', 'khamaiseh', 'khalidkhamaiseh123@gmail.com', '+962-78566663', 'Dubai');

create table Orders (
    OrderID int primary key,
    OrderDate date,
    TotalAmount decimal(10, 2)
);

INSERT INTO Orders (OrderID, OrderDate, TotalAmount)
VALUES
    (101,'2023-01-15', 150.00),
    (102,'2023-01-16', 200.00);


create table Products (
    ProductID int primary key,
    ProductName varchar(100) NOT NULL,
    Category varchar(50),
    Price decimal(10, 2),
    InStock int
);

INSERT INTO Products (ProductID, ProductName, Category, Price, InStock)
VALUES
    (1, 'Laptop', 'Electronics', 999.99, 50),
    (2, 'Desk Chair', 'Furniture', 79.99, 100);

create table Employees (
    EmployeeID int primary key,
    FirstName varchar(30) NOT NULL,
    LastName varchar(30) NOT NULL,
    Email varchar(255),
    HireDate date,
    Salary decimal(12, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary)
VALUES
    (1, 'Alice', 'Johnson', 'alice.johnson@example.com', '2023-01-01', 60000.00),
    (2, 'Bob', 'Smith', 'bob.smith@example.com', '2023-02-01', 70000.00);

	select * from Customers;
	select * from Orders;
	select * from Products;
	select * from Employees;




----------- part 2  ---------

create table Departments (
    DepartmentID int primary key,
    DepartmentName varchar(50) NOT NULL
);

INSERT INTO Departments(DepartmentID,DepartmentName)
VALUES
	(1,'asp'),
	(2,'php'),
	(3,'flutter');


create table Users (
    UserID int primary key,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
	BirthDate date ,
	PhoneNumber varchar(20),
	NationalID int,
	Nationality varchar(30),
	MartialStatus varchar(25),
	HireDate date,
	Password varchar(50),
    Role varchar(20) NOT NULL CHECK (Role IN ('Manager', 'Employee')),
	DepartmentID int,
    foreign key (DepartmentID) references Departments(DepartmentID)
);

INSERT INTO Users(UserID,FirstName,LastName,BirthDate,PhoneNumber,NationalID,Nationality,MartialStatus,HireDate,Password,Role,DepartmentID)
VALUES
	(1,'Abedelhameed','Alshorafa','1998-11-23','+962-777848419',1,'Egypt','Single','2023-12-12','Abed1234','Manager',NULL),
	(2,'khalid','khamaiseh','1997-06-29','+962-785666663',1,'Jordan','Single','2023-12-12','Khalid1234','Employee',1),
	(3,'moath','jawabreh','1997-06-29','+962-785666663',1,'Jordan','Single','2023-12-12','moath1234','Employee',2);

--SELECT * FROM Users WHERE FirstName LIKE '%Abed%'; -- here for filtering  


create table Tasks (
    TaskID int primary key,
    Title varchar(100) NOT NULL,
    StartDate date,
    DueDate date,
    Description varchar(255),
    ImportanceLevel varchar(20) 
);

INSERT INTO Tasks (TaskID, Title, StartDate, DueDate, Description, ImportanceLevel)
VALUES 
	(1, 'Project Presentation', '2023-03-01', '2023-03-15', 'Prepare and deliver a project presentation', 'Low'),
	(2, 'Project Presentation', '2023-03-01', '2023-03-15', 'Prepare and deliver a project presentation', 'Medium'),
	(3, 'Project Presentation', '2023-03-01', '2023-03-15', 'Prepare and deliver a project presentation', 'High');

CREATE TABLE TasksUsers (
    TaskID INT,
    UserID INT,
    PRIMARY KEY (TaskID, UserID),
    FOREIGN KEY (TaskID) references Tasks(TaskID),
    FOREIGN KEY (UserID) references Users(UserID)
);

INSERT INTO TasksUsers (TaskID, UserID)
VALUES 
	(1, 2),
	(2, 2),
	(3, 2),
	(1, 3);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    SenderName VARCHAR(50) NOT NULL,
    SenderEmail VARCHAR(255) NOT NULL,
    Subject VARCHAR(100) NOT NULL,
    Message TEXT NOT NULL
);

INSERT INTO Feedback (FeedbackID,SenderName, SenderEmail, Subject, Message)
VALUES
    (1,'John Doe', 'john.doe@example.com', 'Website Feedback', 'Great website!'),
    (2,'Jane Smith', 'jane.smith@example.com', 'Bug Report', 'Found a bug on the site.');

	--- GET THE TASKS DEPEND ON USER ID
SELECT *
FROM Tasks
JOIN TasksUsers
ON Tasks.TaskID = TasksUsers.TaskID
WHERE TasksUsers.UserID = 3;

	--- GET THE USERS DEPEND ON TASK ID
SELECT *
FROM Users
JOIN TasksUsers
ON Users.UserID = TasksUsers.UserID
WHERE TasksUsers.TaskID = 1;