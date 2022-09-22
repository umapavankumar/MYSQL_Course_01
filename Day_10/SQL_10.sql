use employees;
show tables;
create table departments_dup
( dept_no char(4) NULL,
dept_name varchar(40) null
);
show tables;
insert into departments_dup(dept_no, dept_name) 
select * from departments;
select * from departments_dup;
insert into departments_dup(dept_name)
values('Public Relations');
insert into departments_dup(dept_no) values('d010'),('d011');
delete from departments_dup
where dept_no='d002';

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 
select * from dept_manager_dup
order by dept_no;

select * from departments_dup
order by dept_no;

# Inner Join
select m.dept_no,m.emp_no, d.dept_name
from dept_manager_dup m
inner join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

select m.dept_no,m.emp_no, m.from_date,m.to_date,d.dept_name
from dept_manager_dup m
inner join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

select m.dept_no,m.emp_no, m.from_date,m.to_date,d.dept_name
from dept_manager_dup m
 join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;
#d.dept_no= m.dept_no== m.dept_no = d.dept_no
select m.dept_no,m.emp_no, m.from_date,m.to_date,d.dept_name
from dept_manager_dup m
 join 
departments_dup d on d.dept_no = m.dept_no
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
    
# Duplicate Rows Handling
insert into dept_manager_dup values('110228','d003','1992-03-21','9999-01-01');
insert into departments_dup values('d009','Customer Service');
select * from dept_manager_dup
order by dept_no asc;
select * from departments_dup
order by dept_no asc;

select m.dept_no,m.emp_no, d.dept_name
from
dept_manager_dup m
join
departments_dup d on m.dept_no = d.dept_no
order by dept_no;

select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;

#Left Join
select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
left join
departments_dup d on m.dept_no = d.dept_no
order by dept_no;

#Order Change
select m.dept_no,m.emp_no,d.dept_name
from 
departments_dup d
left join
dept_manager_dup m on m.dept_no = d.dept_no
order by m.dept_no;

select d.dept_no,m.emp_no,d.dept_name
from 
departments_dup d
left join
dept_manager_dup m on m.dept_no = d.dept_no
order by d.dept_no;
#left join = left outer join
select d.dept_no,m.emp_no,d.dept_name
from 
departments_dup d
left outer join
dept_manager_dup m on m.dept_no = d.dept_no
order by d.dept_no;

select m.dept_no,m.emp_no,d.dept_name
from
dept_manager_dup m
left join
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;
#where clause to completely remove right records
select m.dept_no,m.emp_no,d.dept_name
from
dept_manager_dup m
left join
departments_dup d on m.dept_no = d.dept_no
where dept_name is null
order by m.dept_no;

# Right Join
select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
right join
departments_dup d on m.dept_no = d.dept_no
order by dept_no;
#Left Join
select m.dept_no,m.emp_no,d.dept_name
from 
dept_manager_dup m
left join
departments_dup d on m.dept_no = d.dept_no
order by dept_no;
# Join and Where
select e.emp_no,e.first_name,e.last_name,s.salary
from employees e
join
salaries s on e.emp_no = s.emp_no
where
s.salary > 145000;
# Cross Join
select dm.*,d.*
from
dept_manager dm
cross join
departments d
order by dm.emp_no,d.dept_no;

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











    
    
    