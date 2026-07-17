create table Student(
    rollno int,
    name VARCHAR2(20),
    age int,
    exam VARCHAR2(20),
    marks int,
    grade CHAR(1)
);
insert into Student values(101,'Ram',20,'DBMS',95,'A');
insert into Student values(102,'Ravi',21,'DBMS',82,'B');
insert into Student values(103,'Krishna',20,'DBMS',70,'C');
select * from Student;

/* ROLLNO, NAME, AGE, EXAM, MARKS, GRADE it is the given table.
ROLLNO is primary key.the table is in 2nf
marks -> grade is a transitive dependency
Hence the table is not in 3NF.
*/ 

create table Student1(
    rollno int PRIMARY KEY,
    name VARCHAR2(20),
    age int,
    exam VARCHAR2(20),
    marks int
);
insert into Student1 values(101,'Ram',20,'DBMS',95);
insert into Student1 values(102,'Ravi',21,'DBMS',82);
insert into Student1 values(103,'Krishna',20,'DBMS',70);
select * from Student1;

create table Grade(
    marks int PRIMARY KEY,
    grade CHAR(1)
);
insert into Grade values(95,'A');
insert into Grade values(82,'B');
insert into Grade values(70,'C');
select * from Grade;
