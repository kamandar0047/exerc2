CREATE DATABASE HOSPITAL
USE HOSPITAL


CREATE TABLE Pasients(

Id int identity primary key,
Name nvarchar(50),
Surname nvarchar(50),
Age int 
)

CREATE TABLE Doctor(
Id int identity primary key,
Name nvarchar(50),
Surname nvarchar(50),
Age int,
Department nvarchar(50),
Salary decimal

)
ALTER TABLE Doctor
ADD DEPARTMENTId int foreign key references DEPARTMENT(Id)  

CREATE TABLE Departments(
Id int identity primary key,
Name nvarchar(50)
)
CREATE TABLE Dises(
Id int identity primary key,
Name nvarchar(50)
) 

CREATE TABLE Meetings(
Id int identity primary key,

Date datetime,

Price decimal,
IsHealed bit,
DiseaseId int
)
ALTER TABLE Meetings
ADD DoctorId int foreign key references Doctor(Id)  

ALTER TABLE Meetings
ADD PasientsId int foreign key references Pasients(Id) 

ALTER TABLE Meetings
ADD DisesId int foreign key references Dises(Id) 

ALTER TABLE Meetings
ADD RoomId int foreign key references Room(Id) 

CREATE TABLE Room(
Id int identity primary key,
Name nvarchar(50)

)


ALTER TABLE Room
ADD RoomTypeId int foreign key references RoomTypes(Id)  

CREATE TABLE RoomType(
	Id int identity primary key,
	Name nvarchar(50)
)





CREATE VIEW get_meetingdetail AS
SELECT 
m.Date,
d.Name as 'Doctor Name',
d.Surname as 'Doctor Surname',
p.Name as 'Patience Name',
ds.Name as 'Diases',
r.Name as 'Room Name',
rt.Name as'Room Type',
m.IsHealed as'Is Healed',
m.Price as 'Price'
FROM Meeting m
JOIN Rooms r
ON m.RoomsId=r.Id
JOIN Doctor d
ON m.DoctorsId=d.Id
JOIN Pasient p
ON m.PasientId=p.Id
JOIN Dises ds
ON m.DIESESId=ds.Id
JOIN  RoomTypes rt 
ON rt.Id=r.RoomTypeId
SELECT * FROM get_meetingdetail



  CREATE PROCEDURE GetMeeting
  AS
SELECT *FROM student

EXEC GetAllStudent 

CREATE PROCEDURE GetStudentPoint @point int=50, @name=nvarchar(50)
AS
SELECT *FROM student 


EXEC GetMeeting @point=50