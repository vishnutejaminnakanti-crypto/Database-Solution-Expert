create table Training_Clg(empno int,training varchar2(20),training_date DATE,dept varchar(20));
insert into Training_Clg values(101,'Oracle Sql',DATE '2015-08-12','TT');
insert into Training_Clg values(101,'Java',DATE '2015-08-21','BU');
insert into Training_Clg values(102,'Oracle Sql',DATE '2014-09-18','TT');
select * from Training_Clg;

//for reducing the above table into 2NF we have to seperate the relation into two tables because it has parial dependency 
//Training → Dept so we have to create another table for dept and remove the dept column from training table and create a new table for dept with training 

create table Training_Department(training varchar2(20) primary key,dept varchar(20));
insert into Training_Department values('Oracle Sql','TT');
insert into Training_Department values('Java','BU');
select * from Training_Department;


create table Employee_Training(empno int,training varchar2(20),training_date date,primary key(empno,training));
insert into Employee_Training values(101,'Oracle Sql',DATE '2015-08-12');
insert into Employee_Training values(101,'Java',DATE '2015-08-21');
insert into Employee_Training values(102,'Oracle Sql',DATE '2014-09-18');
select * from Employee_Training;
