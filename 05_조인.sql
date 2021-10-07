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
--외부조인
select e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
from employees e join departments d on e.department_id=d.department_id;

--LEFT 외부 조인 : 직원 테이블중 부서가없는 직원도 출력
select e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
from employees e left outer join departments d on e.department_id=d.department_id;
--right 외부 조인 : 부서테이블에 있지만 직원테이블에서 사용하지 않는 부서도 전부출력됌
select e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
from employees e right outer join departments d on e.department_id=d.department_id;
--full 외부조인
select e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
from employees e full outer join departments d on e.department_id=d.department_id;
select c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호,l.city 도시
from countries c left outer join locations l on c.country_id = l.country_id
order by l.location_id desc;

select country_name 국가,region_name 지역이름
from countries
cross join regions;
