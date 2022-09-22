use sql_batch;
show tables;
desc emp_sub;
select * from emp_sub;
#CTE

with emp_Arizona as (
select * from emp_sub  where city = 'Arizona')
select emp_name,emp_age,city from emp_Arizona
where emp_age >=32 order by emp_name;

#In MySQL, every statement or query produces a temporary result or relation. 
#A common table expression or CTE is used to name those temporary results set that exist 
#within the execution scope of that statement, such as CREATE, INSERT, SELECT, UPDATE, DELETE, etc.
#Some of the key point related to CTE are:
#•	It is defined by using the WITH clause.
#•	The WITH clause allows us to specify more than one CTEs in a single query.
#•	A CTE can reference other CTEs that are part of the same WITH clause, but those CTEs should be defined earlier.
#•	The execution scope of CTE exists within the statement in which it is used.

# task Establish a CTE with emp_age>40 and income >25000$-->CTE_A_I
# Use the CTE_A_I in the select statement of emp_sub

#Hint select emp_age,emp_income from CTE_A_I 
#     order by emp_age;
# select emp_name,city,emp_age,emp_income from emp_Arizona, CTE_A_I
# order by emp_income

create table customer(cust_id int,name varchar(20),occupation varchar(20), age int);
insert into customer values(101,'Patrick','Software Eng',23),(102,'Juhaina','Developer',21),(103,'Santhosh','Data Eng',24),
                            (104,'Priyanka','Data Sci',20),(105,'Hariharan','Data Analyst',24),(106,'Sadhik','Sofware Eng',23);
select * from customer;

create table orders (order_id int,cust_id int,prod_name varchar(20),order_date date);
insert into orders values(5,105,'ML Practice','2020-04-21');
select * from orders;

with cust_2020 as (
select cust_id,name,occupation from customer
inner join orders using(cust_id)
order by age)
select * from orders join cust_2020 using(cust_id);

#Benefits of using CTE
#•	It provides better readability of the query.
#•	It increases the performance of the query.
#•	The CTE allows us to use it as an alternative to the VIEW concept.
#•	It can also be used as chaining of CTE for simplifying the query.
#•	It can also be used to implement recursive queries easily.

#Task: with cust_2020 as (
#select cust_id,name,occupation from customer
#inner join orders using(cust_id)
#order by age)
#select * from orders join cust_2020 using(cust_id);

#Q Re write the above CTE and observe the time taken to exceute CTE and Normal Query.

# Indexing 
create table student (stu_id int primary key,Fname varchar(20),Lname varchar(20),Branch varchar(5),Year int);

insert into student values(2,'Pavan','Kumar','CSE',2020),(3,'Kanimozhi','Nag','ECE',2021),(4,'Priyanka','Rani','EEE',2022),(5,'Manohar','Reddy','Mech',2021),
                          (6,'Harish','Raju','CSE',2020),(7,'Pranav','Eshwar','EEE',2022);
select * from student;

select stu_id,Fname,Lname from student where Branch = 'EEE';

explain select stu_id,Fname,Lname from student where Branch = 'EEE';

create index Ind_Code on student(Branch);
# syntax create index <index-name> on <table_name>(<attribute_name>);
explain select stu_id,Fname,Lname from student where Branch = 'EEE';

show indexes from student;

#•	An index is a data structure that allows us to add indexes in the existing table. 
# A data structure is logical arrangement of the data/structuring the data.
#•	It enables you to improve the faster retrieval of records on a database table.
#•	 It creates an entry for each value of the indexed columns. 
#•	We use it to quickly find the record without searching each row in a database table whenever the table is accessed. 
#•	We can create an index by using one or more columns of the table for efficient access to the records.
#•	When a table is created with a primary key or unique key, it automatically creates a special index named PRIMARY INDEX. 
#•	We called this index as a clustered index. --->Cluster a group of similar items.
#All indexes other than PRIMARY indexes are known as a non-clustered index or secondary index.

# Window Functions
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

select * from sales;

SELECT * FROM Sales;  
SELECT SUM(sale) AS Total_Sales FROM Sales;  
SELECT Year, Product, SUM(Sale) AS Total_Sales   
FROM Sales   
GROUP BY Year   
ORDER BY Product;  

SELECT Year, Product, Sale, SUM(Sale)   
OVER(PARTITION BY Year) AS Total_Sales   
FROM Sales;  

SELECT Year, Product, Sale, SUM(Sale)   
OVER(PARTITION BY Product) AS Total_Sales   
FROM Sales;  

SELECT Year, Product, Sale,   
NTile(4) OVER() AS Total_Sales   
FROM Sales;  

SELECT Year, Product, Sale,   
LEAD(Sale,1) OVER(ORDER BY Year) AS Total_Sales   
FROM Sales;  
#•	A window function in MySQL used to do a calculation across a set of rows that are related to the current row. 
#The current row is that row for which function evaluation occurs. 
#•	Window functions perform a calculation similar to a calculation done by using the aggregate functions. 
#•	But, unlike aggregate functions that perform operations on an entire table, 
#window functions do not produce a result to be grouped into one row. 
#•	It means window functions perform operations on a set of rows and produces an aggregated value for each row. 
#•	Therefore, each row maintains the unique identities.
















