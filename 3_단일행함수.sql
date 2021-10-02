--단일행 함수

--문자 함수
--대소문자 함수 변환 UPPER   LOWER INITCAP
SELECT UPPER('SQL Course'),LOWER('SQL Course'),INITCAP('S Q L C o u r se') FROM DUAL; --듀얼 테스트용 테이블을 이용하여 연습

--문자 조작 함수
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','D') FROM DUAL;
SELECT TRIM('  헬로우  '),'  헬로우  ' FROM DUAL; --공백을 없애준다.
--예제문제

SELECT department_id,last_name, department_id
FROM employees
WHERE lower(last_name)='higgins';
SELECT department_id, last_name, email
FROM employees
WHERE INITCAP(email) = 'Sking';
SELECT last_Name, CONCAT('직업명이 ', job_id) AS 직업명
FROM employees
WHERE SUBSTR(job_id,4,3)='REP';
SELECT last_name, SUBSTR(last_name,-1,1)
FROM employees;
SELECT employee_id,
    CONCAT(first_name,last_name) 전체이름,
    last_name,
    LENGTH(last_name) 길이,
    INSTR(last_Name,'a')"'a'가 몇번째?"
FROM employees;
SELECT first_name, last_name,UPPER(CONCAT(first_name,SUBSTR(last_name,1,3))) 이름합성
    FROM employees
    WHERE department_id=60;
--TLANSLATE
SELECT job_id, TRANSLATE(job_id,'ACCOUNT','ACCNT') 적용결과
FROM employees;
--예제1,2
SELECT last_name 이름, LOWER(last_name) LOWER적용,UPPER(last_name)UPPER적용,email 이메일,INITCAP(email) INITCAP적용
FROM employees;
SELECT job_id 직업명,SUBSTR(job_id,1,2) 앞의두개
FROM employees;
--숫자형 함수
--반올림 함수
SELECT ROUND(15.193),ROUND(15.193,0),ROUND(15.193,1),ROUND(15.193,2) FROM DUAL;
SELECT employee_id 짝수번째,last_name
FROM employees
WHERE MOD (employee_id,2)=0
ORDER BY 1;

SELECT salary SALARY, ROUND(salary/30,0) 정수 , ROUND(salary/30,1) 소수1 , ROUND(salary/30,-1) "10의자리"
FROM employees