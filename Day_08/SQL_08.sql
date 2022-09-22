use demo1;
show tables;
select * from emp;
select Fname,Designation,ifnull(Email,'Email Not Assigned')
from emp;

select Fname,Designation,ifnull(Email,'Email Not Assigned') as Email
from emp;

select Fname,Designation,coalesce(Email,'Email Not Assigned') as Email
from emp;

insert into emp values(6,'BigData Dev','Pranav','Yalahanka','Bangalore',2,'pranav@indium.com',NULL);
insert into emp values(7,'Python Dev','Priyanka','JNTU','Hyderabad',3,'priyanka@indium.com',NULL);


select * from emp;
alter table emp
add column project varchar(20);
desc emp;
select * from emp;
insert into emp values(8,'Hadoop Developer','Kanimozhi','KR Puram','Bangalore',3,'kanimozhi@indium.com','M.Tech','UBER');
select * from emp;
select Fname, Designation,
coalesce(project,designation,'NOT Allocated') as Project
from emp
order by designation;
desc emp;
insert into emp values(9,'Pyspark Developer','Suryaa','Kalapet',NULL,3,'surya@indium.com','M.Tech','UBER');
insert into emp values(10,'Scala Developer','Vasantha',NULL,NULL,3,'vasantha@indium.com','M.Tech','Indium');

select designation, City,
coalesce(city,AddressLine,'Pune')
from emp;

select AddressLine,city from emp;

select designation, qual,
coalesce('Certification') as Addl_qual 
from emp;

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
    
    #group by
    use demo1;
    show tables;
    select * from emp;
    select Designation, count(*)
    from emp
    group by Designation;
    #The MYSQL GROUP BY Clause is used to collect data from multiple records and group the result by one or more column. 
    #It is generally used in a SELECT statement.
	#You can also use some aggregate functions like COUNT, SUM, MIN, MAX, AVG etc. on the grouped column.
    
    update emp
    set Qual= 'B.Tech' where EmployeeID=6;
    update emp
    set Qual= 'MSC' where EmployeeID=7;
    
    select qual,count(*) 
    from Emp
    group by Qual;
    
    select qual,count(*) 
    from Emp
    group by Qual having count(*) >=2;
    
    create table Emp_Cert
    (EmployeeID int,Ename varchar(20),Certification int);
    insert into Emp_Cert values (1001,'Sai Santosh',1);
    insert into Emp_Cert values (1002,'Hari haran',2);
    insert into Emp_Cert values (1001,'Sai Santosh',2);
    insert into Emp_Cert values (1002,'Hari haran',1);
    insert into Emp_Cert values (1003,'Patrick',1);
    insert into Emp_Cert values (1004,'Juhaina',1);
    insert into Emp_Cert values (1003,'Patrick',1);
    insert into Emp_Cert values (1004,'Juhaina',2);
    insert into Emp_Cert values (1005,'Manohar',3);
    insert into Emp_Cert values (1006,'Pavan',2);
    insert into Emp_Cert values (1007,'Harish',1);
    insert into Emp_Cert values (1008,'Priyanka',2);
    select * from Emp_Cert;
    select Ename,sum(Certification)
    from Emp_Cert
    group by Ename;
    
     select Ename,sum(Certification) as 'Total Certifications'
    from Emp_Cert
    group by Ename;
    
    select Ename,min(Certification) as 'Min.Certifications'
    from Emp_Cert
    group by Ename;
    
    select Ename,max(Certification) as 'Max.Certifications'
    from Emp_Cert
    group by Ename;
    
    select Ename,avg(Certification) as 'AVG.Certifications'
    from Emp_Cert
    group by Ename;
    
    # Having
    select Ename,sum(Certification) as 'Total_Cert'
    from Emp_Cert
    group by Ename
    having sum(Certification) >3;
    
    select Ename,sum(Certification) as 'Total_Cert'
    from Emp_Cert
    group by Ename
    having sum(Certification) >=3;
    
    

    











