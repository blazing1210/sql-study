--dml �۾�

--������ �Է� insert
INSERT INTO departments(department_id,department_name, manager_id,location_id)
VALUES(300,'Game',100,1700);


select *
from departments;
--���̺� ���� ������ Ȯ��
desc departments;
--Ư������ �Է�
insert into departments(department_id,department_name)
VALUES(280,'Music');
--���� �̸����� �����ϸ� ���������
INSERT INTO departments
VALUES(290,'Pusan',NULL,1700);
--����1,2
insert into departments(department_id,department_name,manager_id,location_id)
VALUES(271,'Sample Dept 1',200,1700);
insert into departments(department_id,department_name,manager_id,location_id)
VALUES(272,'Sample Dept 2',200,1700);
insert into departments(department_id,department_name,manager_id,location_id)
VALUES(273,'Sample Dept 3',200,1700);

--�������� ����
update departments
set manager_id=200
WHERE department_name='Game';

select *
from departments;

update departments
set manager_ID=100
where department_id between 150 and 200;

update departments
set manager_id=100, location_id=1800
WHERE department_name = 'Game';

--�������� ���� delete
DELETE FROM departments
WHERE department_name='Game';

delete from departments
where department_name like '%Sample%';

delete from departments
where department_id>=120;
--Ŀ������ �ѹ鰡��
rollback;
--���Ӻμ� �����ϰ� commit
commit;
delete from departments
where department_name='Game';

-- �ڵ� Ŀ�� ����
show autocommit;
--on ����ÿ� �ڵ��� commit
set autocommit on;
--off ����ÿ� ����
set autocommit off;
