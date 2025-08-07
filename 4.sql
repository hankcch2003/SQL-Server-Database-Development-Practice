-- 1. �إ߸�Ʈw
create database ���ӿ�3;
go

-- 2. �ϥθ�Ʈw
use ���ӿ�3;
go

-- 3. �ˬd�O�_�s�bemployees��ƪ�A�p�G�s�b�h�R��
if object_id('employees', 'u') is not null drop table employees;
go

-- 4. �إ߸�ƪ�Gemployees
create table employees (
    employeeid int primary key,
    name nvarchar(50),
    managerid int null,
    department nvarchar(50),
    salary int
);
go

-- 5. �s�W���ո��
insert into employees (employeeid, name, managerid, department, salary) values
(1, 'alice', null, 'engineering', 70000),
(2, 'bob', 1, 'engineering', 68000),
(3, 'charlie', 1, 'engineering', 59000),
(4, 'diana', null, 'marketing', 62000),
(5, 'ethan', 4, 'marketing', 61000),
(6, 'fiona', 4, 'marketing', 55000),
(7, 'george', null, 'hr', 64000),
(8, 'hannah', 7, 'hr', 60000),
(9, 'ian', 7, 'hr', 58000),
(10, 'jack', 2, 'engineering', 63000);
go

-- 6. �ϥ� CTE�G�����~��ƦW�]�Ѱ���C�^

-- 6-1. �ϥ� CTE ���p��C�ӳ��������u�~�ꪺ�ƦW (�Ѱ���C)
with deptsalaryrank as (
    select 
        name,
        department,
        salary,
        row_number() over (partition by department order by salary desc) as salaryrank
    from employees
)
-- 6-2. �d�� CTE ���G�A�̳����P�ƦW�Ƨ�
select *
from deptsalaryrank
order by department, salaryrank;
go

-- 7. ���j CTE�G��´�W�U�h�[�c�d�ߡ]�D�޻P�U�ݡ^

-- 7-1. �ϥλ��j cte �إ߳������h���c�]�D�� �� �U�ݡ^
with orgchart as (
    -- (1) ��X�̤W�h�D�ޡ]managerid �� null�^
    select employeeid, name, managerid, department, salary, 0 as level
    from employees
    where managerid is null

    union all

    -- (2) ��X�C�h�U�ݡA�h�� level + 1
    select e.employeeid, e.name, e.managerid, e.department, e.salary, oc.level + 1
    from employees e
    inner join orgchart oc on e.managerid = oc.employeeid
)
-- 7-2. �d�߾�Ӳ�´�[�c�h�����Y
select *
from orgchart
order by level, managerid, employeeid;
go

-- 8. �ϥ� Window Function�G�������ֿn�~��]�q����C�^

-- 8-1. �ϥ� window function �p��ӭ��u�b���������ֿn�~��]���~���C�~�^
select 
    name,
    department,
    salary,
    sum(salary) over (
        partition by department 
        order by salary desc 
        rows between unbounded preceding and current row
    ) as cumulativedeptsalary
from employees
order by department, salary desc;
go

-- 9. CTE + Window Function�G�p���~�겾�ʥ����]Moving Average�^

-- 9-1. CTE�G���̳����~��ƧǨå[�W�Ƨǽs�� rn
with orderedsalaries as (
    select
        name,
        department,
        salary,
        row_number() over (partition by department order by salary) as rn
    from employees
)
-- 9-2. �ϥ� window function �p��C����u�~�ꪺ���ʥ����]��e�P�e 2 ��^
select
    name,
    department,
    salary,
    avg(salary) over (
        partition by department 
        order by rn
        rows between 2 preceding and current row
    ) as movingavgsalary
from orderedsalaries
order by department, rn;
go