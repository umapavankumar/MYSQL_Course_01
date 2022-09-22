use demo1;
create table Employee
(EmployeeID int,
FirstName varchar(255),
LastName varchar(255),
AddressLine varchar(255),
City varchar(255)
);
alter table Employee add Email varchar(255);
insert into Employee(EmployeeID,FirstName,LastName,City) values(1,'santosh','sai','Chennai');
insert into Employee(EmployeeID,FirstName,LastName,AddressLine,City) values(2,'John','Patrick','kalapet','pondicherry');
insert into Employee(EmployeeID,FirstName,LastName,AddressLine,City,Email) values(3,'Juhaina','Juhaina','HSR Layout','Bangalore','juhaina@indium.com');
insert into Employee (EmployeeID,FirstName,LastName,AddressLine,City,Email)values(5,'Aiswarya','Priyanka','T.Nagar','Chennai','aiswarya@indium.com');
insert into Employee(EmployeeID,FirstName,LastName,AddressLine,City,Email) values(6,'Manohar','Reddy','JNTU','Hyderabad','Manohar@indium.com'),(7,'Nikilesh','Pavan','T.Nagar','Chennai','Nikil@indium.com');
desc Employee;
alter table Employee add qual varchar(10);
desc Employee;
select * from Employee;
update employee
set Email='santosh@indium.com'
where EmployeeID = 1;
select * from employee;
#Update Multiple Columns
update employee
set Email= 'patrick@indium.com',qual='M.Tech' 
where EmployeeID = 2;
select * from Employee;
#update to Replace string.
update employee
set Email = replace(Email,'Nikil@indium.com','ext.Nikil@uber.com')
where EmployeeID = 7;
delete from Employee
where EmployeeID = 7;
rollback; # nor working

start transaction;
savepoint sp1;
delete from Employee where EmployeeID = 6;
savepoint sp2;
delete from Employee where EmployeeID = 5;
select * from Employee;
rollback to sp2;
select * from Employee;
rollback to sp1;
select * from Employee;

start transaction;
savepoint sp3;
delete from Employee;
select * from Employee;
rollback to sp3;
select * from Employee;
# Delete and Limit Usage
start transaction;
savepoint sp4;
delete from Employee order by FirstName limit 3;
select * from Employee;
rollback to sp4;
select * from Employee;

# Various Select
select FirstName from Employee; 
select FirstName,City,Email from Employee;
select * from Employee;
# Table Creation from Existing Table
create table if not exists emp_copy like Employee;
show tables;
desc emp_copy;
insert emp_copy select * from Employee;
select * from emp_copy;
# Table Creation with select Columns of Existing Table
create table  if not exists emp_city 
select * from Employee where city = 'Chennai'; 
desc emp_city;
select * from emp_city;
create table emp_sel1 select EmployeeID,City,Email from Employee;
desc emp_sel;
insert into emp_sel(EmployeeID,City,Email) select EmployeeID,City,Email from Employee;
select * from emp_sel;



