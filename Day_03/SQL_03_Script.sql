# Pointing to the DB
use sql_batch;
# To know the curret DB
select database();
# To know the tables in DB
show tables;
# To view the structure of the Table
desc employee_table;

# Table Creation
create table Employee
(EmployeeID int,
FirstName varchar(255),
LastName varchar(255),
AddressLine varchar(255),
City varchar(255)
);
show tables;
desc Employee;
#DDL--->Create, Alter, Drop and Truncate
# Alter
alter table Employee add Email varchar(255);
desc employee;	
#DML--> Insert, Update and Delete
# Insert Records into A Table
# Insert  Specific Columns Data
insert into Employee(EmployeeID,FirstName,LastName,City) values(1,'santosh','sai','Chennai');
select * from Employee;
insert into Employee(EmployeeID,FirstName,LastName,AddressLine,City) values(2,'John','Patrick','kalapet','pondicherry');
select * from Employee;
#Insert All Columns Data
insert into Employee values(3,'Juhaina','Juhaina','HSR Layout','Bangalore','juhaina@indium.com');
select * from Employee;
insert into Employee values(4,'Aiswarya','Priyanka','T.Nagar','Chennai');
insert into Employee values(5,'Aiswarya','Priyanka','T.Nagar','Chennai','aiswarya@indium.com');
select * from Employee;
# Inserting Multiple Records
insert into Employee values(6,'Manohar','Reddy','JNTU','Hyderabad','Manohar@indium.com'),(7,'Nikilesh','Pavan','T.Nagar','Chennai','Nikil@indium.com');
select * from Employee;





