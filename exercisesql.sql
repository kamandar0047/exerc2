CREATE DATABASE HOTEL
USE HOTEL

CREATE TABLE Manager(
Id int identity primary key,
Name nvarchar(50)
)

ALTER TABLE Manager
ADD ReservecionId int foreign key references  Reservecion(Id)

CREATE TABLE Reservecion (
Id int identity primary key

)
 ALTER TABLE Reservecion 
 ADD CustomersId int foreign key references Customers(Id)

CREATE TABLE Customer(
Id int identity primary key,
Name nvarchar(50),
Surname nvarchar(50),
Age int)
 

ALTER TABLE Customer
ADD SpendingId  int foreign key references Spending(Id)  

ALTER TABLE Customer
ADD PaymentsId int foreign key references Payments(Id)
 
 ALTER TABLE Customer 
 ADD RoomsId int foreign key references  Rooms(Id)

CREATE TABLE Spending(

Id int identity primary key,
howmuch int

)

CREATE TABLE Payments(

Id int identity primary key,
howmuch int

)
CREATE TABLE Rooms(
Id int identity primary key,
Name nvarchar(50)
)
CREATE TABLE RoomsType(
Id int identity primary key,

)
ALTER TABLE RoomsType
ADD RoomsId int foreign key references Rooms(Id)  




CREATE VIEW get_meetingdetail AS
SELECT 
cs.Age 'Customers Age',
cs.Name 'Customers Name',
cs.Surname 'Customers Surname',
cs.PaymentsId 'Customers Payments',
cs.RoomsId 'Customers Rooms',
cs.SpendingId 'Customers Spending'

FROM Customers cs
JOIN RoomsType rt
ON rt.RoomsId=cs.RoomsId
JOIN Payments p
ON cs.PaymentsId=p.Id
JOIN Spending s
ON cs.SpendingId=s.Id

JOIN Reservecion re
ON re.CustomersId=cs.Id
 JOIN Manager m
 ON m.ReservecionId=re.Id


SELECT * FROM get_meetingdetail



CREATE PROCEDURE GetCustomersWithAge @age int =50
AS
SELECT*FROM Customer 
WHERE Age>@age

EXEC GetCustomersWithAge @age=51