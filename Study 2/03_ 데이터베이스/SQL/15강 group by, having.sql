# first_name을 기준으로 그룹을 묶은 다음 
# 사원의 수를 계산해본다.
select first_name, count(*)
from employees
group by first_name;

# first_name을 기준으로 그룹을 묶은 다음 
# 사원의 수를 계산해본다.
select first_name, count(*)
from employees
group by first_name;

-- 사원의 수를 성별로 가져온다.
-- select 사원의 수
-- from
-- where 없음
-- group by 성별
-- order by 없음

-- select *
-- from employees;

select gender, count(*)
from employees
group by gender;

-- 각 부서에 현재 근무하고 있는 사원들의 수를 가져온다.
-- select 사원들의 수
-- from
-- where 현재 근무하고 있다
-- group by 부서
-- order by 없음

-- select *
-- from dept_emp
-- where to_date = '9999-01-01';

select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no;

-- 각 부서별 과거의 매니저의 수를 구한다.
-- select 매니저 수
-- from
-- where 과거의 매니저
-- group by 부서
-- order by 없음

-- select *
-- from dept_manager
-- where to_date <> '9999-01-01';

select dept_no, count(*)
from dept_manager
where to_date <> '9999-01-01'
group by dept_no;

-- 급여 수령 시작일별 급여 총합을 구한다.
-- 급여 수령 시작일별 급여 총합을 구한다.
-- 급여 수령 시작일별 급여 평균을 구한다.
-- 급여 수령 시작일 별 급여 최고액을 구한다.
-- 급여 수령 시작일 별 급여 최저액을 구한다.
-- select 급여 총합, 급여 평균, 급여 최고액, 급여 최저액
-- from 
-- where 없음
-- group by 급여 수령 시작일
-- order by 없음

-- select salary
-- from salaries;

select from_date, sum(salary), avg(salary), max(salary), min(salary)
from salaries
group by from_date;

-- 급여 수령 시작일별 급여 평균을 구한다.
-- 급여 수령 시작일 별 급여 최고액을 구한다.
-- 급여 수령 시작일 별 급여 최저액을 구한다.
-- 급여 수령 시작일별 급여 총합을 구한다.
-- 급여 수령 시작일별 급여 평균을 구한다.
-- 급여 수령 시작일 별 급여 최고액을 구한다.
-- 급여 수령 시작일 별 급여 최저액을 구한다.
-- select 급여 총합, 급여 평균, 급여 최고액, 급여 최저액
-- from 
-- where 없음
-- group by 급여 수령 시작일
-- order by 없음

-- select salary
-- from salaries;

select from_date, sum(salary), avg(salary), max(salary), min(salary)
from salaries
group by from_date;

-- 현재 사용중인 각 직함별 사원의 수를 가져온다.
-- 이 때, 3만명 이상인 직함만 가져온다.
-- select 사원의 수
-- from
-- where 현재 사용중인 직함
-- group by 직함명
-- having 3만명 이상인 직함
select title, count(*)
from titles
where to_date = '9999-01-01'
group by title
having count(*) >= 30000;

-- 10만명 이상이 사용하고 있는 직함의 이름과 직원의 수를 가지고 온다.
-- select 직함의 이름, 직원의 수
-- from
-- where 없음
-- group by 직함명
-- having 10만명 이상 사용 중인 직함
-- order by 없음

-- select *
-- from titles;

select title, count(*)
from titles
group by title
having count(*) >= 100000;