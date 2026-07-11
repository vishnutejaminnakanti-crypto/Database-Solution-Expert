select max(salary) as HighestSalary, min(salary) as LowestSalary, avg(salary) as AverageSalary, sum(salary) as TotalSalary from employees;

select max(salary) as HighestSalary, min(salary) as LowestSalary, round(avg(salary)) as AverageSalary, sum(salary) as TotalSalary from employees;

select  max(salary) as HighestSalary, min(salary) as LowestSalary, round(avg(salary)) as AverageSalary, sum(salary) as TotalSalary from employees group by job_id;

select count(*) as "Number of Employees" from employees;

select count(distinct manager_id) as "Number of Managers" from employees;

select max(salary)-min(salary) as Difference from employees;

select manager_id,min(salary) AS Lowest_Salary FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id HAVING min(salary) > 2000 ORDER BY min(salary) DESC;

select  COUNT(*) AS Total_Employees,SUM(CASE WHEN EXTRACT(YEAR FROM hire_date)=1980 THEN 1 ELSE 0 END) AS "1980",SUM(CASE WHEN EXTRACT(YEAR FROM hire_date)=1981 THEN 1 ELSE 0 END) AS "1981",SUM(CASE WHEN EXTRACT(YEAR FROM hire_date)=1982 THEN 1 ELSE 0 END) AS "1982" FROM employees;