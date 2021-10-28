--�ε���

--�ε��� ��ȸ�ϱ�

select *
from all_ind_columns
where table_name ='DEPARTMENTS';

--�����̺� �����
create table members (
    member_id INT,
    first_name varchar2(100) not null,
    laste_name varchar2(100) not null,
    gender char(1) not null,
    dob date not null,
    email varchar2(255) not null,
    primary key(member_id)
);
alter table members 
rename column laste_name to last_name;
select * from members
order by member_id;

--�Ϲ� ���� �˻��ϱ�
select * from members where last_name='Harse';

--�Ʒ��� �������� ���ຸ���� �ۼ��Ѵ�.
explain plan for
select * from members where last_name='Harse' ;

--����� ���� ������ �б�
select * from table(DBMS_XPLAN.DISPLAY());

create index members_last_name_i ON members(last_name);
drop index members_last_name_i;
create index members_name on members(last_name,first_name);
select table_name,index_name,column_name from all_IND_COLUMNS where table_name='MEMBERS';
select * from members where last_name like 'A%' and first_name like 'M%' ;
explain plan for
select * from members where last_name like 'A%' and first_name like 'M%';
select * from table(DBMS_XPLAN.DISPLAY());

CREATE SEQUENCE ������1;
DROP SEQUENCE ������1;

SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME='������1';
SELECT ������1.NEXTVAL FROM DUAL;

CREATE TABLE �μ�_�׽�Ʈ (
    �μ���ȣ NUMBER PRIMARY KEY,
    �μ��̸� VARCHAR2(100)
);
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ,�μ��̸�) VALUES(������1.NEXTVAL,'������');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ,�μ��̸�) VALUES(������1.NEXTVAL,'���ߺ�');
SELECT * FROM �μ�_�׽�Ʈ;

---�������� ���� ������Ű�� �ʰ� ���� ���� �˰� ������ (�̸�.CURRVAL)
SELECT ������1.CURRVAL FROM DUAL;

--������ �ɼ� ���۰��� 10���� ������ 20
DROP SEQUENCE ������2;
CREATE SEQUENCE ������2
START WITH 10
INCREMENT BY 20;
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ,�μ��̸�) VALUES(������2.NEXTVAL,'�����ú�');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ,�μ��̸�) VALUES(������2.NEXTVAL,'������');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ,�μ��̸�) VALUES(������2.NEXTVAL,'�濵��');
SELECT* FROM �μ�_�׽�Ʈ;

UPDATE �μ�_�׽�Ʈ SET �μ���ȣ=������2.NEXTVAL;

--������2�� �������� 2�� �����غ���

ALTER SEQUENCE ������2
increment by 2;