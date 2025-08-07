-- 1. 建立資料庫
create database 陳承翰3;
go

-- 2. 使用資料庫
use 陳承翰3;
go

-- 3. 檢查是否存在employees資料表，如果存在則刪除
if object_id('employees', 'u') is not null drop table employees;
go

-- 4. 建立資料表：employees
create table employees (
    employeeid int primary key,
    name nvarchar(50),
    managerid int null,
    department nvarchar(50),
    salary int
);
go

-- 5. 新增測試資料
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

-- 6. 使用 CTE：部門薪資排名（由高到低）

-- 6-1. 使用 CTE 先計算每個部門內員工薪資的排名 (由高到低)
with deptsalaryrank as (
    select 
        name,
        department,
        salary,
        row_number() over (partition by department order by salary desc) as salaryrank
    from employees
)
-- 6-2. 查詢 CTE 結果，依部門與排名排序
select *
from deptsalaryrank
order by department, salaryrank;
go

-- 7. 遞迴 CTE：組織上下層架構查詢（主管與下屬）

-- 7-1. 使用遞迴 cte 建立部門階層結構（主管 → 下屬）
with orgchart as (
    -- (1) 找出最上層主管（managerid 為 null）
    select employeeid, name, managerid, department, salary, 0 as level
    from employees
    where managerid is null

    union all

    -- (2) 找出每層下屬，層級 level + 1
    select e.employeeid, e.name, e.managerid, e.department, e.salary, oc.level + 1
    from employees e
    inner join orgchart oc on e.managerid = oc.employeeid
)
-- 7-2. 查詢整個組織架構層級關係
select *
from orgchart
order by level, managerid, employeeid;
go

-- 8. 使用 Window Function：部門內累積薪資（從高到低）

-- 8-1. 使用 window function 計算該員工在部門內的累積薪資（高薪→低薪）
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

-- 9. CTE + Window Function：計算薪資移動平均（Moving Average）

-- 9-1. CTE：先依部門薪資排序並加上排序編號 rn
with orderedsalaries as (
    select
        name,
        department,
        salary,
        row_number() over (partition by department order by salary) as rn
    from employees
)
-- 9-2. 使用 window function 計算每位員工薪資的移動平均（當前與前 2 位）
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