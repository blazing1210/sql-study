--DDL ���̺� ���� ���� ����
--���̺� ����
create TABLE �׽�Ʈ(
    ���ڿ� VARCHAR2(6),
    ���� NUMBER,
    ��¥ DATE
);
DESC �׽�Ʈ;
SELECT * FROM �׽�Ʈ;
--������ �Է�
INSERT INTO �׽�Ʈ VALUES('HTML',5,'2021-10-8');
INSERT INTO �׽�Ʈ VALUES('CSS',3,SYSDATE);

--���̺� ����

DROP TABLE �׽�Ʈ;

create TABLE �׽�Ʈ(
    ���ڿ� VARCHAR2(100),
    ���� NUMBER,
    ��¥ DATE DEFAULT SYSDATE
);

INSERT INTO �׽�Ʈ VALUES('HTML',5,'2021-10-8');
INSERT INTO �׽�Ʈ VALUES('CSS',3,SYSDATE);
INSERT INTO �׽�Ʈ(���ڿ�,����) VALUES('�ڹ�',7);

--���� ���̺� �����ؼ� ����� ���
--������������
CREATE TABLE EMP_TEMP
AS
SELECT * FROM employees WHERE 1<>1;
select* from emp_temp;
desc emp_temp;
--80���μ��������鸸 ���� ���̺� ����
CREATE TABLE EMP80
AS
SELECT employee_id ������ȣ,last_name �̸�, salary ����, salary*12 ����, hire_date �����
from employees where department_id=80;

desc emp80;
select * from emp80;

--����

CREATE TABLE stmans
AS
SELECT employee_id ID,job_id JOB, salary SAL
FROM employees where job_id='ST_MAN';
select * from stmans;
