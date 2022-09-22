use employees;
show tables;
select * from dept_emp;
desc dept_emp;
# 1-->10-->1-->20-->1-->30
# 1-->(10,20,30)
#composite primary key
#emp_no dept_no

select * from dept_emp where emp_no = 10010;
# 10010 d007 2001-07-27 9999-01-01
# 10010 d008 2003-08-28 9999-01-01
select emp_no, from_date,to_date, count(emp_no) as Num
from dept_emp
group by emp_no
having Num>1;

# Visualize Only the period encompassing the last contract of
#each employee
# 2001-01-01 2003-01-01 2007-01-01-->max-->2007-01-01

select emp_no,max(from_date) as from_date,
              max(to_date) as to_date
from dept_emp
group by emp_no;

# Views
# V or W-->Views
create or replace view v_date_emp as
select emp_no,max(from_date) as from_date,
              max(to_date) as to_date
from dept_emp
group by emp_no;

# Create a view that will extract the average salary of all managers registered in the database. 
# Round this value to the nearest Price
CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT  ROUND(AVG(salary), 2)
    FROM  salaries s
            JOIN  dept_manager m ON s.emp_no = m.emp_no;
	
desc salaries;
desc dept_manager;

# Joins
select * from dept_manager_dup
order by dept_no;

select * from departments_dup
order by dept_no desc;


select * from departments_dup
order by dept_no;

desc departments_dup;
desc dept_manager_dup;

# Inner Join
select m.dept_no,m.emp_no, d.dept_name
from dept_manager_dup m
inner join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

select m.dept_no,m.emp_no, d.dept_name,d.dept_no
from dept_manager_dup m
inner join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

select m.dept_no,m.emp_no, d.dept_name,d.dept_no
from departments_dup d 
inner join 
dept_manager_dup m on m.dept_no = d.dept_no
order by m.dept_no;

# Best --> Always prefer to mention the first table attributes at first and later the second table attributes
# You can use the tables interchangebly
# Additional Columns Display
select m.dept_no,m.emp_no, m.from_date,m.to_date,d.dept_name
from dept_manager_dup m
inner join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

# Inner Join = Join
select m.dept_no,m.emp_no, m.from_date,m.to_date,d.dept_name
from dept_manager_dup m
 join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

#Extract a list containing information about all managers’ employee number, 
# first and last name, department number, and hire date.

SELECT
    e.emp_no,e.first_name,e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
JOIN
    dept_manager dm ON e.emp_no = dm.emp_no; 
#d.dept_no= m.dept_no== m.dept_no = d.dept_no
select m.dept_no,m.emp_no, m.from_date,m.to_date,d.dept_name
from dept_manager_dup m
 join 
departments_dup d on d.dept_no = m.dept_no
order by m.dept_no;

select m.dept_no,m.emp_no, m.from_date,m.to_date,d.dept_name
from dept_manager_dup m
 join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

# Handling duplicates with group by clause
select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;

# left join
select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
left join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;

select m.dept_no,m.emp_no,d.dept_name
from 
departments_dup d
left join
dept_manager_dup m on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;

# While applying left join the order which we apply the join matters
# In the first left join we got 28 rows where as in secod we got 23 rows only.

#left join = left outer join
select d.dept_no,m.emp_no,d.dept_name
from 
departments_dup d
left outer join
dept_manager_dup m on m.dept_no = d.dept_no
order by d.dept_no;

select d.dept_no,m.emp_no,d.dept_name
from 
departments_dup d
left  join
dept_manager_dup m on m.dept_no = d.dept_no
order by d.dept_no;

select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
left join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;

select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
right join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;

select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
right outer join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;














