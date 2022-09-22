use demo1;
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

select emp_name,city,income from emp_sub
where emp_id in(select emp_id from emp_sub);

#employee detail whose income is more than 350000 with the help of subquery:

select * from emp_sub
where emp_id in (select emp_id from emp_sub where income > 350000);

#maximum income using a subquery.

select emp_name,city,income from emp_sub
where income = (select max(income) from emp_sub);

use employees;
select * from dept_manager;
# Select the first and last name from the Employee table for the same employee numbers
# that can be found in the "dept_manager " Table

select e.first_name,e.last_name
from employees e
where e.emp_no in(select dm.emp_no from dept_manager dm);

#Extract the information about all department managers 
#who were hired between the 1st of January 1990 and the 1st of January 1995.
SELECT    * FROM    dept_manager
WHERE
   emp_no IN (SELECT emp_no  FROM employees
        WHERE  hire_date BETWEEN '1990-01-01' AND '1995-01-01');
# Exists and Not Exists
select e.first_name,e.last_name
from employees e
where exists(select * from dept_manager dm where dm.emp_no = e.emp_no);

# Task Exists vs in
# order by
select e.emp_no,e.first_name,e.last_name
from employees e
where exists(select * from dept_manager dm where dm.emp_no = e.emp_no)
order by emp_no;
# It is more acceptable logically to sort
# the final version of your dataset
# Select the entire information for all employees whose job title is “Assistant Engineer”. 
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
            
DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (

   emp_no INT(11) NOT NULL,

   dept_no CHAR(4) NULL,

   manager_no INT(11) NOT NULL

);

INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
            
# self join
# from the emp_manager table extract the record data only of those 
# employees who are managers as well.

select * from emp_manager order by emp_manager.emp_no;

select e1.* 
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
select e1.* from 
emp_manager e1
join
emp_manager e2 on e1.emp_no = e2.manager_no
where
e2.emp_no in(select manager_no from emp_manager);

#When is it appropriate to use self-joins?
# when a column in a table is referenced in the same table





