-- Built-in functions 
-- 1
use soft_uni;
select first_name, last_name
from employees
where substring(first_name, 1,2) ='Sa';

-- 2
select first_name, last_name
from employees
where last_name like '%ei%'
order by employee_id;

select * from employees;
-- 3
select first_name
from employees 
where (department_id = 3 or department_id = 10) 
and substring(hire_date,1,4) >= 1995 and substring(hire_date,1,4)<=2005
order by employee_id;

-- 4
select first_name,last_name 
from employees 
where job_title not like '%engineer%'
order by employee_id;

-- 5 
select name
from towns
where length(name) = 5 or length(name) = 6
order by name;

-- 6
SELECT *
FROM towns
WHERE UPPER(name) NOT LIKE 'R%' 
  and UPPER(name) NOT LIKE 'B%' 
  and UPPER(name) NOT LIKE 'D%'
ORDER BY name ASC;

-- 8 
create view v_employees_hired_after_2000 as 
select first_name,last_name 
from employees
where substring(hire_date,1,4) >2000;
select * from v_employees_hired_after_2000;

-- 9
select first_name, last_name
from employees
where length(last_name)=5;

-- 10
select country_name, iso_code
from countries
where country_name like '%a%a%a%'
order by iso_code;

-- 11
select peak_name,river_name,
concat(lower(peak_name),substring(lower(river_name),2)) as mix
from peaks,rivers
where right(peak_name,1) = left(river_name,1)
order by mix;

use diablo;
-- 12
select name, date_format(start, '%Y-%m-%d') as start
from games
where substring(start,1,4) between 2011 and 2012
order by start
limit 50;

-- 13 
select user_name, substring(email,locate('@',email )+1) as email_provider
from users
order by email_provider,user_name;

-- 14
select user_name,ip_address
from users
where ip_address like "___.1%.%.___"
order by user_name;

-- 15 
select * from games;
select name, 
case 
	when hour(start) between 0 and 11 then 'Morning'
    when hour(start) between 12 and 17 then 'Afternoon'
	else 'Evening'
end as 'Part of the Day',
case 
	when duration <=3 then 'Extra Short'
    when duration between 3 and 6  then 'Short'
    when duration between 6 and 10 then 'Long'
    else 'Extra Long'
end as 'Duration'
from games;

-- 16 
select product_name,order_date,
date_add(order_date, interval 3 day) as pay_due,
date_add(order_date, interval 1 month) as delivery_due
from orders;



