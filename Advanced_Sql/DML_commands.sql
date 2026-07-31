--q1
create table EmpTest as select * from employees;

--q2
insert into emptest(employee_id,first_name,salary) values (9999,user,5000);
commit;

--q3
update EmpTest set salary=salary*1.15 where first_name='TURNER';
commit;
select * from EmpTest where first_name='TURNER';

--q4
update EmpTest set salary=(select salary from emptest where first_name='SCOTT') where first_name='SMITH';
commit;

--q5
UPDATE EmpTest
SET salary = salary * 1.10
WHERE department_id IN (
    SELECT d.department_id
    FROM departments d
    JOIN locations l
        ON d.location_id = l.location_id
    WHERE l.city = 'New York'
);

COMMIT;

--q6
UPDATE EmpTest
SET comm = NULL;

COMMIT;

--q7
DELETE FROM EmpTest
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Sales'
);

COMMIT;

--q8
delete from EmpTest where department_id in(select department_id from departments where department_name=upper('&'));
commit;

--q9
create table emp2 as select employee_id,first_name,salary from employees where 1=2;

--q10
create table emp3 as select employee_id,job_id from employees where 1=2;

--q11
INSERT ALL
    INTO Emp2 (employee_id, first_name, salary)
    VALUES (employee_id, first_name, salary)

    INTO Emp3 (employee_id, job_id)
    VALUES (employee_id, job_id)

SELECT employee_id,
       first_name,
       salary,
       job_id
FROM employees;
commit;

--q12
truncate table emp2;
insert into emp2(employee_id,first_name,salary) values(7788,'SMITH',4500),(7654,'JACK',3500);

--q13
commit;

--q14
MERGE INTO Emp2 e2
USING employees e
ON (e2.employee_id = e.employee_id)

WHEN MATCHED THEN
UPDATE SET
    e2.first_name = e.first_name,
    e2.salary = e.salary

WHEN NOT MATCHED THEN
INSERT (employee_id, first_name, salary)
VALUES (e.employee_id, e.first_name, e.salary);

--q15
select * from emp2;

--q16
rollback;

--q17
MERGE INTO Emp2 e2
USING employees e
ON (e2.employee_id = e.employee_id)

WHEN MATCHED THEN
UPDATE SET
    e2.first_name = e.first_name,
    e2.salary = e.salary
WHERE e2.employee_id = 7788

WHEN NOT MATCHED THEN
INSERT (employee_id, first_name, salary)
VALUES (e.employee_id, e.first_name, e.salary)
WHERE e.salary > 3000;

--q18
select * from emp2;

--q19

