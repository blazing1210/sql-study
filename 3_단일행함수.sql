--������ �Լ�

--���� �Լ�
--��ҹ��� �Լ� ��ȯ UPPER   LOWER INITCAP
SELECT UPPER('SQL Course'),LOWER('SQL Course'),INITCAP('S Q L C o u r se') FROM DUAL; --��� �׽�Ʈ�� ���̺��� �̿��Ͽ� ����

--���� ���� �Լ�
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','D') FROM DUAL;
SELECT TRIM('  ��ο�  '),'  ��ο�  ' FROM DUAL; --������ �����ش�.
--��������

SELECT department_id,last_name, department_id
FROM employees
WHERE lower(last_name)='higgins';
SELECT department_id, last_name, email
FROM employees
WHERE INITCAP(email) = 'Sking';
SELECT last_Name, CONCAT('�������� ', job_id) AS ������
FROM employees
WHERE SUBSTR(job_id,4,3)='REP';
SELECT last_name, SUBSTR(last_name,-1,1)
FROM employees;
SELECT employee_id,
    CONCAT(first_name,last_name) ��ü�̸�,
    last_name,
    LENGTH(last_name) ����,
    INSTR(last_Name,'a')"'a'�� ���°?"
FROM employees;
SELECT first_name, last_name,UPPER(CONCAT(first_name,SUBSTR(last_name,1,3))) �̸��ռ�
    FROM employees
    WHERE department_id=60;
--TLANSLATE
SELECT job_id, TRANSLATE(job_id,'ACCOUNT','ACCNT') ������
FROM employees;
--����1,2
SELECT last_name �̸�, LOWER(last_name) LOWER����,UPPER(last_name)UPPER����,email �̸���,INITCAP(email) INITCAP����
FROM employees;
SELECT job_id ������,SUBSTR(job_id,1,2) ���ǵΰ�
FROM employees;
--������ �Լ�
--�ݿø� �Լ�
SELECT ROUND(15.193),ROUND(15.193,0),ROUND(15.193,1),ROUND(15.193,2) FROM DUAL;
SELECT employee_id ¦����°,last_name
FROM employees
WHERE MOD (employee_id,2)=0
ORDER BY 1;

SELECT salary SALARY, ROUND(salary/30,0) ���� , ROUND(salary/30,1) �Ҽ�1 , ROUND(salary/30,-1) "10���ڸ�"
FROM employees