--��������

--not null:�ΰ��� �Է¾ȵ�
DESC departments;

--UK ����ũ �ߺ���������
create table emp1(
eno number(3),
emp_name VARCHAR2(20) constraint emp_ename_nn not null,
email varchar2(30),
constraint emp1_emailuk UNIQUE(email)
);
select *
from emp1;
--�����͸� �Է�

insert into emp1 values(208,'Kim','KJS@naver.com');
insert into emp1 values(209,NULL,'ABC@naver.com');--�ΰ��� �Է��Ҽ� ����
insert into emp1 values(210,'Lee','KJS@naver.com');--�ߺ��ȵ� email ����ũ

--check��������
create table emp2(
eno number(3),
emp_name VARCHAR2(20) constraint emp_ename_nn not null,
sal number(10),
constraint emp2_sal_check check (sal>1000));
select *
from emp1;
insert into emp2 values(208,'Kim',1200);
INSERT INTO emp2 VALUES(209,'Lee',900); 
DROP TABLE emp;
create table emp (
    eno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    gno VARCHAR2(13) UNIQUE CHECK (LENGTH(gno)>=8),
    gender VARCHAR2(5) CHECK (gender IN('woman','man'))
);

INSERT INTO emp values(1,'Kim','12345678','man');
INSERT INTO emp VALUES(2,'Kim','123456789','woman');
select * from emp;

CREATE TABLE members (
    member_id NUMBER(2) constraint pri_mem PRIMARY KEY,
    first_name VARCHAR2(50) constraint fir_n_null NOT NULL,
    last_name VARCHAR2(50) constraint last_n_null NOT NULL,
    gender VARCHAR2(5), constraint check_gender check (gender in ('Man','Woman')),
    birth_day DATE  default SYSDATE,
    email VARCHAR2(200) UNIQUE NOT NULL
);
desc members;

--�������� pk fk �⺻Ű �ܷ�Ű ����

--�μ����̺� �����

create table �μ� (
    �μ���ȣ number(4),
    �μ��̸� varchar2(20),
    CONSTRAINT dept_dno_pk PRIMARY KEY(�μ���ȣ)
);
INSERT INTO �μ� VALUES (1,'����');
--INSERT INTO �μ� VALUES (NULL,'ȸ��'); �⺻Ű�� �ΰ��Ǵ� �ߺ����� �Է��� �� ����.
select * from �μ�;

--�ܷ�Ű (FK)
--�ܷ�Ű���� foreign key(���̸�) references �������̺�(������) ��������[on delete cascade/on delete set null]
drop table ����;
create table ���� (
    ������ȣ number(4),
    �̸� varchar2(20),
    ���� number(10),
    �μ���ȣ number(4),
    FOREIGN KEY (�μ���ȣ) REFERENCES �μ�(�μ���ȣ) on delete set null
);
--������ �Է�
insert into �μ� values(1,'����');
insert into �μ� values(2,'�濵');
insert into �μ� values(3,'ȸ��');
select * from �μ�;
insert into ����(������ȣ,�̸�,����,�μ���ȣ) values (100,'ȫ�浿',150,1);
insert into ����(������ȣ,�̸�,����,�μ���ȣ) values (110,'���',100,1);
insert into ����(������ȣ,�̸�,����,�μ���ȣ) values (120,'���̾�',200,null);
select * from ����;
--������ �����߻�
delete from �μ� where �μ���ȣ=1 ;

--���������� �߰��ϴ¹� (1.���̺� ���� 2.�������� �߰�)
create table ����(
    �����ȣ VARCHAR2(2),
    �����̸� VARCHAR2(50)  
);
insert into ���� values('01','�����ͺ��̽�');
insert into ���� values('02','���α׷���');

select * from ����;

create table �л�(
    �й� varchar2(4),
    �̸� varchar2(50),
    �����ȣ varchar2(2)
);
insert into �л� values('0414','ȫ�浿','01');
insert into �л� values('0415','�Ӳ���','02');
insert into �л� values('0416','�̼���','03');
UPDATE �л� SET �����ȣ='01'WHERE �й�='0416';
select * from �л�;
--������� �������� �߰�
alter table ����
add primary key (�����ȣ);

--���������� ��ȸ(���̺� �̸��� ����),'' �ѵ���ǥ �ȿ� �ִ´�.
select * from all_CONSTRAINTS where table_name='�л�';
SELECT * FROM �л�;
SELECT * FROM ����;
ALTER TABLE ���� ADD UNIQUE (�����̸�);

--2. �л� ���̺� �������� �߰�

ALTER TABLE �л� ADD PRIMARY KEY (�й�);
ALTER TABLE �л� MODIFY �̸� NOT NULL;
--�ܷ�Ű �߰�
ALTER TABLE �л� ADD FOREIGN KEY (�����ȣ) REFERENCES ���� (�����ȣ);
ALTER TABLE ���� DROP PRIMARY KEY CASCADE; 
ALTER TABLE ���� DROP CONSTRAINT SYS_C007135;
ALTER TABLE �л� DROP CONSTRAINT SYS_C007137;

--���̺� ���� �߰� / ���� /����
--���������� ���̺� ī��
DROP TABLE ����;
CREATE TABLE ����(������ȣ, �̸�, �޿�, �μ���ȣ)
AS SELECT employee_id,first_name,salary,department_id
FROM EMPLOYEES
WHERE department_id = 90; --90�� �μ��� ������

select * from ����;

--���� �߰�
alter table ���� add(���� varchar2(3));
alter table ���� add(Ŀ�̼� number default 0);

--���� ���� (������ Ÿ���� �ٲٰų� �뷮�� �ø���)
desc ����2;
alter table ���� modify (���� varchar2(10));
alter table ���� modify (Ŀ�̼� number default 0);
alter table ���� modify (���� number);

--���� ����

alter table ����
drop column ����;

--���̺��� �̸� ����
RENAME ���� TO ����2;
