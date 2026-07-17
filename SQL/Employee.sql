//Determining the structure of the Employee table and its contents
create table employees_college2(eid int,ename varchar2(20),deptno int,salary int);
insert into employees_college2 values(101,'John',10,50000);
insert into employees_college2 values(102,'Jane',20,60000);
insert into employees_college2 values(103,'Mike',10,55000);
select * from employees_college2;
