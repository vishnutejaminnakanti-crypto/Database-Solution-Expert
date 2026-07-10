//Determining the empname and deptno from employees1 table where empno is 7788
create table employees2(empno int, empname varchar2(20), deptno int);
insert into employees2 values(7781,'Himesh Naidu',10);
insert into employees2 values(7782,'Srikanth',20);
insert into employees2 values(7783,'Yaswanth Reddy',10);
insert into employees2 values(7788,'Sandeep',11);
select empname,deptno from employees2 where empno=7788;

