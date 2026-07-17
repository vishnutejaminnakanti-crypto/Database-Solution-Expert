
create table salary_table(empno int, salary int);
insert into salary_table values(101,50000);
insert into salary_table values(102,60000);
insert into salary_table values(103,55000);
select * from salary_table;
select empno, salary, salary+5000 as addingsalary from salary_table;
select empno, salary, salary-2000 as reducingsalary from salary_table;
select empno, salary, salary*2 as double_salary from salary_table;
select empno, salary, salary/2 as half_salary from salary_table;
select empno, salary, mod(salary, 2) as remainder_salary from salary_table;
select empno, salary, salary+100 as increased_salary from salary_table where empno=101;