use sql_batch;
#show database;
show tables;
desc employee;
select * from employee;
# Adding Multiple Coulmns with the specified locations
alter table Employee add Designation varchar(100) not null after EmployeeID, add Exp int not null after city;
desc Employee;
# Modify the Column with Alter NULL --> NOT NULL
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
# Update the Value in the Column.
update Emp 
set city = 'Chennai'
where employeeid=2;
select * from Emp;
update Emp 
set city = 'Chennai'
where Fname ='Manohar';
select * from Emp;
desc Emp;

# Task Note: SET SQL_SAFE_UPDATES = 0;
# Alternate Solution
show columns from Emp;
desc Emp;
# Task--> show columns vs desc
#Update Multiple Columns
update Emp
set Email= 'patrick@indium.com',qual='M.Tech' 
where EmployeeID = 2;
select * from Emp;
# scenario-->Indium Employee to Uber Project--->change the Email Indium-->Uber.
#update to Replace string.
update Emp
set Email = replace(Email,'Nikil@indium.com','ext.Nikil@uber.com')
where EmployeeID = 7;
select * from Emp;
# delete DML
delete from Emp
where EmployeeID = 7;
select * from Emp;
rollback;
select * from Emp;
#savepoint
start transaction;
savepoint sp1;
delete from Emp where EmployeeID = 6;
savepoint sp2;
delete from Emp where EmployeeID = 5;
select * from Emp;
rollback to sp2;
select * from Emp;
rollback to sp1;
select * from Emp;
# Delete All Records
start transaction;
savepoint sp3;
delete from Emp;
select * from Emp;
rollback to sp3;
select * from Emp;
# Delete and Limit Usage
start transaction;
savepoint sp4;
delete from Emp order by FName limit 3;
select * from Emp;
rollback to sp4;
select * from Emp;
# Various Select statements
select * from Emp; # Selection of all the Columns
select city from Emp; # Projection
select EmployeeID,Exp,City from Emp;
select * from Emp;
# Task update Designation, Exp, Email, Qual




















