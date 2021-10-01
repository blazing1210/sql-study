SELECT*
FROM departments;

SELECT department_id, department_name
FROM departments;
SELECT employee_id,first_name,last_name
FROM employees;
--3.별칭 붙이기 (열의이름)
select department_id as 부서번호, department_name 부서이름
from departments;
--4.산술연산자(+-*/)
select  first_name 이름,job_id 직책, salary 월급,salary-100 월급수정
from employees;
--월급의 10% 삭감
select  first_name 이름,job_id 직책, salary 월급,salary-salary/10 월급수정
from employees;
select  first_name 이름,job_id 직책, salary 월급,(salary-1000)*0.05 AS 보너스
from employees;
--distinct :중복값을 제거!
select distinct job_id
from employees;
--예제 1,2,3
select employee_id,first_name,last_name
from employees;
select first_name,salary,salary*1.1 AS 뉴샐러리
from employees;
select employee_id 사원번호, first_name 이름, last_name 성
from employees;
--연결연산자||
select last_name || ' is a '||job_id AS 직업정보

from EMPLOYEES;
--예제4
select employee_id,FIRST_name|| ' ' ||last_name 풀네임
,email||'@company.com' 이메일
from EMPLOYEES;

desc employees;
desc department;