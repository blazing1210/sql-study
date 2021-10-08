--dml 작업

--데이터 입력 insert
INSERT INTO departments(department_id,department_name, manager_id,location_id)
VALUES(300,'Game',100,1700);


select *
from departments;
--테이블 열의 구조를 확인
desc departments;
--특정열만 입력
insert into departments(department_id,department_name)
VALUES(280,'Music');
--열의 이름들을 생략하면 다적어야함
INSERT INTO departments
VALUES(290,'Pusan',NULL,1700);
--예제1,2
insert into departments(department_id,department_name,manager_id,location_id)
VALUES(271,'Sample Dept 1',200,1700);
insert into departments(department_id,department_name,manager_id,location_id)
VALUES(272,'Sample Dept 2',200,1700);
insert into departments(department_id,department_name,manager_id,location_id)
VALUES(273,'Sample Dept 3',200,1700);

--데이터의 수정
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

--데이터의 삭제 delete
DELETE FROM departments
WHERE department_name='Game';

delete from departments
where department_name like '%Sample%';

delete from departments
where department_id>=120;
--커밋전에 롤백가능
rollback;
--게임부서 생성하고 commit
commit;
delete from departments
where department_name='Game';

-- 자동 커밋 설정
show autocommit;
--on 실행시에 자동의 commit
set autocommit on;
--off 실행시에 수동
set autocommit off;
