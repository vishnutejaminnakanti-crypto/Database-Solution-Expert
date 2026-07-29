----q1
select employee_id,first_name,department_id from employees where employee_id in (select employee_id from employees where first_name='Steven');

--q2
select * from employees where salary > (select avg(salary) from employees);

--q3
select first_name,job_id from employees where exists (select * from employees where job_id='manager');

--q4
select * from employees where salary < all(select min(salary) from employees where department_id=10);

--q5
SELECT employee_id,
       first_name,
       last_name,
       department_id,
       manager_id
FROM employees
WHERE department_id = (
        SELECT department_id
        FROM employees
        WHERE first_name = 'Neena'
      )
AND manager_id = (
        SELECT manager_id
        FROM employees
        WHERE first_name = 'Neena'
      )
AND first_name <> 'Neena';

--q6
select employee_id,first_name,last_name from employees where department_id in (select department_id from employees where first_name like '%R%');

--q7
SELECT employee_id,
       first_name,
       last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = (
        SELECT location_id
        FROM locations
        WHERE city = 'New York'
    )
);

--q8
SELECT employee_id,
       first_name,
       last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = (
        SELECT location_id
        FROM locations
        WHERE city = '&city'
    )
);

--q9
SELECT first_name,
       last_name,
       salary
FROM employees
WHERE manager_id = (
    SELECT employee_id
    FROM employees
    WHERE last_name = 'King'
);

--q10
select * from employees where department_id=(select department_id from employees where first_name='JAMES');

--q11
SELECT employee_id,
       first_name,
       salary,
       department_id
FROM employees e
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

--q12
SELECT d.location_id,
       AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.location_id;

--q13
SELECT *
FROM (
    SELECT employee_id,
           first_name,
           salary
    FROM employees
    ORDER BY salary
)
WHERE ROWNUM <= 5;

--q14
SELECT e1.employee_id,
       e1.first_name,
       e1.last_name
FROM employees e1
WHERE 5 > (
    SELECT COUNT(*)
    FROM employees e2
    WHERE e2.employee_id > e1.employee_id
)
ORDER BY e1.employee_id DESC;

--q15
SELECT employee_id,
       first_name,
       last_name,
       department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = (
        SELECT location_id
        FROM locations
        WHERE city = 'Dallas'
    )
)
ORDER BY first_name;

--q16
SELECT e.employee_id,
       e.first_name,
       e.salary,
       d.avg_salary
FROM employees e,
(
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) d
WHERE e.department_id = d.department_id
AND e.salary < d.avg_salary;

--q17
WITH dept_sal AS (
    SELECT department_id,
           SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
),
avg_sal AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT d.location_id
FROM departments d
JOIN dept_sal ds
ON d.department_id = ds.department_id
CROSS JOIN avg_sal a
WHERE ds.total_salary < a.avg_salary;
