--제약조건

--not null:널값은 입력안됨
DESC departments;

--UK 유니크 중복되지않음
create table emp1(
eno number(3),
emp_name VARCHAR2(20) constraint emp_ename_nn not null,
email varchar2(30),
constraint emp1_emailuk UNIQUE(email)
);
select *
from emp1;
--데이터를 입력

insert into emp1 values(208,'Kim','KJS@naver.com');
insert into emp1 values(209,NULL,'ABC@naver.com');--널값을 입력할수 없다
insert into emp1 values(210,'Lee','KJS@naver.com');--중복안됨 email 유니크

--check제약조건
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

--제약조건 pk fk 기본키 외래키 관계

--부서테이블 만들기

create table 부서 (
    부서번호 number(4),
    부서이름 varchar2(20),
    CONSTRAINT dept_dno_pk PRIMARY KEY(부서번호)
);
INSERT INTO 부서 VALUES (1,'개발');
--INSERT INTO 부서 VALUES (NULL,'회계'); 기본키는 널값또는 중복값을 입력할 수 없다.
select * from 부서;

--외래키 (FK)
--외래키문법 foreign key(열이름) references 참조테이블(참조열) 생략가능[on delete cascade/on delete set null]
drop table 직원;
create table 직원 (
    직원번호 number(4),
    이름 varchar2(20),
    월급 number(10),
    부서번호 number(4),
    FOREIGN KEY (부서번호) REFERENCES 부서(부서번호) on delete set null
);
--데이터 입력
insert into 부서 values(1,'개발');
insert into 부서 values(2,'경영');
insert into 부서 values(3,'회계');
select * from 부서;
insert into 직원(직원번호,이름,월급,부서번호) values (100,'홍길동',150,1);
insert into 직원(직원번호,이름,월급,부서번호) values (110,'펭수',100,1);
insert into 직원(직원번호,이름,월급,부서번호) values (120,'라이언',200,null);
select * from 직원;
--삭제시 문제발생
delete from 부서 where 부서번호=1 ;

--제약조건의 추가하는법 (1.테이블 생성 2.제약조건 추가)
create table 과목(
    과목번호 VARCHAR2(2),
    과목이름 VARCHAR2(50)  
);
insert into 과목 values('01','데이터베이스');
insert into 과목 values('02','프로그래밍');

select * from 과목;

create table 학생(
    학번 varchar2(4),
    이름 varchar2(50),
    과목번호 varchar2(2)
);
insert into 학생 values('0414','홍길동','01');
insert into 학생 values('0415','임꺽정','02');
insert into 학생 values('0416','이순신','03');
UPDATE 학생 SET 과목번호='01'WHERE 학번='0416';
select * from 학생;
--과목부터 제약조건 추가
alter table 과목
add primary key (과목번호);

--제약조건을 조회(테이블 이름만 수정),'' 한따옴표 안에 넣는다.
select * from all_CONSTRAINTS where table_name='학생';
SELECT * FROM 학생;
SELECT * FROM 과목;
ALTER TABLE 과목 ADD UNIQUE (과목이름);

--2. 학생 테이블 제약조건 추가

ALTER TABLE 학생 ADD PRIMARY KEY (학번);
ALTER TABLE 학생 MODIFY 이름 NOT NULL;
--외래키 추가
ALTER TABLE 학생 ADD FOREIGN KEY (과목번호) REFERENCES 과목 (과목번호);
ALTER TABLE 과목 DROP PRIMARY KEY CASCADE; 
ALTER TABLE 과목 DROP CONSTRAINT SYS_C007135;
ALTER TABLE 학생 DROP CONSTRAINT SYS_C007137;

--테이블 열을 추가 / 수정 /삭제
--서브쿼리로 테이블 카피
DROP TABLE 직원;
CREATE TABLE 직원(직원번호, 이름, 급여, 부서번호)
AS SELECT employee_id,first_name,salary,department_id
FROM EMPLOYEES
WHERE department_id = 90; --90번 부서의 직원들

select * from 직원;

--열을 추가
alter table 직원 add(성별 varchar2(3));
alter table 직원 add(커미션 number default 0);

--일을 수정 (데이터 타입을 바꾸거나 용량을 늘릴때)
desc 직원2;
alter table 직원 modify (성별 varchar2(10));
alter table 직원 modify (커미션 number default 0);
alter table 직원 modify (성별 number);

--열을 삭제

alter table 직원
drop column 성별;

--테이블의 이름 수정
RENAME 직원 TO 직원2;
