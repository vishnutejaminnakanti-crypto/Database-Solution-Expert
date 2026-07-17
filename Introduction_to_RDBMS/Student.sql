create table Student_details(Member_id int,First_name varchar(50),Last_name varchar(50),Sports varchar(20),Fees int);
insert into Student_details values(101,'Rajesh','Chand','Cricket',100);
insert into Student_details values(102,'Jayesh','Raj','Hockey',80);
insert into Student_details values(103,'Mark','Dorson','Football',90);
select * from Student_details;
 
//Reducing above table to 3NF

create table Student1_details(Member_id int primary key,First_name varchar(50),Last_name varchar(50),Sports varchar(20));
insert into Student1_details values(101,'Rajesh','Chand','Cricket');
insert into Student1_details values(102,'Jayesh','Raj','Hockey');
insert into Student1_details values(103,'Mark','Dorson','Football');
select * from Student1_details;

create table Student2_Fees(Member_id int primary key,Fees int);
insert into Student2_Fees values(101,100);
insert into Student2_Fees values(102,80);
insert into Student2_Fees values(103,90);
select * from Student2_Fees;