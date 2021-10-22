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