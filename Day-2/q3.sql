create table Employee_Project(
    empno int,
    project_no int,
    no_of_days int,
    customername VARCHAR2(30)
);
insert into Employee_Project values(101,1001,25,'Infosys');
insert into Employee_Project values(101,1002,15,'TCS');
insert into Employee_Project values(102,1001,20,'Infosys');
select * from Employee_Project;
 
/* EMPNO, PROJECT_NO, NO_OF_DAYS, CUSTOMERNAME it is the given table.
EMPNO, PROJECT_NO is compositeprimary key.the table is in 1nf
customername is dependent on project_no which is part of composite primary key.
Hence the table is not in 2NF.
*/  

create table Employee_Project1(
    empno int,
    project_no int,
    no_of_days int,
    primary key(empno,project_no)
);
insert into Employee_Project1 values(101,1001,25);
insert into Employee_Project1 values(101,1002,15);
insert into Employee_Project1 values(102,1001,20);
select * from Employee_Project1;

create table Project(
    project_no int primary key,
    customername VARCHAR2(30)
);
insert into Project values(1001,'Infosys');
insert into Project values(1002,'TCS');
select * from Project;