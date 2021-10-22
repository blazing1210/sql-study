--뷰는 가상의 테이블

--단순한 뷰 만들기
CREATE VIEW EMP_V1(직원번호,이름,성,이메일,고용일,직종)
AS
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID
FROM EMPLOYEES;
SELECT * FROM EMP_V1;
drop view emp_v1;
--테이블 삭제
DROP TABLE 학생;

--뷰에 데이터를 입력(실제 테이블이 아니기 때문에 실제로는 테이블에 입력)
insert into emp_v1(직원번호,이름,성,이메일,고용일,직종)
values(333,'펭수','김','Peng',sysdate,'IT_PROG');
select * from employees;

--복잡한 뷰만들기
--그룹함수를 쓴 뷰는 DML(입력 수정 삭제)등 불가
CREATE or replace view 부서별_직원_보고서
AS
SELECT department_id 부서번호,count(*) 직원수,max(salary) 최고급여, min(salary)최저급여,ROUND(avg(salary),0) 평균급여
FROM employees
GROUP BY department_id
ORDER BY department_id;

select * from 부서별_직원_보고서;
--단순한 뷰 만들기

CREATE or replace VIEW EMP90_read(직원번호,이름,성,이메일,고용일,직종)
AS
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID
FROM EMPLOYEES
where DEPARTMENT_ID=90
with read only;
---DML작업이 안됨
DELETE FROM emp90_read;;


