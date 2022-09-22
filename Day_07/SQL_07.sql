use employees;
show databases;
show tables;
desc salaries;
select * from salaries limit 5;
select * from salaries 
order by salary desc
limit 5;
select 
count(salary)
from salaries;
# How many employess start dates are in the database
select count(from_date) from salaries;
select count(distinct from_date) from salaries;
select count(*) from salaries;

# How many departments are there in the 'employees' database? use dept_emp table.
desc dept_emp;
select * from dept_emp limit 5;
select count(distinct dept_no) from dept_emp;
select sum(salary) from salaries;
#error
select sum(*) from salries;
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
# which is the average annual salary the company's employee received?
select avg(salary) from salaries;
#What is the average annual salary paid to employees who started after the 1st of January 1997?
select avg(salary) from salaries
where from_date>'1997-01-01';
#Round()
select round(avg(salary)) from salaries;
select round(avg(salary),2) from salaries;
#Round the average amount of money spent on salaries for all contracts 
#that started after the 1st of January 1997 to a precision of 2.
select round(avg(salary),2) from salaries where from_date>'1997-01-01';
#coalesce()
select * from departments_dup 
order by dept_no;

