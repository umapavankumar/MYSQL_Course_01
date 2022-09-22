use demo1;
create table Employee
(EmployeeID int,
FirstName varchar(255),
LastName varchar(255),
AddressLine varchar(255),
City varchar(255)
);

# Alter
alter table Employee add Email varchar(255);
desc employee;

# Insert  Specific Columns Data
insert into Employee(EmployeeID,FirstName,LastName,City) values(1,'santosh','sai','Chennai');
select * from Employee;
insert into Employee(EmployeeID,FirstName,LastName,AddressLine,City) values(2,'John','Patrick','kalapet','pondicherry');
select * from Employee;
#Insert All Columns Data
insert into Employee values(3,'Juhaina','Juhaina','HSR Layout','Bangalore','juhaina@indium.com');
select * from Employee;
insert into Employee values(4,'Manohar','Reddy','JNTU','Hyderabad','Manohar@indium.com'),(5,'Nikilesh','Pavan','T.Nagar','Chennai','Nikil@indium.com');
select * from Employee;
desc Employee;
alter table Employee add Designation varchar(100) not null after EmployeeID, add Exp int not null after city;
desc Employee;
alter table Employee add Qual varchar(10);
# Modify the Column with Alter
desc Employee;
alter table Employee modify FirstName varchar(255) NOT NULL;
desc Employee;
# Column Elimination
alter table Employee drop column LastName;
desc Employee;

# Column Rename
alter table Employee change column FirstName Fname varchar(255);
desc Employee;

# Table Rename
alter table Employee rename to Emp;
desc Employee;
desc Emp;
select * from Emp;
update Emp 
set city = 'Chennai'
where employeeid=2;
update  Emp 
set city = 'Chennai'
where Fname ='Manohar';

SET SQL_SAFE_UPDATES = 0;

desc Emp;
alter table Emp modify EmployeeID int primary key;
select database();
show columns from Emp;
desc Emp;