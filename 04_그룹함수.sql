--�׷��Լ� (�������Լ� ,�����Լ�)
SELECT ROUND(AVG(salary)) ��հ�,MAX(salary) �ִ�,MIN(salary) �ּڰ�,SUM(salary) �հ�,count(salary) ����
FROM employees
WHERE job_id LIKE '%REP%';

SELECT count(*) FROM employees;

SELECT count(*) 
FROM employees
WHERE department_id=80;
SELECT COUNT(DISTINCT department_id)
FROM EMPLOYEES;--�ߺ��������� �μ��ǰ���

SELECT AVG(commission_pct)
FROM employees; --�ΰ��� ������ ���������

--group by ��: Ư�� �׷����� ����� �׷��Լ��� ���.
SELECT department_id �μ���ȣ, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �μ���ȣ DESC;

SELECT *
FROM employees
WHERE department_id is null;
--����1,2,3
SELECT department_id �μ���, count(department_id) �����, max(salary) �ְ�޿�,min(salary) ���ּұ޿�,
SUM(salary)�޿��հ�,ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �޿��հ� DESC;

SELECT department_id �μ���ȣ,job_id ����,SUM(salary) �����հ�,count(job_id) ������
FROM employees
GROUP BY department_id,job_id order by department_id;

SELECT ROUND(AVG(MAX(salary))),AVG(MIN(salary))
FROM employees
GROUP BY department_id;
--�׷��Լ��� ������
SELECT DEPARTMENT_ID �μ���, COUNT(*) �����
FROM employees
GROUP BY department_id
HAVING COUNT(*)>5;
--���� 1,2
SELECT job_id ����, SUM(salary) ���޿��հ�
from employees where job_id!='AC_MGR'
group by job_id
having avg(salary)>10000
order by ���޿��հ� desc;
SELECT department_id �μ���ȣ, ROUND(avg(salary))��ձ޿�
from employees
where department_id!=40
group by department_id
having avg(salary)<=7000;

SELECT job_id, sum(salary) �޿��Ѿ�
from employees
where job_id not LIKE('%REP%')
group by job_id
having sum(salary)>13000 order by �޿��Ѿ� desc;
