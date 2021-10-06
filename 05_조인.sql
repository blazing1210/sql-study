--조인(join)
SELECT  *
from employees JOIN departments
on employees.department_id=departments.department_id;
select e.employee_id, e.last_name,e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id;
select employee_id,city,department_name
from employees e
join departments d
    on e.department_id=d.department_id
join location l
    on d.location_id=l.location_id;
select e.employee_id,e.last_name,d.department_id,d.location_id
from employees e
join departments d
    on e.department_id=d.department_id
    where d.department_id=50
    and e.salary>5000;
select department_name 부서명, city 시티명,country_name 국가명
from departments d
join locations l
    on d.location_id=l.location_id
join countries c
    on c.country_id=l.country_id
where l.city in('Seattle','London')AND c.country_name Like 'United%';    
--자체조인
select e.last_name 직원, m.last_name 매니저
from employees e
join employees m
    on e.manager_id=m.employee_id;
    
