--q1
create table dept1(deptno integer primary key,dname varchar2(30) not null,loc varchar2(30) not null);

--q2
create table emp1(empno integer primary key,ename varchar2(20) not null,sal number(10,2) check(sal>5000),mgr number,deptno integer,constraint vishnu foreign key (mgr) references emp1(empno),constraint teja foreign key (deptno) references dept1(deptno));

--q3
create table dept11 as select * from dept1;
create table emp11 as select * from emp1;

--q4
alter table emp1 add address varchar2(30);

--q5
alter table emp1 rename column sal to salary;

--q6
alter table emp1 rename constraint vishnu to fkmgr;
alter table emp1 rename constraint teja to fdeptno;
desc emp1;

--q7
alter table emp1 modify ename varchar2(40);

--q8
alter table emp1 modify ename null;

--q9
comment on table dept1 is 'Depts of WIPRO';

--q10
comment on column dept1.deptno is 'Deptno of WIPRO';

--q11
comment on table emp1 is 'Employees of WIPRO';

--q12
comment on column emp1.empno is 'Empno of WIPRO';

--q13
comment on table dept1 is '';
comment on column dept1.deptno is '';
comment on table emp1 is '';
comment on column emp1.empno is '';

--q14
alter table emp1 set unused (salary,ename);

--q15
alter table emp1 drop unused columns;

--q16
drop table dept1 cascade constraints;
drop table emp1 cascade constraints;

--q17
create table emp1 as select * from employees;
select * from emp1;

--q18
alter table emp1 rename to Emp_Test;

--q19
truncate table Emp_Test;
select * from Emp_Test;

--q20
create table emp2 as select employee_id,first_name,salary from employees;

--q21
drop table emp2;

--q22
create table emp2 as select * from employees where 1=2;

--q23
drop table emp2;

--q24
flashback table emp2 to before drop;
select * from emp2;

--q25
flashback table emp2 to before drop rename to emp2_1;

--q26
select table_name from user_tables;
