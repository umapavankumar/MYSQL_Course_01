use demo1;
create table panel(pid int not null auto_increment, proj_id int null, rid int null, panel_name varchar(100) null, primary key(pid)); 
show tables;
desc panel;
show columns from panel;
insert into panel(proj_id,rid,panel_name) values (1,1010,'Data Science');
insert into panel(proj_id,rid,panel_name) values (2,1020,'Data Engineering'),(3,1030,'Pyspark'),(4,1040,'Hadoop and YARN');
select * from panel;
create table client( id int, panel_id int, client_info varchar(50) not null, 
                     constraint fk_panel foreign key(panel_id) references panel(pid));
show tables;
desc client;
select * from panel;
insert into client values (101,1,'Data Science Recruitment for 5 Year Band');
select * from Client;
insert into client values (102,1,'Data Science Recruitment for 2 Year Band');
insert into client values (103,1,'Data Science Recruitment for 8 Year Band');
select * from client;
insert into client values(104,2,'Data Engineering(Pyspark) 5 year Band');
insert into client values(105,5,'BigData Panel for 10 year Band');
delete from panel where pid = 1;
show create table client;
# Check Constraint
create table Migrate1(eno int primary key, proj_name varchar(20),Client_name varchar(10), 
no_cert int not null check(no_cert>2),loc varchar(10) not null check (loc='HYD'or loc='CN' or loc='BLR'));
desc Migrate1;
show create table Migrate1;
insert into Migrate1 values(1001,'Data Analytics','UBER',3,'HYD');
insert into Migrate1 values(1002,'Data Engineering','Indium',4,'CN');
insert into Migrate1 values(1003,'Data Services','GL',2,'BLR');
insert into Migrate1 values(1004, 'Machine Learning','AD',3,'Delhi');
