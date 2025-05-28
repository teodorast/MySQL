-- part 2
-- 9
use soft_uni;
select concat(first_name,' ',middle_name,' ',last_name) as "Full Name"
from employees
where salary = 25000 or salary = 14000 or salary = 12500 or salary = 23600;

-- 10 
select first_name, last_name
from employees
where manager_id is NULL;

-- 11
select first_name, last_name, salary
from employees
where salary >50000
order by salary desc;

-- 12
select first_name, last_name
from employees
order by salary desc
limit 5;

-- 13
select first_name, last_name
from employees
where department_id != 4;


-- 14
SELECT *
FROM employees
ORDER BY
    salary DESC,            
    first_name ASC,         
    last_name DESC,        
    middle_name ASC;     
    
-- 15 
CREATE VIEW v_employees_salaries AS
SELECT first_name, last_name, salary
FROM employees;

-- 16
CREATE VIEW v_employees_job_titles AS
SELECT 
    CONCAT(first_name, ' ', 
           COALESCE(middle_name, ''), 
           CASE 
               WHEN middle_name IS NOT NULL THEN ' ' 
               ELSE '' 
           END,
           last_name) AS full_employee_name,
    job_title
FROM employees;

-- 17
select distinct job_title
from employees
order by job_title;

-- 18
select * from projects
order by start_date, name
limit 10;

-- 19 
select first_name, last_name,hire_date from employees
order by hire_date desc
limit 7;

-- 20
UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN (1,2,4,11);
select salary from employees;

use geography;
-- 21 
select peak_name from peaks
order by peak_name;

-- 22
select country_name, population
from countries
where continent_code = 'EU'
order by population desc, 
	country_name asc
limit 30;


-- 23 
select country_name, country_code,
case 
	when currency_code = 'EUR' then 'Euro'
    else 'Not Euro'
    end as currency
from countries

order by country_name;
use diablo;
-- 24 
select name from characters
order by name;























