--��������
--������:������ ���������� ��G�Ҷ��� ���������� ����� ���ϴ� �����Ϳ� ���� �ϳ��� ��µǾ���Ѵ�.
select *
from employees
where hire_date>(select hire_date from employees where last_name='Popp');

--�׷��Լ��� ����� ���������� ���
select last_name �̸�, job_id ����, salary �޿�
from employees
where salary=(select min(salary)from employees);
--����
select last_name, salary
from employees
where salary>(select salary from employees where last_name='Abel');

select employee_id ������ȣ, last_name �̸�,department_id �μ���ȣ,salary �޿�
from employees
where salary>(select salary from employees where last_name='Bull');

select last_name,salary, manager_id
from employees
where manager_id=(select employee_id from employees where last_name='Russell');

select *
from employees
where job_id=(select job_id from jobs where job_title='Stock Manager');

select *
from jobs;

--������ �������� (�������� ����� �������� ������ ���)
select MIN(salary) from employees group by department_id;
--������ �������������� �ٷ� =>< �񱳸� �� �� ����
select department_id,employee_id, last_name,salary
from employees
where salary in (select MIN(salary) from employees group by department_id)
order by department_id;
--ANY �� ���� �ϳ��� ������ �˻�
select department_id,last_name,salary
from employees
where salary < ANY (select salary from employees WHERE job_id='IT_PROG')
AND job_id!='IT_PROG'
order by SALARY DESC;

select department_id,last_name,salary
from employees
where salary < all (select salary from employees WHERE job_id='IT_PROG')
AND job_id!='IT_PROG'
order by SALARY DESC;
--���� 1,2,3
select employee_id,first_name,job_id,salary
from employees
where manager_id in(select manager_id from employees where department_id=20)and
department_id!=20;

select employee_id,last_name,job_id,salary
from employees
where salary<any(select salary from employees where job_id='ST_MAN');

select employee_id,last_name,job_id,salary
from employees
where salary<all(select salary from employees where job_id='IT_PROG');

--���߿� �������� (���� �������϶�)
--�̸��� ��罺�� ������ ���� �Ŵ���, ����������  �������� ����Ѵ�
select *
from employees
where (manager_id,job_id)IN (select manager_id, job_id from employees where first_name='Bruce')
    AND first_name != 'Bruce';
--����1,2
select first_name,job_id,salary,department_id
from employees
where (job_id,salary) in (select job_id,MIN(salary) from employees group by job_id)
order by salary desc;
