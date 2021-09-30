/* 여러줄 주석
ㅇㅇ

*/
-- 테이블의 모든 행과 열을 읽어오기
--*은 전체 열, 명령문 끝에는 세미콜론(;)이 있어야한다..
SELECT * 
FROM departments;
--특정열만 조회하기
SELECT department_id, department_name
FROM departments;