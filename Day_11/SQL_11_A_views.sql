use employees;
show tables;
select * from dept_emp;
select emp_no, from_date,to_date, count(emp_no) as Num
from dept_emp
group by emp_no
having Num>1;

# Visualize Only the period encompassing the last contract of
#each employee

select emp_no,max(from_date) as from_date,
              max(to_date) as to_date
from dept_emp
group by emp_no;
# Views
create or replace view v_date_emp as
select emp_no,max(from_date) as from_date,
              max(to_date) as to_date
from dept_emp
group by emp_no;

# Create a view that will extract the average salary of all managers registered in the database. 
# Round this value to the nearest
CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT  ROUND(AVG(salary), 2)
    FROM  salaries s
            JOIN  dept_manager m ON s.emp_no = m.emp_no;
