--Area Services/Servicios Area 
USE master;
GO
IF DB_ID(N'Area Services')IS NOT NULL
DROP DATABASE AreaServices;
GO
CREATE DATABASE AreaServices
ON
(NAME = AreaServices_dat,
FILENAME= 'C:\BaseDatos\AreaServices.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON
(NAME =AreaServices_log,
FILENAME = 'C:\BaseDatos\AreaServices.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE AreaServices;
GO

-----tables/Tablas----
--User/Usuario
CREATE TABLE [User] 
(
    idUser INT PRIMARY KEY IDENTITY(1,1),
    userName varchar(50) unique NOT NULL,
    name varchar(50) NOT NULL,
    password varchar(10) NOT NULL,
    email varchar(100) NOT NULL,
    status bit default 1 NOT NULL,
    idUserCreate int,
    creationDate date,
    idUserModify int,
    modifiedDate date,
);
--LLaves Foraneas User--
ALTER TABLE [User]
ADD CONSTRAINT FK_UserUserCreate 
FOREIGN KEY (idUserCreate) 
REFERENCES [User] (idUser);
ALTER TABLE [User]
ADD CONSTRAINT FK_UserUserModified 
FOREIGN KEY (idUserModify) 
REFERENCES [User] (idUser);
--Estas las utilize para agregar una clave de retriccion unica a idUserCreate y idUserModify
ALTER TABLE [User]
ADD CONSTRAINT UQ_idUserCreate UNIQUE (idUserCreate);
ALTER TABLE [User]
ADD CONSTRAINT UQ_idUserModify UNIQUE (idUserModify);
--Insert User--
INSERT INTO [User] (UserName, name, password, email, idUserCreate, creationDate)
VALUES ('Max619', 'Max Ramos', '64679702', 'ramosalex@gmail.com', 1, '2023-12-08');

Select * From  [User]



--AreaType/TipoArea
CREATE TABLE AreaType 
(
idAreaType INT PRIMARY KEY IDENTITY(1,1), 
nameArea varchar(255),
descriptionAreaType varchar(255),
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date,
)
--LLaves foraneas AreaType--
ALTER TABLE AreaType
ADD CONSTRAINT Fk_AreaTypeUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE AreaType
ADD CONSTRAINT Fk_AreaTypeUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert AreaType--
INSERT INTO AreaType(nameArea, descriptionAreaType,status,idUserCreate, creationDate)
VALUES ('Taller de Maquinas y herramientas','Equipo de maquinas y herramientas incluidas', 1,1,'2023-12-08');

Select * From AreaType

DELETE FROM AreaType
WHERE idAreaType = 1;



--Building/Edificio
CREATE TABLE Building 
(
idBuilding INT PRIMARY KEY IDENTITY(1,1), 
number int,
descriptionBuilding varchar(255),
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
) 
--LLaves foraneas Building--
ALTER TABLE Building
ADD CONSTRAINT Fk_BuildingUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE AreaType
ADD CONSTRAINT Fk_BuildingUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert Building--
INSERT INTO Building (number, descriptionBuilding, status,idUserCreate, creationDate)
VALUES
(1,'Edificio 1', 1,1,'2023-12-08')
SELECT * FROM Building


CREATE TABLE Career 
(
idCareer INT PRIMARY KEY IDENTITY(1,1), 
careerName varchar(50) ,
descriptionCareer varchar(255), 
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas Career--
ALTER TABLE Career
ADD CONSTRAINT Fk_CareerUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE Career
ADD CONSTRAINT Fk_CareerUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);
--Insert Career--
INSERT INTO Career (careerName, descriptionCareer, status,idUserCreate, creationDate)
VALUES
('INFORMATICA', 'Ingenieria en Informatica',1,1,'2023-12-08');

SELECT * FROM Career


--EmployeeType/TipoEmpleado
CREATE TABLE EmployeeType 
(
idEmployeeType INT PRIMARY KEY IDENTITY(1,1),
nameEmployeeType varchar(50),
baseSalary decimal,
hoursEmployeeType time,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas Career--
ALTER TABLE EmployeeType
ADD CONSTRAINT Fk_EmployeeTypeUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE EmployeeType
ADD CONSTRAINT Fk_EmployeeTypeUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);
--Insert EmployeeType--
INSERT INTO EmployeeType (nameEmployeeType, baseSalary, hoursEmployeeType, status, idUserCreate, creationDate)
VALUES ('DOCENTE', 1000.00, '08:00:00', 1, 1,'2023-12-08');

SELECT * FROM EmployeeType



--StudyPlan/PlanEstudio
CREATE TABLE StudyPlan
(
idStudyPlan INT PRIMARY KEY IDENTITY(1,1),
nameStudyPlan varchar(50),
code int,
duration time,
credits int,
idcareer int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)

--LLaves foraneas StudyPlan--
ALTER TABLE StudyPlan
ADD CONSTRAINT Fk_StudyPlanUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE StudyPlan
ADD CONSTRAINT Fk_StudyPlanModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

ALTER TABLE StudyPlan
ADD CONSTRAINT Fk_StudyPlanCareer
FOREIGN KEY (idCareer) REFERENCES Career(idCareer);

INSERT INTO StudyPlan (nameStudyPlan,code,duration,credits,idcareer,status, idUserCreate, creationDate)
VALUES ('Ingenieria',100,'08:00:00',241,1,1,1,'2023-12-08');

SELECT * FROM StudyPlan



--Course/Materia
CREATE TABLE Course 
(
idCourse INT PRIMARY KEY IDENTITY(1,1),
nameCourse varchar(50), 
credit int ,
code int, 
idCareer int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas Course--
ALTER TABLE Course
ADD CONSTRAINT Fk_CourseUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE Course
ADD CONSTRAINT Fk_CourseModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

ALTER TABLE Course
ADD CONSTRAINT Fk_CourseCareer
FOREIGN KEY (idCareer) REFERENCES Career(idCareer);
--Insert Course--
INSERT INTO Course (nameCourse,credit,code,idCareer,status, idUserCreate, creationDate)
VALUES ('Ingenieria',100,241,1,1,1,'2023-12-08');

SELECT * FROM Course



--Class/Clase
CREATE TABLE Class
(
idClass INT PRIMARY KEY IDENTITY(1,1),
nameClass varchar(50), 
descriptionClass varchar(255),
idCourse int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas Class--
ALTER TABLE Class
ADD CONSTRAINT Fk_ClassUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE Class
ADD CONSTRAINT Fk_ClassUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

ALTER TABLE Class
ADD CONSTRAINT Fk_ClassCourse
FOREIGN KEY (idCourse) REFERENCES Course(idCourse);
--Insert Class--
INSERT INTO Class (nameClass, descriptionClass,idCourse,status,idUserCreate, creationDate)
VALUES
(1,'Algebra Lineal', 'Es una clase de matematicas',1,1,1,'2023-12-08')

SELECT * FROM Class


--ClassDetail/DetalleClase
CREATE TABLE ClassDetail 
(
idClassDetail  INT PRIMARY KEY IDENTITY(1,1),
startTime Time , 
endTime Time, 
dateClassDetail date, 
quantityStudent int,
idClass int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas--
ALTER TABLE ClassDetail
ADD CONSTRAINT Fk_ClassDetailClass
FOREIGN KEY (idClass) REFERENCES Class(idClass);

ALTER TABLE ClassDetail
ADD CONSTRAINT Fk_ClassDetailUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE ClassDetail
ADD CONSTRAINT Fk_ClassDetailUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert ClassDetail--
INSERT INTO ClassDetail (startTime, endTime, dateClassDetail, quantityStudent, idClass, status,idUserCreate,creationDate)
VALUES
(1,'08:00:00', '10:00:00', '2023-12-08',25, 1, 1,1,'2023-12-08');

SELECT * FROM ClassDetail



--Area/Area
CREATE TABLE Area 
(
idArea INT PRIMARY KEY IDENTITY(1,1), 
nameArea varchar(255), 
number int, 
descriptionArea varchar(255),
idAreaType int not null, 
idBuilding int not null, 
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas de Area--
ALTER TABLE Area
ADD CONSTRAINT Fk_AreaAreaType
FOREIGN KEY (idAreaType) REFERENCES AreaType(idAreaType);

ALTER TABLE Area
ADD CONSTRAINT Fk_AreaBuilding
FOREIGN KEY (idBuilding) REFERENCES Building(idBuilding);

ALTER TABLE Area
ADD CONSTRAINT Fk_AreaUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE Area
ADD CONSTRAINT Fk_AreaUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert Area --
INSERT INTO Area (nameArea, number, descriptionArea, idAreaType, idBuilding,status,idUserCreate,creationDate)
VALUES
('Área 1', 101, 'Esta es el área 1',1,1,1,1,'2023-12-08');

Select * From Area



--BookCatalog/CatalogoLibro
CREATE TABLE BookCatalog 
(
idBookCatalog INT PRIMARY KEY IDENTITY(1,1),
bookTitle varchar(50), 
authorName varchar(50), 
publisher varchar(50),
inStock int not null,
idArea int not null,
idCourse int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas BookCatalog--
ALTER TABLE BookCatalog
ADD CONSTRAINT Fk_BookCatalogArea
FOREIGN KEY (idArea) REFERENCES Area(idArea);

ALTER TABLE BookCatalog
ADD CONSTRAINT Fk_BookCatalogCourse
FOREIGN KEY (idCourse) REFERENCES Course(idCourse);

ALTER TABLE BookCatalog
ADD CONSTRAINT Fk_BookCatalogUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE BookCatalog
ADD CONSTRAINT Fk_BookCatalogUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);
--Insert BookCatalog--
INSERT INTO BookCatalog (bookTitle, authorName, publisher, inStock, idArea, idCourse, status,idUserCreate,creationDate)
VALUES
('Libro 1', 'Autor 1', 'Editorial 1', 10, 1, 1, 1,1,'2023-12-08')

SELECT * FROM BookCatalog



--ToolCatalog/CatalogoHerramienta
CREATE TABLE ToolCatalog
(
idToolCatalog INT PRIMARY KEY IDENTITY(1,1),
nameToolCatalog varchar(50), 
brand varchar(50),
model varchar(50),
quantityExistence int,
descriptionToolCatalog varchar(50), 
idArea int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas ToolCatalog--
ALTER TABLE ToolCatalog
ADD CONSTRAINT Fk_Area
FOREIGN KEY (idArea) REFERENCES Area(idArea);

ALTER TABLE ToolCatalog
ADD CONSTRAINT Fk_ToolCatalogUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE ToolCatalog
ADD CONSTRAINT Fk_ToolCatalogUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);
--Insert ToolCatalog--
INSERT INTO ToolCatalog (nameToolCatalog, brand, model, quantityExistence, descriptionToolCatalog, idArea, status,idUserCreate,creationDate)
VALUES
('Herramienta 1', 'Marca 1', 'Modelo 1', 10, 'Descripción de Herramienta 1', 1, 1,1,'2023-12-08')

SELECT * FROM ToolCatalog



--Employee/Empleado
CREATE TABLE Employee
( 
idEmployee  INT PRIMARY KEY IDENTITY(1,1),
nameEmployee varchar(50),
lastNameEmployee varchar(50),
salary decimal,
nss int,
zipCode int,
rfc varchar(13),
numberPhone varchar(13),
email varchar(50),
addressEmployee varchar(255),
idEmployeeType int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas Employee--
ALTER TABLE Employee
ADD CONSTRAINT Fk_EmployeeType
FOREIGN KEY (idEmployeeType) REFERENCES EmployeeType(idEmployeeType);

ALTER TABLE Employee
ADD CONSTRAINT Fk_EmployeeUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE Employee
ADD CONSTRAINT Fk_EmployeeUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert Employee--
INSERT INTO Employee (idEmployee, nameEmployee,lastNameEmployee,salary,nss,zipCode,rfc,numberPhone, email, addressEmployee, idEmployeeType, status,idUserCreate,creationDate)
VALUES
(1, 'Max', 'Ramos', 'Duran', '123456789', 'email1@example.com', 'Mexico', 1, 1);


INSERT INTO Employee (nameEmployee, lastNameEmployee, salary, nss, zipCode, rfc, numberPhone, email, addressEmployee, idEmployeeType, idUserCreate, creationDate)
VALUES ('Max', 'Duran', 2500.00, 1234567890, 12345, 'ABC123456DEF', '123-456-7890', 'ramosalex0202@gmail.com', 'Col. Barrera Privada Virginia 705', 1, 1,'2023-12-08');

SELECT * FROM Employee




--Student/Estudiante
CREATE TABLE Student
(
idStudent  INT PRIMARY KEY IDENTITY(1,1),
nameStudent varchar(50),
lastNameStudent varchar(50),
registrationNumber int,
rfc varchar(13),
curp varchar(18),
nss int,
addressStudent varchar(255),
email varchar(50), 
numberPhone varchar(13),
idStudyPlan int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas--
ALTER TABLE Student
ADD CONSTRAINT Fk_StudenStudyPlan
FOREIGN KEY (idStudyPlan) REFERENCES StudyPlan(idStudyPlan);

ALTER TABLE Student
ADD CONSTRAINT Fk_StudentUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE Student
ADD CONSTRAINT Fk_StudentUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert Student--
INSERT INTO Student (nameStudent, lastNameStudent, registrationNumber, rfc, curp, nss, addressStudent, email, numberPhone, idStudyPlan, status,idUserCreate,creationDate)
VALUES
('Juan', 'González', 255, 'RADA022353', '654698', 123, 'Ciudad A', 'juan@email.com', '1234567890', 1, 1,1,'2023-12-08');

SELECT * FROM Student



--Authorization/Autorizacion
CREATE TABLE Authorization_ 
(
idAuthorization INT PRIMARY KEY IDENTITY(1,1),
authorizationDate date,
descriptionAuthorization  varchar(255),
idEmployee int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas Authorization_--
ALTER TABLE Authorization_
ADD CONSTRAINT Fk_Authorization_Employee
FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

ALTER TABLE Authorization_
ADD CONSTRAINT Fk_Authorization_UserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE Authorization_
ADD CONSTRAINT Fk_Authorization_UserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert Authorization--
INSERT INTO Authorization_ (authorizationDate, descriptionAuthorization, idEmployee, status,idUserCreate,creationDate)
VALUES
('2023-10-23', 'Primera autorización',1,1,1,'2023-12-08');

Select * from Authorization_



--AreaAplication/SolicitudArea
CREATE TABLE AreaAplication
(
idAreaAplication INT PRIMARY KEY IDENTITY(1,1),
dateArea date,
descriptionAreaAplication varchar(255),
idArea int not null, 
idEmployee int not null, 
idClass int not null,
idAuthorization int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas AreaAplication--
ALTER TABLE AreaAplication
ADD CONSTRAINT Fk_AreaAplicationArea
FOREIGN KEY (idArea) REFERENCES Area(idArea);

ALTER TABLE AreaAplication
ADD CONSTRAINT Fk_AreaAplicationEmployee
FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

ALTER TABLE AreaAplication
ADD CONSTRAINT Fk_AreaAplicationClass
FOREIGN KEY (idClass) REFERENCES Class(idClass);

ALTER TABLE AreaAplication
ADD CONSTRAINT Fk_AreaAplicationAuthorization
FOREIGN KEY (idAuthorization) REFERENCES Authorization_(idAuthorization);

ALTER TABLE AreaAplication
ADD CONSTRAINT Fk_AreaAplicationUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE AreaAplication
ADD CONSTRAINT Fk_AreaAplicationUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert AreaAplication--
INSERT INTO AreaAplication (dateArea, descriptionAreaAplication, idArea, idEmployee, idClass, idAuthorization, status,idUserCreate,creationDate)
VALUES
('2023-10-23', 'Primera aplicación', 1, 1, 1, 1, 1,1,'2023-12-08');

SELECT * FROM AreaAplication



--LoanAplication/SolicitudPestamo
CREATE TABLE LoanAplication
(
idLoanAplication  INT PRIMARY KEY IDENTITY(1,1),
numberLoan int ,
descriptionLoanAplication varchar(50),
deliveryDate datetime,
departureDate datetime,
quantity int ,
idBookCatalog int,
idStudent int not null,
idAuthorization int not null,
idEmployee int not null,
idToolCatalog int,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--Llaves foraneas LoanAplication
ALTER TABLE LoanAplication
ADD CONSTRAINT Fk_LoanAplicationArea
FOREIGN KEY (idBookCatalog) REFERENCES BookCatalog(idBookCatalog);

ALTER TABLE LoanAplication
ADD CONSTRAINT Fk_LoanAplicationStudent
FOREIGN KEY (idStudent) REFERENCES Student(idStudent);

ALTER TABLE LoanAplication
ADD CONSTRAINT Fk_LoanAplicationAuthorization
FOREIGN KEY (idAuthorization) REFERENCES Authorization_(idAuthorization);

ALTER TABLE LoanAplication
ADD CONSTRAINT Fk_LoanAplicationEmployee
FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

ALTER TABLE LoanAplication
ADD CONSTRAINT Fk_ToolCatalog
FOREIGN KEY (idToolCatalog) REFERENCES ToolCatalog(idToolCatalog);

ALTER TABLE LoanAplication
ADD CONSTRAINT Fk_LoanAplicationUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE LoanAplication
ADD CONSTRAINT Fk_LoanAplicationUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert LoanAplication--
INSERT INTO LoanAplication (numberLoan, descriptionLoanAplication, deliveryDate, departureDate, quantity, idBookCatalog, idStudent, idAuthorization, idEmployee, idToolCatalog, status,idUserCreate,creationDate)
VALUES
(1, 'Préstamo 1', '2023-10-23 09:00:00', '2023-10-25 17:00:00', 1,1,1,1,1,1,1,1,'2023-12-08');

SELECT * FROM LoanAplication



--LoanAplicationBookCatalog/SolicitudPrestamoCatalogoLibro
CREATE TABLE LoanAplicationBookCatalog 
(
idLoanAplicationBookCatalog INT PRIMARY KEY IDENTITY(1,1), 
idLoanAplication  int not null,  
idBookCatalog  int not null, 
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas LoanAplicationBookCatalog--
ALTER TABLE LoanAplicationBookCatalog
ADD CONSTRAINT Fk_LoanAplication
FOREIGN KEY (idLoanAplication) REFERENCES LoanAplication(idLoanAplication);

ALTER TABLE LoanAplicationBookCatalog
ADD CONSTRAINT Fk_BookCatalog
FOREIGN KEY (idBookCatalog) REFERENCES BookCatalog(idBookCatalog);

ALTER TABLE LoanAplicationBookCatalog
ADD CONSTRAINT Fk_LoanAplicationBookCatalogUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE LoanAplicationBookCatalog
ADD CONSTRAINT Fk_LoanAplicationBookCatalogUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--Insert LoanAplicationBookCatalog--
INSERT INTO LoanAplicationBookCatalog (idLoanAplication, idBookCatalog, status,idUserCreate,creationDate)
VALUES
(1, 1, 1, 1,'2023-12-08')

SELECT * FROM LoanAplicationBookCatalog


--LoanAplicationToolCatalog/SolicitudPrestamoHerramienta
CREATE TABLE LoanAplicationToolCatalog 
(
idLoanAplicationToolCatalog INT PRIMARY KEY IDENTITY(1,1),
idLoanAplication int not null, 
idToolCatalog int not null,
status bit default 1,
idUserCreate int,
creationDate date,
idUserModify int,
modifiedDate date
)
--LLaves foraneas LoanAplicationToolCatalog--
ALTER TABLE LoanAplicationToolCatalog
ADD CONSTRAINT Fk_LoanAplication
FOREIGN KEY (idLoanAplication) REFERENCES LoanAplication(idLoanAplication);

ALTER TABLE LoanAplicationToolCatalog
ADD CONSTRAINT Fk_ToolCatalog
FOREIGN KEY (idToolCatalog) REFERENCES ToolCatalog(idToolCatalog);

ALTER TABLE LoanAplicationToolCatalog
ADD CONSTRAINT Fk_LoanAplicationToolCatalogUserCreate
FOREIGN KEY (idUserCreate) REFERENCES [User](idUserCreate);

ALTER TABLE LoanAplicationToolCatalog
ADD CONSTRAINT Fk_LoanAplicationToolCatalogUserModify
FOREIGN KEY (idUserModify) REFERENCES [User](idUserModify);

--insert LoanAplicationToolCatalog--
INSERT INTO LoanAplicationToolCatalog (idLoanAplication, idToolCatalog, status,idUserCreate,creationDate)
VALUES
(1, 1, 1, 1,'2023-12-08');

SELECT * FROM LoanAplicationToolCatalog