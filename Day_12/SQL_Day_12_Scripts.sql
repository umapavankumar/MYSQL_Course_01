use employees;
show tables;
# Join and Where
select e.emp_no,e.first_name,e.last_name,s.salary
from employees e
join
salaries s on e.emp_no = s.emp_no
where
s.salary > 145000;

# Group By with Joins used to avoid duplicate Records. 
#JOIN and WHERE Used Together - exercise
#Select the first and last name, the hire date, and the job title of 
# all employees whose first name is “Margareta” and have the last name “Markovitch”.
SELECT
   e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no;   
# Cross Join
select dm.*,d.*
from
dept_manager dm
cross join
departments d
order by dm.emp_no,d.dept_no;
# Stu -->30(Total) -->25 Paid-->2 install-->50 records-->Fee(50) unpaid-->5-->55 Records
select dm.*,d.*
from
dept_manager dm,
departments d
order by 
dm.emp_no,d.dept_no;
select dm.*,d.*
from
departments d
cross join
dept_manager dm
where 
d.dept_no <> dm.dept_no
order by dm.emp_no,d.dept_no;
# More than 2 tables join
select
e.*,d.*
from departments d
cross join 
dept_manager dm
join
employees e on dm.emp_no = e.emp_no
where 
d.dept_no <> dm.dept_no
order by dm.emp_no,d.dept_no;
# subqueries
use sql_batch;
show tables;
select * from emp;
create table emp_sub(emp_id int, emp_name varchar(50),emp_age int, city varchar(10), income  bigint);
desc emp_sub;
insert into emp_sub values(101,'Peter',32,'Newyork',200000),(102,'Mark',32,'California',300000),(103,'Donald',40,'Arizona',1000000),
                           (104,'Obama',35,'Florida',5000000),(105,'Lincoln',32,'Georgia',250000),(106,'Kane',45,'Alaksa',450000),
                           (107,'Adam',35,'California',5000000),(108,'Macculum',40,'Florida',350000),(109,'Bryan',32,'Alaksa',400000),
                           (110,'Stephen',40,'Arizona',600000),(111,'Alexandar',45,'California',70000);
select * from emp_sub;

#employee detail whose id matches in a subquery

select emp_id from emp_sub;

select emp_name,city,income from emp_sub
where emp_id in(select emp_id from emp_sub);

#employee detail whose income is more than 350000 with the help of subquery:

select * from emp_sub
where emp_id in (select emp_id from emp_sub where income > 350000);

#maximum income using a subquery.
select 
	max(income) 
		from emp_sub;

select emp_name,city,income from emp_sub
where income = (select max(income) from emp_sub);

#•	A subquery should always be placed within parentheses-->(select max(income) from emp_sub)
#•	The sql engine starts by running the inner query
#•	Then it uses its returned output, which is intermediate , to execute the outer query.
#•	A subquery may return a single value(a scalar), a single row, a single column , or an entire table.

# Advantages
#o	The subqueries make the queries in a structured form that allows us to isolate each part of a statement.
#o	The subqueries provide alternative ways to query the data from the table; otherwise, we need to use complex joins and unions.
#o	The subqueries are more readable than complex join or union statements.


use employees;
show tables;
select * from dept_manager;
desc dept_manager;
select * from employees;
# Select the first and last name from the Employee table for the same employee numbers
# that can be found in the "dept_manager " Table

select e.first_name,e.last_name
from employees e
where e.emp_no in(select dm.emp_no from dept_manager dm);

select e.first_name,e.last_name,e.emp_no
from employees e
where e.emp_no in(select dm.emp_no from dept_manager dm);

#Extract the information about all department managers 
#who were hired between the 1st of January 1990 and the 1st of January 1995.
SELECT emp_no,hire_date  FROM employees
        WHERE  hire_date BETWEEN '1990-01-01' AND '1995-01-01';

SELECT    * FROM    dept_manager
WHERE
   emp_no IN (SELECT emp_no  FROM employees
        WHERE  hire_date BETWEEN '1990-01-01' AND '1995-01-01');

# Select the first and last name from the Employee table for the same employee numbers
# that can be found in the "dept_manager " Table

# Exists and Not Exists
select e.first_name,e.last_name
from employees e
where exists(select * from dept_manager dm where dm.emp_no = e.emp_no);

select e.first_name,e.last_name,e.emp_no
from employees e
where e.emp_no in(select dm.emp_no from dept_manager dm);

# Task Exists vs in

select e.emp_no,e.first_name,e.last_name
from employees e
where exists(select * from dept_manager dm where dm.emp_no = e.emp_no)
order by emp_no;

# It is more acceptable logically to sort
# the final version of your dataset

# Select the entire information for all employees whose job title is “Assistant Engineer”. 
SELECT  * FROM  titles;
SELECT    * FROM     employees e
WHERE    EXISTS( SELECT  * FROM  titles t   WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer');
# Task:
# Assign employee number 110022 as a manager to all employees from 10001 to 10020
# and employee number 110039 as a manager to all employees from 10021 to 10040.

select emp_no from dept_manager  where emp_no = 110022;
select e.emp_no as employee_ID, min(de.dept_no) as  department_code,
(select emp_no from dept_manager where emp_no = 110022) as manager_ID
from employees e
join
dept_emp de on e.emp_no = de.emp_no
where e.emp_no <=10020
group by e.emp_no
order by e.emp_no;
# Complete Code

select A.* from 
(select e.emp_no as employee_ID, min(de.dept_no) as  department_code,
(select emp_no from dept_manager where emp_no = 110022) as manager_ID
from employees e
join
dept_emp de on e.emp_no = de.emp_no
where e.emp_no <=10020
group by e.emp_no
order by e.emp_no) as A
union
select B.* from 
(select e.emp_no as employee_ID, min(de.dept_no) as  department_code,
	(select emp_no from dept_manager where emp_no = 110039) as manager_ID
from employees e
	join
dept_emp de on e.emp_no = de.emp_no
	where e.emp_no > 10020
		group by e.emp_no
			order by e.emp_no limit 20) as B;

# # self join
#Applied when a table must join itself
#If you would like to combine certain rows of a table with other rows of the same table, you need a self-join.

# from the emp_manager table extract the record data only of those 
# employees who are managers as well.

select * from emp_manager order by emp_manager.emp_no;

select e1.* 
from 
emp_manager e1
join
emp_manager e2 on e1.emp_no = e2.manager_no; 

select distinct e2.emp_no 
from 
emp_manager e1
join
emp_manager e2 on e1.emp_no = e2.manager_no; 

select e1.emp_no,e1.dept_no,e2.manager_no
from 
emp_manager e1
join
emp_manager e2 
on e1.emp_no = e2.manager_no;

select distinct 
e1.*
from
emp_manager e1
join
emp_manager e2 on e1.emp_no = e2.manager_no;

# Method-2
select manager_no from emp_manager;
select e1.* from 
emp_manager e1
join
emp_manager e2 on e1.emp_no = e2.manager_no
where
e2.emp_no in(select manager_no from emp_manager);

#When is it appropriate to use self-joins?
# when a column in a table is referenced in the same table

# Tasks--> Natural Join , Correlated Subqueries, All, Any and Some


























