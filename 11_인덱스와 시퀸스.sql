--인덱스

--인덱스 조회하기

select *
from all_ind_columns
where table_name ='DEPARTMENTS';

--새테이블 만들기
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

--일반 열을 검색하기
select * from members where last_name='Harse';

--아래의 쿼리문의 실행보고서를 작성한다.
explain plan for
select * from members where last_name='Harse' ;

--저장된 실행 보고서를 읽기
select * from table(DBMS_XPLAN.DISPLAY());

create index members_last_name_i ON members(last_name);
drop index members_last_name_i;
create index members_name on members(last_name,first_name);
select table_name,index_name,column_name from all_IND_COLUMNS where table_name='MEMBERS';
select * from members where last_name like 'A%' and first_name like 'M%' ;
explain plan for
select * from members where last_name like 'A%' and first_name like 'M%';
select * from table(DBMS_XPLAN.DISPLAY());

CREATE SEQUENCE 시퀸스1;
DROP SEQUENCE 시퀸스1;

SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME='시퀸스1';
SELECT 시퀸스1.NEXTVAL FROM DUAL;

CREATE TABLE 부서_테스트 (
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
);
INSERT INTO 부서_테스트 (부서번호,부서이름) VALUES(시퀸스1.NEXTVAL,'영업부');
INSERT INTO 부서_테스트 (부서번호,부서이름) VALUES(시퀸스1.NEXTVAL,'개발부');
SELECT * FROM 부서_테스트;

---시퀸스의 값은 증가시키지 않고 현재 값을 알고 싶을때 (이름.CURRVAL)
SELECT 시퀸스1.CURRVAL FROM DUAL;

--시퀀스 옵션 시작값을 10부터 증가는 20
DROP SEQUENCE 시퀀스2;
CREATE SEQUENCE 시퀀스2
START WITH 10
INCREMENT BY 20;
INSERT INTO 부서_테스트 (부서번호,부서이름) VALUES(시퀀스2.NEXTVAL,'마켓팅부');
INSERT INTO 부서_테스트 (부서번호,부서이름) VALUES(시퀀스2.NEXTVAL,'교육부');
INSERT INTO 부서_테스트 (부서번호,부서이름) VALUES(시퀀스2.NEXTVAL,'경영부');
SELECT* FROM 부서_테스트;

UPDATE 부서_테스트 SET 부서번호=시퀀스2.NEXTVAL;

--시퀀스2의 증가값을 2로 수정해보자

ALTER SEQUENCE 시퀀스2
increment by 2;