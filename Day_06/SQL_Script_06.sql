use sql_batch;
show tables;
#Primary key and Foreign Key Implementation:
create table panel(pid int not null auto_increment, proj_id int null, rid int null, panel_name varchar(100) null, primary key(pid)); 
show tables;
desc panel;
show columns from panel;
insert into panel(proj_id,rid,panel_name) values (1,1010,'Data Science');
select * from panel;
insert into panel(proj_id,rid,panel_name) values (2,1020,'Data Engineering'),(3,1030,'Pyspark'),(4,1040,'Hadoop and YARN');
create table client( id int, panel_id int, client_info varchar(50) not null, 
                     constraint fk_panel foreign key(panel_id) references panel(pid));
show tables;
desc client;
select * from panel;
insert into client values (101,1,'Data Science Recruitment for 5 Year Band');
select * from client;
insert into client values (102,1,'Data Science Recruitment for 2 Year Band');
select * from client;
insert into client values (103,1,'Data Science Recruitment for 8 Year Band');
# Error--> As there is no reference value(5) in Panel(pid--1,2,3,4) so the insert fails.
insert into client values(104,5,'Hadoop and Spark of 5 Year band');
insert into client values(104,2,'Data Engineering(Pyspark) 5 year Band');
insert into panel(proj_id,rid,panel_name) values(16,1050,'Big Data Tech');
insert into client values(105,5,'BigData Panel for 10 year Band');
select * from panel;
select * from client;
delete from panel where pid = 1;
delete from client where id = 105;
delete from panel where pid =5;
insert into client values(105,6,'Data Analytics for 5 year Band');
show create table client;
# cert_courses>2, loc-->BLR/HYD/CN
#check table
create table Migrate1(eno int primary key, proj_name varchar(20),Client_name varchar(10), 
no_cert int not null check(no_cert>2),loc varchar(10) not null check (loc='HYD'or loc='CN' or loc='BLR'));
desc Migrate1;
show create table Migrate1;
insert into Migrate1 values(1001,'Data Analytics','UBER',3,'HYD');
insert into Migrate1 values(1002,'Data Engineering','Indium',4,'CN');
insert into Migrate1 values(1003,'Data Services','GL',2,'BLR');
insert into Migrate1 values(1004, 'Machine Learning','AD',3,'Delhi');
show tables;
select * from emp;
select * from emp where Qual = 'M.Tech';
select Designation from emp where Fname= 'Juhaina';
select Fname, City from Emp where City = 'Chennai';
update emp
set Exp=5 where city = 'Chennai';
update emp
set Exp=3 where city = 'Bangalore';

select Fname, City from Emp where Exp<5;
select Fname,City from Emp where Exp<>3;
select Fname, Exp from Emp where Fname < 'M';
select Fname,city from Emp where Fname < 'm';




