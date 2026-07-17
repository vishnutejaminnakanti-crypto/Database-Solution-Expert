select job_id as job,sum(decode(department_id,10,salary)) as department_10,
                    sum(decode(department_id,20,salary)) as department_20,
                    sum(decode(department_id,30,salary)) as department_30
from employees where department_id in (10,20,30) group by job_id order by job_id;

select to_char(department_id) as department_id, sum(salary) as total_salary from employees group by department_id union all select job_id, sum(salary) from employees group by job_id union all select 'Total', sum(salary) from employees;

select job_id,department_id from employees where department_id=20 union all select job_id,department_id from employees where department_id=10 union all select job_id,department_id from employees where department_id=30;