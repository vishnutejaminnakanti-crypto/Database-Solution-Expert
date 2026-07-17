create table Employee(
    empno int,
    ename VARCHAR2(20),
    sal int,
    deptno int,
    dname VARCHAR2(20),
    loc VARCHAR2(20)
);
insert into Employee values(101,'Ram',30000,10,'Sales','Hyderabad');
insert into Employee values(102,'Ravi',35000,20,'HR','Vijayawada');
insert into Employee values(103,'Krishna',40000,10,'Sales','Hyderabad');

select * from Employee;

/* EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC it is the given table.
EMPNO is primary key.the table is in 2nf
there is no partial dependency beacuse empno is single primary key.but there is transitive dependency 
deptno ->dname ,loc 
Hence the table is not in 3NF.
*/

create table Employee1(
    empno int PRIMARY KEY,
    ename VARCHAR2(20),
    sal int,
    deptno int
);
insert into Employee1 values(101,'Ram',30000,10);
insert into Employee1 values(102,'Ravi',35000,20);
insert into Employee1 values(103,'Krishna',40000,10);
select * from Employee1;

create table Department(
    deptno int PRIMARY KEY,
    dname VARCHAR2(20),
    loc VARCHAR2(20)
);
insert into Department values(10,'Sales','Hyderabad');
insert into Department values(20,'HR','Vijayawada');
select * from Department;
