#DDL
create database sql_batch;
show databases;
#create database Indium_DE_Databricks;
#create database Uber_DA_Scala;
#create database Uber_DA_Pyspark;
#create database Uber_DA_Hadoop;
use sql_batch;
show tables;
CREATE TABLE employee_table(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int NOT NULL,  
    PRIMARY KEY (id)  
);  
show tables;

