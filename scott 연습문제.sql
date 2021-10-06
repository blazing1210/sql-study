--연습문제 1~10
select empno,ename,sal
from emp
where deptno=10;

select ename,hiredate,deptno
from emp
where empno=7369;

select *
from emp
where ename='ALLEN';

select ename, deptno, sal
from emp
where hiredate='81/02/20';

select *
from emp
where job!='MANAGER';

select ename,sal,deptno
from emp
where sal>=800
order by sal asc;

select *
from emp
where deptno>=20;

select *
from emp
where ename>'K';

select *
from emp
where hiredate<'81/12/09';
--연습문제 11
select empno,ename
from emp
where empno<=7698;

select ename,sal,deptno
from emp
where hiredate between '81/04/02' and '82/12/09';

select ename,job,sal
from emp
where sal between 1601 and 2999;

select *
from emp
where not empno between 7654 and 7782;

select *
from emp
where ename between 'B' and 'J';

select *
from emp
where not hiredate like ('81%');

select *
from emp
where job='MANAGER'or job='SALESMAN';

select ename, empno, deptno
from emp
where not deptno in(20,30);

select empno,ename,hiredate,deptno
from emp
where ename like ('S%');

select *
from emp
where hiredate like ('81%');

--연습문제 21-30
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where ename like ('%S%');

select *
from emp
where ename like ('M_____') and ename like ('_____N');

select *
from emp
where ename like ('_A%');

select *
from emp
where comm is null;

select *
from emp
where comm is not null;

select ename,deptno,sal
from emp
where deptno=30 and sal>=1500;

select empno,ename,deptno
from emp
where ename like ('K%') or deptno=30;

select *
from emp
where sal>=1500 and deptno=30 and job='MANAGER';

select *
from emp
where deptno=30
order by empno asc;

select *
from emp
order by sal desc;

select *
from emp
order by deptno,sal desc;

select deptno,ename,sal
from emp
order by deptno desc, ename asc;

select ename,sal,ROUND(sal*1.13) BONUS,deptno
from emp
where deptno=10;

select ename,sal,nvl(comm,0),sal+nvl(comm,0) total
from emp
order by total desc;

select ename,sal,TO_CHAR(round(sal*0.15,2),'$9999.9') 회비
from emp
where sal between 1500 and 3000;

--예제 36-40
select dname,count(empno)
from emp e
join dept d
    on d.deptno=e.deptno
group by d.dname
having count(e.empno)>5;

select job,sum(sal) 급여합계
from emp
where job!='SALESMAN'
group by job
having sum(sal)>5000;

select empno,ename,sal,grade,losal
from emp e
join salgrade s
    on sal between losal and hisal;

select deptno,count(ename)사원수,count(comm) "커미션 받은 사원수"
from emp
group by deptno;

