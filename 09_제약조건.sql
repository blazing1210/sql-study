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
    member_id NUMBER(2) PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(5), check (gender in ('Man','Woman')),
    dirth_day DATE DEFAULT SYSDATE,
    email VARCHAR2(200) UNIQUE NOT NULL
);
desc members;