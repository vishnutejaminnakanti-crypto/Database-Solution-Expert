desc employees;

select * from employees;

select first_name, last_name, salary,commission_pct from employees where commission_pct is not null order by 2,3 desc;

select distinct  * from employees;

select employee_id as Emp#,first_name as Employee,job_id as Job,hire_date as Hired from employees;

select last_name || ' , ' || job_id as employee_job from employees;

select first_name || ' , '|| last_name|| ' , '|| job_id || ' , '|| hire_date || ' , ' || manager_id as THE_OUTPUT from employees;

select first_name,last_name,job_id,hire_date from employees where first_name='SCOTT' OR first_name='TURNER' ORDER BY HIRE_DATE;

select first_name,department_id from employees where department_id in (20,30) order by 2;

select last_name as Employee,salary as Monthly_salary  from employees where salary between 2000 and 3000  and department_id in (20,30);

select last_name,hire_date from employees where extract(year from hire_date) = 1981;

select first_name,last_name,salary from employees where salary>&salary;

select last_name,job_id from employees where manager_id is null;

select employee_id,first_name,last_name,salary,department_id from employees where manager_id=&manager_id order by &column;

select employee_id,first_name,last_name,salary,department_id from employees where manager_id=&manager_id order by &column;

select last_name from employees where last_name like '__A%';

select last_name from employees where last_name like '%A%' and last_name like '%s%';

select first_name,last_name,job_id,salary from employees where job_id='CLERK' and salary IN (800, 950, 1300);