SELECT*
FROM departments;

SELECT department_id, department_name
FROM departments;
SELECT employee_id,first_name,last_name
FROM employees;
--3.��Ī ���̱� (�����̸�)
select department_id as �μ���ȣ, department_name �μ��̸�
from departments;
--4.���������(+-*/)
select  first_name �̸�,job_id ��å, salary ����,salary-100 ���޼���
from employees;
--������ 10% �谨
select  first_name �̸�,job_id ��å, salary ����,salary-salary/10 ���޼���
from employees;
select  first_name �̸�,job_id ��å, salary ����,(salary-1000)*0.05 AS ���ʽ�
from employees;
--distinct :�ߺ����� ����!
select distinct job_id
from employees;
--���� 1,2,3
select employee_id,first_name,last_name
from employees;
select first_name,salary,salary*1.1 AS ��������
from employees;
select employee_id �����ȣ, first_name �̸�, last_name ��
from employees;
--���Ῥ����||
select last_name || ' is a '||job_id AS ��������

from EMPLOYEES;
--����4
select employee_id,FIRST_name|| ' ' ||last_name Ǯ����
,email||'@company.com' �̸���
from EMPLOYEES;

desc employees;
desc department;