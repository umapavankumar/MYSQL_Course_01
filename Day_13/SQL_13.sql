use demo1;
show tables;
desc emp_sub;
select * from emp_sub;

with emp_Arizona as (
select * from emp_sub  where city = 'Arizona')
select emp_name,emp_age,city from emp_Arizona
where emp_age >=32 order by emp_name;
/*
create table customer(cust_id int,name varchar(20),occupation varchar(20), age int);
insert into customer values(101,'Patrick','Software Eng',23),(102,'Juhaina','Developer',21),(103,'Santhosh','Data Eng',24),
                            (104,'Priyanka','Data Sci',20),(105,'Hariharan','Data Analyst',24),(106,'Sadhik','Sofware Eng',23);
select * from customer;

create table orders (order_id int,cust_id int,prod_name varchar(20),order_date date);
desc orders;

insert into orders values(6,106,'BigData and ML','2020-04-30');

select * from orders;
#1,101,'Laptop','2020-01-10',(2,103,'Hadoop Tom White','2020-02-12'),(3,104,'Spark Definite Guide','2020-03-05'),
 #                         (4,102,'Python Orielly','2020-03-02'),(5,105,'ML Practice','2020-04-21'),(6,106,'BigData and ML','2020-04-30');
*/

with cust_2020 as (
select cust_id,name,occupation from customer
inner join orders using(cust_id)
order by age)
select * from orders join cust_2020 using(cust_id);
# Indexing 
create table student (stu_id int primary key,Fname varchar(20),Lname varchar(20),Branch varchar(5),Year int);
insert into student values(2,'Pavan','Kumar','CSE',2020),(3,'Kanimozhi','Nag','ECE',2021),(4,'Priyanka','Rani','EEE',2022),(5,'Manohar','Reddy','Mech',2021),
                          (6,'Harish','Raju','CSE',2020),(7,'Pranav','Eshwar','EEE',2022);
select * from student;

select stu_id,Fname,Lname from student where Branch = 'EEE';

explain select stu_id,Fname,Lname from student where Branch = 'EEE';

create index Ind_Code on student(Branch);
explain select stu_id,Fname,Lname from student where Branch = 'EEE';

show indexes from student;

CREATE TABLE Sales(  
    Employee_Name VARCHAR(45) NOT NULL,  
    Year INT NOT NULL,  
	Country VARCHAR(45) NOT NULL,  
    Product VARCHAR(45) NOT NULL,  
    Sale DECIMAL(12,2) NOT NULL,  
    PRIMARY KEY(Employee_Name, Year)  
);  
 INSERT INTO Sales(Employee_Name, Year, Country, Product, Sale)  
VALUES('Joseph', 2017, 'India', 'Laptop', 10000),  
('Joseph', 2018, 'India', 'Laptop', 15000),  
('Joseph', 2019, 'India', 'TV', 20000),  
('Bob', 2017, 'US', 'Computer', 15000),  
('Bob', 2018, 'US', 'Computer', 10000),  
('Bob', 2019, 'US', 'TV', 20000),  
('Peter', 2017, 'Canada', 'Mobile', 20000),  
('Peter', 2018, 'Canada', 'Calculator', 1500),  
('Peter', 2019, 'Canada', 'Mobile', 25000);  

SELECT * FROM Sales;  
SELECT SUM(sale) AS Total_Sales FROM Sales;  
SELECT Year, Product, SUM(Sale) AS Total_Sales   
FROM Sales   
GROUP BY Year   
ORDER BY Product;  

SELECT Year, Product, Sale, SUM(Sale)   
OVER(PARTITION BY Year) AS Total_Sales   
FROM Sales;  

SELECT Year, Product, Sale,   
NTile(4) OVER() AS Total_Sales   
FROM Sales;  

SELECT Year, Product, Sale,   
LEAD(Sale,1) OVER(ORDER BY Year) AS Total_Sales   
FROM Sales;  
