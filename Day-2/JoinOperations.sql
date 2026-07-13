select employee_id,first_name,salary,department_name,city from employees natural join departments natural join locations;

select job_id,manager_id,salary,commission_pct,department_name from employees e join departments d on e.department_id = d.department_id where e.job_id = 'SA_MAN';

SELECT first_name,
       job_id,
       e.department_id,
       department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE city = 'DALLAS';

SELECT e.first_name AS Employee,
       e.employee_id AS "Emp#",
       m.first_name AS Manager,
       m.employee_id AS "Mgr#"
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

SELECT e.first_name AS Employee,
       e.employee_id AS "Emp#",
       m.first_name AS Manager,
       m.employee_id AS "Mgr#"
FROM employees e
LEFT OUTER JOIN employees m
ON e.manager_id = m.employee_id
ORDER BY e.employee_id;

CREATE TABLE salgrade (
    grade NUMBER,
    losal NUMBER,
    hisal NUMBER
);
INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,99999);

COMMIT;
SELECT first_name,
       job_id,
       department_name,
       salary,
       grade
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN salgrade s
ON e.salary BETWEEN s.losal AND s.hisal;

SELECT first_name,
       department_name
FROM employees
RIGHT OUTER JOIN departments
ON employees.department_id = departments.department_id;

SELECT e.first_name AS Employee,
       e.hire_date,
       m.first_name AS Manager,
       m.hire_date AS Manager_Hire_Date
FROM employees e
LEFT OUTER JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;

SELECT employee_id,
       first_name,
       department_name,
       city
FROM employees
JOIN departments
USING(department_id)
JOIN locations
USING(location_id)
WHERE job_id = 'CLERK';

SELECT e.first_name,
       e.salary,
       e.manager_id,
       d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > 2000;

SELECT employee_id,
       first_name,
       job_id,
       e.department_id,
       department_name,
       city
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id;

SELECT first_name,
       department_name
FROM employees
RIGHT OUTER JOIN departments
ON employees.department_id = departments.department_id;

SELECT employee_id,
       department_name,
       city
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id
FULL OUTER JOIN locations l
ON d.location_id = l.location_id;