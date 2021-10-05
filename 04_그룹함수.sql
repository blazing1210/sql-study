--그룹함수 (다중행함수 ,집계함수)
SELECT ROUND(AVG(salary)) 평균값,MAX(salary) 최댓값,MIN(salary) 최솟값,SUM(salary) 합계,count(salary) 갯수
FROM employees
WHERE job_id LIKE '%REP%';

SELECT count(*) FROM employees;

SELECT count(*) 
FROM employees
WHERE department_id=80;
SELECT COUNT(DISTINCT department_id)
FROM EMPLOYEES;--중복되지않은 부서의개수

SELECT AVG(commission_pct)
FROM employees; --널값을 제외한 모든직원들

--group by 절: 특정 그룹으로 나누어서 그룹함수를 사용.
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 부서번호 DESC;

SELECT *
FROM employees
WHERE department_id is null;
--예제1,2,3
SELECT department_id 부서명, count(department_id) 사원수, max(salary) 최고급여,min(salary) ㅊ최소급여,
SUM(salary)급여합계,ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

SELECT department_id 부서번호,job_id 직업,SUM(salary) 월급합계,count(job_id) 직원수
FROM employees
GROUP BY department_id,job_id order by department_id;

SELECT ROUND(AVG(MAX(salary))),AVG(MIN(salary))
FROM employees
GROUP BY department_id;
--그룹함수의 조건절
SELECT DEPARTMENT_ID 부서명, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*)>5;
--예제 1,2
SELECT job_id 직종, SUM(salary) 월급여합계
from employees where job_id!='AC_MGR'
group by job_id
having avg(salary)>10000
order by 월급여합계 desc;
SELECT department_id 부서번호, ROUND(avg(salary))평균급여
from employees
where department_id!=40
group by department_id
having avg(salary)<=7000;

SELECT job_id, sum(salary) 급여총액
from employees
where job_id not LIKE('%REP%')
group by job_id
having sum(salary)>13000 order by 급여총액 desc;
