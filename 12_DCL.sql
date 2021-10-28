--DCL:데이터 제어어 (데이터 베이스 사용권한을 주고 회수하는 명령어)
--테이블스페이스의 생성 (테이블을 생성할 수 있는 공간)
CREATE TABLESPACE johnSpace
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' size 10m
autoextend on next 5m;
--파일이름 john.dbf에 10mb 사이즈로 파일 생성 자동으로 5m씩 증가

--새 유저 존 생성
CREATE USER john IDENTIFIED BY 1234 DEFAULT TABLESPACE johnSpace;

--존에게 접속권한주기
grant create session to john;
--존에게 테이블 만들기 권한주기
grant create table to john;

--롤(권한들의 모음)을 추가, connect는 접속관련권한들, resource는 테이블및 객체 사용권한
grant connect,resource to john;

--DBA 롤은 관리자권한들이기 때문에 주지 않는다.

--권한을 제거 REVOKE명령어
REVOKE CREATE TABLE , RESOURCE FROM john;
--접속 권한들 제거
revoke connect from john;
--계정삭제
drop user john cascade;
--테이블스페이스 삭제
drop tablespace johnspace;
alter user scott identified by "tiger";

--현재 오라클 서버의 포트번호를 확인
select dbms_xdb.gethttpport() from dual;

--나중에 톰캣 프로그램을 설치하면 이서버는 똑같이 기본 8080이기 때문에 포트

--오라클의 포트번호를 9090으로 바꿔보자.
exec dbms_xdb.sethttpport(9090);
commit;
exec dbms_xdb.sethttpport(8080);
commit;
