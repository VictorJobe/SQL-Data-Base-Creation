--This project means to show basic Database creation(DATABASE, TABLES,PRIMARY KEY AND CONSTRAINT) 

CREATE DATABASE SALES ;
GO

--THIS IS A DATABASE FOR A TRAVEL COMPANY

--NOW I'M GOING TO CREATE THE TABLES FOR THIS PROJECT

CREATE TABLE Clients (
	ClientID INT NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(50),
	Country VARCHAR(50),
	City VARCHAR(50),
	Street VARCHAR(50),
	AddressNumber INT,
	Email VARCHAR(50),
	Profession VARCHAR(50),
	Age INT,
	CONSTRAINT CHK_AGE CHECK(Age>18),
	CONSTRAINT CHK_AddressNumber CHECK(AddressNumber>0),
	CONSTRAINT UK_ClientID UNIQUE(ClientID),
	CONSTRAINT PK_ClientID PRIMARY KEY(ClientID)
)

CREATE TABLE Transportation (
    ID INT PRIMARY KEY,
    TransportationCategory INT NOT NULL,
    TransportationClass VARCHAR(20),
    CONSTRAINT CHK_TransportationCategory CHECK (TransportationCategory BETWEEN 1 AND 4),
    CONSTRAINT CHK_TransportationClass CHECK (TransportationClass IN ('First Class', 'Business Class', 'Economy Plus', 'Economy'))
);


CREATE TABLE Destiny(
	OrderID INT PRIMARY KEY NOT NULL,
	ClientID INT,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DestinyCountry VARCHAR(50) NOT NULL,
	DestinyCity VARCHAR(50) NOT NULL,
	TransportationCategory INT,
	TransportationClass VARCHAR(20),
	CONSTRAINT FK_ClientID FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
	CONSTRAINT UK_OrderID UNIQUE(OrderID)
	
	)

CREATE TABLE Employees(
EmployeeID INT NOT NULL,
Salary MONEY DEFAULT 7000,
Nationality VARCHAR(50) NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
HireDate datetime NOT NULL
PRIMARY KEY(EmployeeID)
)


CREATE TABLE ORDERS(
	OrderID INT PRIMARY KEY NOT NULL,
	ClientID INT NOT NULL,
	OrderDate datetime NOT NULL,
	EmployeeID INT NOT NULL,
	TransportationCategory INT,
	TransportationClass VARCHAR(20),
	Price FLOAT(20),
	FOREIGN KEY(TransportationCategory) REFERENCES Transportation(ID),
	FOREIGN KEY (ClientID) REFERENCES Clients(ClientID), 
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)

)

CREATE TABLE ClientsEvaluation (
--1 IS THE LOWEST RATE AND 5 IS THE HIGHST
	OrderID INT PRIMARY KEY NOT NULL,
	ClientID INT NOT NULL,
	TransportEvaluation INT NOT NULL,
	HotelEvaluation INT NOT NULL,
	FoodEvaluation INT NOT NULL,
	PriceEvaluation INT NOT NULL,
	OrderDate datetime NOT NULL,
	CHECK(TransportEvaluation BETWEEN 1 AND 5),
	CHECK(HotelEvaluation BETWEEN 1 AND 5),
	CHECK(FoodEvaluation BETWEEN 1 AND 5),
	CHECK(PriceEvaluation BETWEEN 1 AND 5)

)

--INSERTING VALUES IN THE TABLES

--TABLE Clients

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(1,'Victor Hugo','Fernandes Jobe',0545500125,'Israel','Rishon Letzion','Itzchak Valed',51,
'victorjobe@gmail.com','Mechanical Practical Engineering',32)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(2,'Lucas','Jobe',0521425874,'Israel','Haifa','HaGefen',12,'lucasjobe@gmail.com','Fullstack',31)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(3,'Liza','Swan',0504411236,'England','Tel Aviv','Dizengoff',23,'lSwan@gmail.com','English Teacher',26)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(4,'Anna','Schwartz',0547418528,'Germany','Tel Aviv','HaYarkon',48,'ann@schw@gmail.com','Lawyer',28)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(5,'Avi','Cohen',0521456987,'Israel','Jerusalem','Ben Yeuda',10,'Acohen@hotmail.com','Police',20)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(6,'Sara','Sharabi',0531592638,'Israel','Eilat','Bnei Yisrael',55,'SaSharabi@yahoo.com','Accounter',40)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(7,'Dominic','Rossi',0543219516,'Italy','Raanana','Ahuza',12,'DRossi@hotmail.com','Chemical Engineer',35)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(8,'Jason','Shapiro',0527895146,'England','Eilat','Hativat Hanegev',62,'JasonSh@piro@gmail.com','Hotel Manager',41)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(9,'Shiran','Rosenberg',0546689145,'Israel','Haifa','Herzl',15,'Shir@yahoo.com','Data Analyst',25)

INSERT INTO Clients(ClientID,FirstName,LastName,PhoneNumber,Country,City,Street,AddressNumber,Email,Profession,Age)
VALUES(10,'Sergio','Garcia',0520876139,'Spain','Jerusalem','Jaffo',47,'ser@gmail.com','Security Manager',30)

--inserting data in to the transportation table
INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(1,1,'First Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(2,1,'Business Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(3,1,'Economy Plus')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(4,1,'Economy')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(5,2,'First Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(6,3,'Business Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(7,2,'Business Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(8,2,'Economy Plus')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(9,2,'Economy')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(10,3,'First Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(11,3,'Economy Plus')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(12,3,'Economy')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(13,4,'First Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(14,4,'Business Class')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(15,4,'Economy Plus')

INSERT INTO Transportation(ID,TransportationCategory,TransportationClass)
VALUES(16,4,'Economy')

--INSERT DATA INTO THE DESTINY TALBE

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(1,1,'Victor Hugo','Fernandes Jobe','Brazil','Rio de Janeiro',3,'Business')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(2,2,'Lucas','Fernandes Jobe','Israel','Jerusalem',1,'First Class')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(3,3,'Liza','Swan','Israel','Haifa',2,'Economy')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(4,4,'Anna','Schwartz','Italy','Venice',4,'Economy Plus')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(5,5,'Avi','Cohen','Argentina','Bariloche',3,'First Class')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(6,6,'Sara','Sharabi','Israel','Haifa',2,'Business')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(7,7,'Dominic','Rossi','Italy','Rome',3,'Business')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(8,8,'Jason','Shapiro','Greece','Santorini',4,'First Class')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(9,9,'Shiran','Rosenberg','Portugal','Lisbon',3,'Economy')

INSERT INTO Destiny(OrderID,ClientID,FirstName,LastName,DestinyCountry,DestinyCity,TransportationCategory,TransportationClass)
VALUES(10,10,'Sergio','Garcia','Swedeen','Stockholm',3,'Economy')


--INSERTING VALUES INTO THE EMPLOYEES TABLE
INSERT INTO Employees(EmployeeID,Salary,Nationality,FirstName,LastName,PhoneNumber,City,HireDate)
VALUES(1,12000,'Israeli','Yossi','katz',0531245744,'Tel Aviv',2010-04-25)

INSERT INTO Employees(EmployeeID,Salary,Nationality,FirstName,LastName,PhoneNumber,City,HireDate)
VALUES(2,13000,'Israeli','Netanael','Petherson',0542145775,'Jerusalem',2005-06-20)

INSERT INTO Employees(EmployeeID,Salary,Nationality,FirstName,LastName,PhoneNumber,City,HireDate)
VALUES(3,12500,'Spanish','Diego','Marques',0520003417,'Tel Aviv',2010-06-25)

INSERT INTO Employees(EmployeeID,Salary,Nationality,FirstName,LastName,PhoneNumber,City,HireDate)
VALUES(4,12000,'French','Victor','Dreyfus',054412457,'Natanya',2015-06-15)

INSERT INTO Employees(EmployeeID,Salary,Nationality,FirstName,LastName,PhoneNumber,City,HireDate)
VALUES(5,15000,'Israeli','Ariel','Shabtai',053124571,'Tel Aviv',2000-01-12)

--Insert data into the ORDERS table
--(PRICE IN DOLLAR)
INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(1,1,2020-06-12,1,3,'Business',3000)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(2,2,2005-06-23,2,1,'First Class',3500)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(3,3,2010-06-27,3,2,'Economy',1000)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(4,4,2015-06-20,4,4,'Economy Plus',1500)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(5,5,2000-01-13,5,3,'First Class',3700)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(6,6,2020-06-13,1,2,'Business',3100)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(7,7,2005-06-24,2,3,'Business',3000)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(8,8,2010-06-28,3,4,'First Class',3700)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(9,9,2015-06-22,4,3,'Economy',600)

INSERT INTO Orders(OrderID,ClientID,OrderDate,EmployeeID,TransportationCategory,TransportationClass,Price)
VALUES(10,10,2000-01-13,5,3,'Economy',500)

--INSERT DATA INTO THE CLIENTSEVALUATION TABLE

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(1,1,4,5,4,4,2020-06-12)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(2,2,3,5,4,3,2005-06-23)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(3,3,4,5,3,5,201-06-27)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(4,4,2,4,4,3,2015-06-20)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(5,5,5,5,5,5,2000-01-13)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(6,6,5,5,5,5,2020-06-13)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(7,7,5,3,1,1,2005-06-24)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(8,8,1,2,3,1,2010-06-28)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(9,9,2,2,1,5,2015-06-22)

INSERT INTO ClientsEvaluation(OrderID,ClientID,TransportEvaluation,HotelEvaluation,FoodEvaluation,PriceEvaluation,OrderDate)
VALUES(10,10,4,3,5,5,200-01-13)

