use employees;
show tables;

select * from employees;

select * from employees
where first_name = 'Cathie' or first_name = 'Mark' or first_name = 'Nathan';
# IN
select * from employees 
where first_name in ('Cathie','Mark','Nathan');

#NOT IN
select * from employees 
where first_name not in ('Cathie','Mark','Nathan');

# Use the IN operator to select all individuals from the “employees” table, 
#whose first name is either “Denis”, or “Elvis”.
select * from employees
where first_name in('Denis','Elvis');

# Extract all records from the ‘employees’ table, 
#aside from those with employees named John, Mark, or Jacob.

select * from employees
where first_name not in('John', 'Mark','Jacob');

# IN is equal to = operator and meets the condition as per the names/skills provided
# NOT IN equl to != /<> and filters the records without scoping the mentioned names/skills

# Between And

# Between AND
select * from employees
where hire_date between '1990-01-01' and '2000-01-01';
# Note: 1990-01-01 and 2000-01-01 will be included in the retrieved list of records
select * from employees
where hire_date not between '1990-01-01' and '2000-01-01'; 
# the hire_date is before '1990-01-01 or
# the hire date is after '2000-01-01'
# 1990-01-01  and '2000-01-01  are not included in the intervals.

#Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT     * FROM    salaries;
SELECT    * FROM  salaries WHERE salary BETWEEN 66000 AND 70000;

# Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT    * FROM    employees WHERE emp_no NOT BETWEEN '10004' AND '10012';

#Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT    dept_name FROM departments
WHERE  dept_no BETWEEN 'd003' AND 'd006';

SELECT    dept_no,dept_name FROM departments
WHERE  dept_no BETWEEN 'd003' AND 'd006';

select * from departments
where dept_no between 'd003' and 'd006';

# IS NOT NULL

select * from employees
where first_name is not null;

select * from employees
where first_name is null;

#Select the names of all departments whose department number value is not null.
select * from departments
where dept_no is not null;

select * from departments
where dept_no is null;

# Comparison Operators --> BETWEEN AND NOT BETWEEN AND, LIKE, NOT LIKE IS NOT NULL, IS NULL
# COMPARISON OPERATORS--> = , > , >= , <, <= , <> ,!=
# = 

select * from employees where first_name = 'Mary';

select * from employees where first_name != 'Mary';

select * from employees where first_name <> 'Mary';

# != -->fetch--->0.297 Sec
# <> --->fetch-->0.422 Sec

# Provide a List of Employees hired after 1st Jan 2000.

select * from employees
where hire_date >'2000-01-01';

select * from employees
where hire_date >='2000-01-01';

# Provide a List of Employees hired before  1st Feb 1985.

select * from employees
where hire_date < '1985-02-01';

select * from employees
where hire_date <= '1985-02-01';

# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
# selection, >= , AND
SELECT    * FROM  employees WHERE    hire_date >= '2000-01-01'
AND gender = 'F';
# Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT    * FROM    salaries
WHERE    salary > 150000;

# distinct
# distinct
select gender from employees;
select distinct gender from employees;

# Obtain a list with all different “hire dates” from the “employees” table.

select distinct hire_date from employees;

# CASE Usage

select emp_no, first_name,last_name,
case 
	when gender = 'M' then 'Male'
    else 'Female'
end as gender
from employees;

# CASE Alter
select emp_no, first_name,last_name,
case gender
	when 'M' then 'Male'
	else 'Female'
end as gender
from employees;














