select sysdate as current_date from dual;

select employee_id,last_name,salary,round(salary*15.5/100) as new_salary from employees;

select employee_id,last_name,salary,round(salary*15.5/100) as new_salary,round(salary*15.5/100)-salary as increase from employees;

select initcap(first_name) as Employee_name,length(first_name) as length from employees where first_name like 'J%' or first_name like 'A%' or first_name like 'M%' order by first_name;

select last_name from employees where last_name like upper(&letter)||'%';

select first_name,last_name,round(months_between(sysdate,hire_date)) as MONTHS_WORKED from employees order by months_worked;

select first_name || ' earns ' || salary || 'monthly but wants' || salary*3 as DreamSalary from employees;

select last_name,lpad('salary',15,'$') as SALARY from employees;

SELECT last_name,
       TO_CHAR(hire_date,'fmDay, DDth Month, YYYY') AS "Hire Date",
       TO_CHAR(
           NEXT_DAY(ADD_MONTHS(hire_date,6),'MONDAY'),
           'fmDay, DDth Month, YYYY'
       ) AS REVIEW
FROM employees;

SELECT last_name,hire_date,TO_CHAR(hire_date,'Day') AS DAY FROM employees ORDER BY TO_CHAR(hire_date,'D');

select last_name,nvl(to_char(commission_pct),'no commission') as comm from employees;

select substr(last_name,1,8) || ' ' || rpad('*',ROUND(salary/1000),'*') as EMPLOYEES_AND_THEIR_SALARIES from employees order by salary DESC;

select first_name,last_name,job_id ,DECODE(job_id,
              'PRESIDENT','A',
              'MANAGER','B',
              'SALESMAN','C',
              'CLERK','D',
              'No Grade') as Grade from employees;

select first_name,last_name,job_id ,case job_id
              when 'PRESIDENT' then 'A'
              when 'MANAGER' then 'B'
              when 'SALESMAN' then 'C'
              when 'CLERK' then 'D'
              else 'No Grade'
              end as Grade from employees;