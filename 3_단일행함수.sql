--단일행 함수

--문자 함수
--대소문자 함수 변환 UPPER   LOWER INITCAP
SELECT UPPER('SQL Course'),LOWER('SQL Course'),INITCAP('S Q L C o u r se') FROM DUAL; --듀얼 테스트용 테이블을 이용하여 연습

--문자 조작 함수
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','C') FROM DUAL;
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
FROM employees;
--날짜형 함수
SELECT SYSDATE
FROM DUAL;
--일은 시간이 12시 이상이면 반올림
SELECT SYSDATE 현재날짜, ROUND(sysdate,'DD') 일, ROUND(sysdate,'MM') 월,round(sysdate,'YY')
                ,ROUND(MONTHS_BETWEEN('2021/10/5','2021/06/10')) 월차이
FROM DUAL;
--날짜에 더하기 빼기를 하면 => 실제 날짜가 더하거나 빼진다.
SELECT sysdate 오늘날짜, sysdate+1 내일, sysdate-1 어제
FROM dual;
--예제1,2
SELECT sysdate, hire_date , MONTHS_BETWEEN(sysdate,hire_date)
FROM employees
WHERE department_id=100;
SELECT hire_date,ADD_MONTHS(hire_date,3),ADD_MONTHS(hire_date,-3)
FROM employees
WHERE employee_id between 100 and 106;
--변환형 함수
--숫자 =>문자로 변환
SELECT 
    TO_CHAR(12345678,'999,999,999') 콤마형식,
    TO_CHAR(12345678.678,'999,999,999.99') 콤마소수점형식 ,
    TO_CHAR(12345678,'$999,999,999') 통화로표시,
    TO_CHAR(12345678,'L999,999,999') 로컬통화,
    TO_CHAR(12345678,'XXXXXXX') 
FROM DUAL;
---날짜 =>문자로 변환
SELECT
    TO_CHAR(SYSDATE,'YYYY-MM-DD') 날짜표시,
    TO_CHAR(SYSDATE,'YYYY/MM/DD HH:MI:SS')
FROM DUAL;
--예제1,2
SELECT employee_id,TO_CHAR(hire_date,'mm/yy') 입사월
FROM employees
WHERE department_id=100;
SELECT first_name 이름,TO_CHAR(salary,'$999,999,999.99') 월급
FROM employees
WHERE salary>10000
ORDER BY salary desc;
-- 날짜변환 숫자변환
SELECT TO_DATE('2011.01.01','YY.MM.DD')
FROM DUAL;
SELECT TO_NUMBER('0123')+100
FROM DUAL;
--널값 함수 NVL(값,0) 
--만약 값이 NULL이면 0으로 변환해주는 함수
SELECT last_name, NVL(manager_id,0) 매니저
FROM employees WHERE last_name='King';
--널값 함수 NVL2(값,첫번째,두번째)만약값이 널값이 아니면 천번쨰 아니면 주번째 
SELECT last_name 이름, NVL2(manager_id,1,0) 매니저
FROM employees WHERE last_name='King';
SELECT last_name 이름, salary 월급,NVL(commission_pct,0) 커미션
,(salary*12)+(salary*12*NVL(commission_pct,0)) 연봉
FROM employees
ORDER BY (salary*12)+(salary*12*NVL(commission_pct,0)) DESC;
SELECT last_name 이름,salary 월급, NVL(commission_pct,0) 커미션,(salary*12)+(salary*12*NVL(commission_pct,0)) 연봉,
NVL2(COMMISSION_PCT,'SAL+COMM','SAL') 연봉계산
FROM employees
ORDER BY 연봉 DESC;
--DECODE 함수
SELECT last_name 이름, job_id ,salary,
DECODE(job_id, 'IT_PROG', salary*1.10,
               'ST_CLERK',salary*1.15,
               'SA_REP', salary*1.20,
                        salary) 수정월급
FROM EMPLOYEES;
--예제1
SELECT last_name 이름, job_id 직무, salary 월급,
DECODE(TRUNC(salary/2000),0,0,
              1,0.09, 
              2,0.20,              
              3,0.30,  
              4,0.40, 
              5,0.42, 
              6,0.44, 
                0.45 ) 세율
FROM employees;
SELECT last_name 이름, job_id, salary,
        CASE job_id WHEN 'IT_PROG' THEN salary *1.10
                    when 'ST_CLERK' THEN SALARY *1.15
                    WHEN 'SA-REP' THEN SALARY*1.20
                    ELSE SALARY
                    END "월급 수정"
FROM employees;

SELECT employee_id,first_name,last_name,salary,
            CASE  WHEN SALARY>=9000 THEN '상위급여'
            WHEN SALARY>=6000 THEN '중위급여'
            ELSE '하위급여' END "급여등급"
FROM EMPLOYEES
WHERE job_id='IT_PROG';
    