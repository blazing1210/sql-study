--DDL 테이블 생성 수정 삭제
--테이블 생성
create TABLE 테스트(
    문자열 VARCHAR2(6),
    숫자 NUMBER,
    날짜 DATE
);
DESC 테스트;
SELECT * FROM 테스트;
--데이터 입력
INSERT INTO 테스트 VALUES('HTML',5,'2021-10-8');
INSERT INTO 테스트 VALUES('CSS',3,SYSDATE);

--테이블 삭제

DROP TABLE 테스트;

create TABLE 테스트(
    문자열 VARCHAR2(100),
    숫자 NUMBER,
    날짜 DATE DEFAULT SYSDATE
);

INSERT INTO 테스트 VALUES('HTML',5,'2021-10-8');
INSERT INTO 테스트 VALUES('CSS',3,SYSDATE);
INSERT INTO 테스트(문자열,숫자) VALUES('자바',7);

--기존 테이블 복사해서 만드는 방법
--열구조만복사
CREATE TABLE EMP_TEMP
AS
SELECT * FROM employees WHERE 1<>1;
select* from emp_temp;
desc emp_temp;
--80번부서의직원들만 따로 테이블 생성
CREATE TABLE EMP80
AS
SELECT employee_id 직원번호,last_name 이름, salary 월급, salary*12 연봉, hire_date 고용일
from employees where department_id=80;

desc emp80;
select * from emp80;

--예제

CREATE TABLE stmans
AS
SELECT employee_id ID,job_id JOB, salary SAL
FROM employees where job_id='ST_MAN';
select * from stmans;
