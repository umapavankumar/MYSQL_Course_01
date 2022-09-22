use sql_batch;
show tables;
desc emp;
select * from emp;
select Fname,Designation,ifnull(Email,'Email Not Assigned')
from emp;

select Fname,Designation,ifnull(Email,'Email Not Assigned') as Email_ifnull
from emp;

select Fname,Designation,coalesce(Email,'Email Not Assigned') as Email_coalesce
from emp;
# ifnull() == coalesce()

insert into emp values(6,'BigData Dev','Pranav','Yalahanka','Bangalore',2,'pranav@indium.com',NULL);
insert into emp values(7,'Python Dev','Priyanka','JNTU','Hyderabad',3,'priyanka@indium.com',NULL);

select * from emp;

alter table emp
add column project varchar(20);

desc emp;

insert into emp values(8,'Hadoop Developer','Kanimozhi','KR Puram','Bangalore',3,'kanimozhi@indium.com','M.Tech','UBER');
select * from emp;

select Fname, Designation,
coalesce(project,designation,'Not Allocated') as Project
from emp
order by designation;
#coalesce-->project-->NULL<----designation-->NULL<---3rd Argument

insert into emp values(9,'Pyspark Developer','Suryaa','Kalapet',NULL,3,'surya@indium.com','M.Tech','UBER');
insert into emp values(10,'Scala Developer','Vasantha',NULL,NULL,3,'vasantha@indium.com','M.Tech','Indium');

select designation, City,
coalesce(city,AddressLine,'Pune')
from emp;

# Query--> Certificate--> 'Databricks Certification' with coalesce()
#Hint-->add the column to the EMP data then use the coalesce()
select * from emp;

 select Designation, count(*)
    from emp
    group by Designation;
    
    update emp
    set Qual= 'B.Tech' where EmployeeID=6;
    update emp
    set Qual= 'MSC' where EmployeeID=7;
    
    # each --> group by clause
    
    select qual,count(*) 
    from Emp
    group by Qual;
    
    # Can't be Executed by MYSQL
    select qual,count(*)
    from emp
    where count(*) >2
    group by qual;
    
	select qual,count(*) 
    from Emp
    group by Qual having count(*) >=2;
    
   select qual,count(*) 
    from Emp
    group by Qual having count(*) >2;
    
    # Scenario we want to observe the  skillset of the Employees
    # By means of certification courses
    # To empower the members we want build the capabilities
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
    
    select * from emp_cert;
	select Ename,sum(Certification)
    from Emp_Cert
    group by Ename;
    # Alias
   select Ename,sum(Certification) as 'Total Certifications'
    from Emp_Cert
    group by Ename;

# Aggregate Function--> 1.count(),2.Sum(),3.Max(), 4.Min() and Avg()

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






   


    
    


  

















