--������ �Լ�

--���� �Լ�
--��ҹ��� �Լ� ��ȯ UPPER   LOWER INITCAP
SELECT UPPER('SQL Course'),LOWER('SQL Course'),INITCAP('S Q L C o u r se') FROM DUAL; --��� �׽�Ʈ�� ���̺��� �̿��Ͽ� ����

--���� ���� �Լ�
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','C') FROM DUAL;
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
FROM employees;
--��¥�� �Լ�
SELECT SYSDATE
FROM DUAL;
--���� �ð��� 12�� �̻��̸� �ݿø�
SELECT SYSDATE ���糯¥, ROUND(sysdate,'DD') ��, ROUND(sysdate,'MM') ��,round(sysdate,'YY')
                ,ROUND(MONTHS_BETWEEN('2021/10/5','2021/06/10')) ������
FROM DUAL;
--��¥�� ���ϱ� ���⸦ �ϸ� => ���� ��¥�� ���ϰų� ������.
SELECT sysdate ���ó�¥, sysdate+1 ����, sysdate-1 ����
FROM dual;
--����1,2
SELECT sysdate, hire_date , MONTHS_BETWEEN(sysdate,hire_date)
FROM employees
WHERE department_id=100;
SELECT hire_date,ADD_MONTHS(hire_date,3),ADD_MONTHS(hire_date,-3)
FROM employees
WHERE employee_id between 100 and 106;
--��ȯ�� �Լ�
--���� =>���ڷ� ��ȯ
SELECT 
    TO_CHAR(12345678,'999,999,999') �޸�����,
    TO_CHAR(12345678.678,'999,999,999.99') �޸��Ҽ������� ,
    TO_CHAR(12345678,'$999,999,999') ��ȭ��ǥ��,
    TO_CHAR(12345678,'L999,999,999') ������ȭ,
    TO_CHAR(12345678,'XXXXXXX') 
FROM DUAL;
---��¥ =>���ڷ� ��ȯ
SELECT
    TO_CHAR(SYSDATE,'YYYY-MM-DD') ��¥ǥ��,
    TO_CHAR(SYSDATE,'YYYY/MM/DD HH:MI:SS')
FROM DUAL;
--����1,2
SELECT employee_id,TO_CHAR(hire_date,'mm/yy') �Ի��
FROM employees
WHERE department_id=100;
SELECT first_name �̸�,TO_CHAR(salary,'$999,999,999.99') ����
FROM employees
WHERE salary>10000
ORDER BY salary desc;
-- ��¥��ȯ ���ں�ȯ
SELECT TO_DATE('2011.01.01','YY.MM.DD')
FROM DUAL;
SELECT TO_NUMBER('0123')+100
FROM DUAL;
--�ΰ� �Լ� NVL(��,0) 
--���� ���� NULL�̸� 0���� ��ȯ���ִ� �Լ�
SELECT last_name, NVL(manager_id,0) �Ŵ���
FROM employees WHERE last_name='King';
--�ΰ� �Լ� NVL2(��,ù��°,�ι�°)���ప�� �ΰ��� �ƴϸ� õ���� �ƴϸ� �ֹ�° 
SELECT last_name �̸�, NVL2(manager_id,1,0) �Ŵ���
FROM employees WHERE last_name='King';
SELECT last_name �̸�, salary ����,NVL(commission_pct,0) Ŀ�̼�
,(salary*12)+(salary*12*NVL(commission_pct,0)) ����
FROM employees
ORDER BY (salary*12)+(salary*12*NVL(commission_pct,0)) DESC;
SELECT last_name �̸�,salary ����, NVL(commission_pct,0) Ŀ�̼�,(salary*12)+(salary*12*NVL(commission_pct,0)) ����,
NVL2(COMMISSION_PCT,'SAL+COMM','SAL') �������
FROM employees
ORDER BY ���� DESC;
--DECODE �Լ�
SELECT last_name �̸�, job_id ,salary,
DECODE(job_id, 'IT_PROG', salary*1.10,
               'ST_CLERK',salary*1.15,
               'SA_REP', salary*1.20,
                        salary) ��������
FROM EMPLOYEES;
--����1
SELECT last_name �̸�, job_id ����, salary ����,
DECODE(TRUNC(salary/2000),0,0,
              1,0.09, 
              2,0.20,              
              3,0.30,  
              4,0.40, 
              5,0.42, 
              6,0.44, 
                0.45 ) ����
FROM employees;
SELECT last_name �̸�, job_id, salary,
        CASE job_id WHEN 'IT_PROG' THEN salary *1.10
                    when 'ST_CLERK' THEN SALARY *1.15
                    WHEN 'SA-REP' THEN SALARY*1.20
                    ELSE SALARY
                    END "���� ����"
FROM employees;

SELECT employee_id,first_name,last_name,salary,
            CASE  WHEN SALARY>=9000 THEN '�����޿�'
            WHEN SALARY>=6000 THEN '�����޿�'
            ELSE '�����޿�' END "�޿����"
FROM EMPLOYEES
WHERE job_id='IT_PROG';
    