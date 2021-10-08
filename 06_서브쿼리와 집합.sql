--서브쿼리
--주의점:단인행 서브쿼리를 사욯할때는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력되어야한다.
select *
from employees
where hire_date>(select hire_date from employees where last_name='Popp');

--그룹함수의 결과를 서브쿼리로 사용
select last_name 이름, job_id 직종, salary 급여
from employees
where salary=(select min(salary)from employees);
--예제
select last_name, salary
from employees
where salary>(select salary from employees where last_name='Abel');

select employee_id 직원번호, last_name 이름,department_id 부서번호,salary 급여
from employees
where salary>(select salary from employees where last_name='Bull');

select last_name,salary, manager_id
from employees
where manager_id=(select employee_id from employees where last_name='Russell');

select *
from employees
where job_id=(select job_id from jobs where job_title='Stock Manager');

select *
from jobs;

--다중행 서브쿼리 (서브쿼리 결과가 여러개의 행으로 출력)
select MIN(salary) from employees group by department_id;
--다중행 서브쿼리에세는 바로 =>< 비교를 할 수 없음
select department_id,employee_id, last_name,salary
from employees
where salary in (select MIN(salary) from employees group by department_id)
order by department_id;
--ANY 도 같이 하나라도 맞으면 검색
select department_id,last_name,salary
from employees
where salary < ANY (select salary from employees WHERE job_id='IT_PROG')
AND job_id!='IT_PROG'
order by SALARY DESC;

select department_id,last_name,salary
from employees
where salary < all (select salary from employees WHERE job_id='IT_PROG')
AND job_id!='IT_PROG'
order by SALARY DESC;
--예제 1,2,3
select employee_id,first_name,job_id,salary
from employees
where manager_id in(select manager_id from employees where department_id=20)and
department_id!=20;

select employee_id,last_name,job_id,salary
from employees
where salary<any(select salary from employees where job_id='ST_MAN');

select employee_id,last_name,job_id,salary
from employees
where salary<all(select salary from employees where job_id='IT_PROG');

--다중열 서브쿼리 (열이 여러개일때)
--이름이 브루스인 직원과 같은 매니저, 같은직업인  직원들을 출력한다
select *
from employees
where (manager_id,job_id)IN (select manager_id, job_id from employees where first_name='Bruce')
    AND first_name != 'Bruce';
--예제1,2
select first_name,job_id,salary,department_id
from employees
where (job_id,salary) in (select job_id,MIN(salary) from employees group by job_id)
order by salary desc;
