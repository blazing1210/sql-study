SELECT *
FROM EMPLOYEES
WHERE SALARY>14000;

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME='King';

SELECT *
FROM employees
WHERE HIRE_DATE < '2002/06/10';
--����1,2,3,4,5
select *
FROM EMPLOYEES
where employee_id=100;
select *
FROM EMPLOYEES
where first_name='David';
select *
FROM EMPLOYEES
where employee_id<105;
select *
FROM JOB_HISTORY
where START_DATE>'2006/3/3';
select *
from DEPARTMENTS
where LOCATION_ID!=1700;
--�� ������ and or not
select last_name, department_id,salary
from EMPLOYEES
where (department_id=60
    or DEPARTMENT_ID=80)
    and salary>10000;
select *
from employees
where salary in (4000,3000,2700);
--����1,2
select *
from employees
where salary in (10000,17000,24000);
select *
from employees
where not department_id in (30,50,80,100,110);
--between ���̰�
select* FROM employees WHERE salary BETWEEN 9000 AND 10000;
--����1,2,3,
select* FROM employees WHERE salary BETWEEN 10000 AND 20000;
SELECT* FROM employees WHERE hire_date BETWEEN '2004.1.1' AND '2004.12.30';
SELECT* FROM employees WHERE salary NOT BETWEEN 7000 AND 17000;
--LIKE ������ _ %�� ���� ����Ͽ� ���ڿ��� �˻�
SELECT* FROM employees WHERE last_name LIKE 'B%';--�빮�� B�� ���� �ڿ��� �������
SELECT* FROM employees WHERE last_name LIKE '%b%';-- ���ڿ��� �߰��� b�� ������ ���� ���
SELECT* FROM employees WHERE last_name LIKE '____y';--��ٹ� ��Ȯ�� �ڸ����� ǥ��
--���� 1,2,3
SELECT* FROM employees WHERE job_id LIKE '%AD%';
SELECT* FROM employees WHERE job_id LIKE 'AD___';
SELECT* FROM employees WHERE phone_number LIKE '%1234';
SELECT* FROM employees WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';
SELECT* FROM employees WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';
--IS NULL,ORDER BY
SELECT commission_pct FROM employees;
SELECT*FROM employees WHERE commission_pct is NULL;
SELECT*FROM employees WHERE commission_pct is not NULL;
