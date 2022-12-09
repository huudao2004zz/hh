if exists (select * from sys.databases where name ='EmployeeDB')
drop database EmployeeDB
go
create database  EmployeeDB
go
use EmployeeDB
go
drop table Employee_table
create table Department_table(
   Departid int primary key identity,
   DepartName varchar(50)not null,
   Decription varchar(100) not null
   )
go
select * from Department_table
insert into Department_table(DepartName,Decription) values ('Depart1','Team Top')
insert into Department_table(DepartName,Decription) values ('Depart1','Team funny')
insert into Department_table(DepartName,Decription) values ('Depart1','Team lazy')
create table Employee_table(
   EmpCode char(6) primary key,
   DepartID  int
   CONSTRAINT hk FOREIGN KEY (DepartID) REFERENCES Department_table(Departid),
   FirstName varchar(30) not null,
   lastName varchar(30) not null,
   Birthday smalldatetime not null,
   Gender bit default(1),
   Address varchar(100),
   Salary money
   )
go
select * from Employee_table
 insert into Employee_table(EmpCode,DepartID,FirstName,lastName,Birthday,Gender,Address,Salary)
 values ('E001',1,'Tran','Shang','2000-12-31','1','HN','1000')
 insert into Employee_table(EmpCode,DepartID,FirstName,lastName,Birthday,Gender,Address,Salary)
 values ('E002',3,'Do','Bac','2019-12-01','0','HN','8000')
 insert into Employee_table(EmpCode,DepartID,FirstName,lastName,Birthday,Gender,Address,Salary)
 values ('E003',2,'Tran','Hieu','2008-12-08','1','HN','5000')
 insert into Employee_table(EmpCode,DepartID,FirstName,lastName,Birthday,Gender,Address,Salary)
 values ('E004',2,'Nguyen','Hien','2012-11-01','0','HN','5000')

--4--
update Employee_table set Salary = Salary + Salary * 0.1
--5--
Alter table Employee_table 
Add Check (Salary > 0)