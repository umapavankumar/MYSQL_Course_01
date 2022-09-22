use sql_batch;
show tables;
select * from emp;
update emp
set Designation = 'Data Scientist'
where EmployeeID = 1;
update emp
set Designation = 'PySpark Developer'
where EmployeeID = 2;
update emp
set Designation = 'Hadoop Developer'
where EmployeeID = 4;
update emp
set Designation = 'Data Scientist'
where EmployeeID = 5;
# Like operator % set of words
select * from emp
where Designation Like'%Data%';
# _ refers to single char
select * from emp
where Fname like 'J__n';
select * from emp
where Fname like 'J__n%';

select * from emp
where Fname like's%';
select Fname from emp;

select Fname from emp
where Fname like'_a%';

select * from emp
where Designation like 'D%t';

select * from emp
where Designation like '%Data%';
select * from emp
where Designation like 'Data%';
# Combining conditions with AND, OR, NOT
select * from emp;

update emp
set Qual = 'B.Tech'
where EmployeeID = 1;

update emp
set Qual = 'MSC'
where EmployeeID = 2;

update emp
set Qual = 'MS'
where EmployeeID = 3;

update emp
set Qual = 'PhD'
where EmployeeID = 5;

select * from emp
where City = 'Bangalore' and Qual = 'MS';

select * from emp
where Qual = 'M.Tech' or City = 'Chennai';

select Fname from Emp where (Designation like 'Data%' or Exp = 5) and qual = 'PhD';

select * from Emp where Qual = 'M.Tech' or Qual = 'MSC' and Exp = 3;

select * from Emp where not (Qual = 'B.Tech');

select EmployeeID,Fname, Designation from Emp
where EmployeeID < 5 and not(EmployeeID = 1 or EmployeeID = 3);

#order by
select EmployeeID,Fname from Emp
order by Fname; 

select EmployeeID, Designation,Exp from emp
order by Exp;

select EmployeeID, Designation,Exp from emp
order by Exp limit 3;

# Degree and Cardinality

# Start from 2nd record and upto 3 records
select * from Emp limit 2,3;

select * from Emp;

select * from Emp limit 2 offset 3;
use employees;
show tables;
select * from salaries limit 5;

select * from salaries 
order by salary desc
limit 5;

select * from salaries 
order by salary 
limit 5;

select 
count(salary)
from salaries;

# How many employess start dates are in the database
select count(from_date) from salaries;

select count(distinct from_date) from salaries;

select count(*) from salaries;

# How many departments are there in the 'employees' database? use dept_emp table.
select * from dept_emp limit 5;
select count(distinct dept_no) from dept_emp;
select count(dept_no) from dept_emp;
select salary from salaries limit 5;
#How much salary we are paying
select sum(salary) from salaries;
# To Hiw many employees we are paying
select count(salary) from salaries;
select sum(*) from salries;
select count(*) from salaries; 

# count numeric and non-numeric
#sum works for numeric 

#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
select sum(salary) from salaries 
where from_date>'1997-01-01';

# Highest Salry we offer?
select max(salary) from salaries;
#Which is the lowest employee number in the database?
# Which is the highest employee number in the database?
desc employees;
select max(emp_no) from employees;
select min(emp_no) from employees;
select max(emp_no),min(emp_no) from employees;
select max(salary),min(salary),avg(salary) from salaries;

# what is the average annual salary the company's employee received?
select avg(salary) from salaries;
#What is the average annual salary paid to employees who started after the 1st of January 1997?
select avg(salary) from salaries
where from_date>'1997-01-01';
#round()
#67717.7450--->67718-->
#67717.7450-->67717.74-->
select avg(salary) from salaries;
select round(avg(salary)) from salaries;
select round(avg(salary),2) from salaries;

#Round the average amount of money spent on salaries for all contracts 
#that started after the 1st of January 1997 to a precision of 2.
select round(avg(salary),2) from salaries where from_date>'1997-01-01';
#Round the average amount of money spent on salaries for all contracts 
#that started after the 1st of January 1997 to a precision of 2.
select round(avg(salary)) from salaries where from_date>'1997-01-01';





























