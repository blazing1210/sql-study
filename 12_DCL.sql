--DCL:������ ����� (������ ���̽� �������� �ְ� ȸ���ϴ� ��ɾ�)
--���̺����̽��� ���� (���̺��� ������ �� �ִ� ����)
CREATE TABLESPACE johnSpace
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' size 10m
autoextend on next 5m;
--�����̸� john.dbf�� 10mb ������� ���� ���� �ڵ����� 5m�� ����

--�� ���� �� ����
CREATE USER john IDENTIFIED BY 1234 DEFAULT TABLESPACE johnSpace;

--������ ���ӱ����ֱ�
grant create session to john;
--������ ���̺� ����� �����ֱ�
grant create table to john;

--��(���ѵ��� ����)�� �߰�, connect�� ���Ӱ��ñ��ѵ�, resource�� ���̺�� ��ü ������
grant connect,resource to john;

--DBA ���� �����ڱ��ѵ��̱� ������ ���� �ʴ´�.

--������ ���� REVOKE��ɾ�
REVOKE CREATE TABLE , RESOURCE FROM john;
--���� ���ѵ� ����
revoke connect from john;
--��������
drop user john cascade;
--���̺����̽� ����
drop tablespace johnspace;
alter user scott identified by "tiger";

--���� ����Ŭ ������ ��Ʈ��ȣ�� Ȯ��
select dbms_xdb.gethttpport() from dual;

--���߿� ��Ĺ ���α׷��� ��ġ�ϸ� �̼����� �Ȱ��� �⺻ 8080�̱� ������ ��Ʈ

--����Ŭ�� ��Ʈ��ȣ�� 9090���� �ٲ㺸��.
exec dbms_xdb.sethttpport(9090);
commit;
exec dbms_xdb.sethttpport(8080);
commit;
