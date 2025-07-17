# 그룹 함수
# select 문을 수행해서 가져온 결과를 정해준 기준으로 그룹으로 나눈다.
# 그 후에 각 그룹별로 값을 구하는 함수들

-- 사원의 수를 구한다.
-- select 전체 사원의 수
-- from
-- where 없음
-- order by 없음

-- select *
-- from employees;

-- count : 가져온 데이터의 총 행의 개수를 구해준다.
-- 만약 컬럼을 지정하였다면 컬럼내에 있는 null 값을 제외하고 가져온다.
select count(*)
from employees;

-- 남자 사원의 수를 구한다.
-- select 사원의 수
-- from
-- where 성별이 남자
-- order by 없음

-- select *
-- from employees
-- where gender = 'M';

select count(*)
from employees
where gender = 'M';

-- 현재 d005 부서에 근무하고 있는 사원들의 수를 구한다.
-- select 사원들의 수
-- from
-- where d005 부서에 근무하고 있는 사원, 현재 근무하고 있는 사원
-- order by 없음

-- select *
-- from dept_emp
-- where dept_no = 'd005' and to_date = '9999-01-01';

select count(*)
from dept_emp
where dept_no = 'd005' and to_date = '9999-01-01';

-- 현재 받고 있는 급여의 총합을 구한다.
-- select 급여의 총합
-- from
-- where 현재 받고 있는 급여
-- order by 없음

-- select salary
-- from salaries
-- where to_date = '9999-01-01';

# sum : 지정된 컬럼의 값에서 null을 제외한 총합을 구한다.
select sum(salary)
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 평균을 구한다.
# avg : 지정된 컬럼의 값에서 null을 제외한 평균을 구한다.
select avg(salary)
from salaries
where to_date = '9999-01-01';

# 만약 null을 포함해 평균을 구하고 싶다면..
select avg(ifnull(salary, 0))
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 최대 급여액을 구한다.
# max : 지정된 컬럼의 값에서 null을 제외한 최대 값을 구한다.
select max(salary)
from salaries
where to_date = '9999-01-01';


-- 현재 받고 있는 급여의 최저 급여액을 구한다.
# min : 지정된 컬럼의 값에서 null을 제외한 최소 값을 구한다.
select min(salary)
from salaries
where to_date = '9999-01-01';

# 현재 d001 부서에 근무하고 있는 사원들의 수를 구하세요
# 결과는 다음과 같이 나온다
# 현재 d001 부서에 근무하고 있는 사원의 수는 000명 입니다
select concat( '현재 d001 부서에 근무하고 있는 사원의 수는 ', COUNT(emp_no), '명 입니다') as result
from dept_emp
where dept_no = 'd001'
AND to_date = '9999-01-01';

# 현재 d003 부서에 근무하고 있는 사원들 중에 1990년 01월 01일 이후
# 부터 근무하기 시작한 사원들의 수를 구하세요
select count(emp_no)
from dept_emp
where from_date >= '1990-01-01'
and to_date = '9999-01-01'
and dept_no = 'd003';


# 과거부터 현재까지 d004 부서의 매니저를 했던 사람의 수를 구하세요
select count(emp_no)
from dept_manager
where dept_no = 'd004';

# 성별이 남자인 사원들의 수를 구하세요
select count(*)
from employees
where gender = 'M';

# 성별이 여자인 사원들의 수를 구하세요
select count(*)
from employees
where gender = 'F';

# first_name이 Georgi에 해당하는 사원들 중 성별이 여자인 
# 사원의 수를 구하세요
select count(*)
from employees
where first_name = 'Georgi'
and gender = 'F';

# 현재 받고있는 급여 중 최고액과 최저액의 차이를 구하세요
select max(salary) - min(salary)
from salaries
where to_date = '9999-01-01';

# 현재 받고 있는 급여 중 70000 이상을 받는 사람들의 평균 급여를 구하세요
select avg(salary)
from salaries
where salary >='70000'
and to_date = '9999-01-01';

# 현재 받고 있는 급여 중 2001년 01월 01일 부터 받기 시작한 급여의 평균을 구하세요
select avg(salary)
from salaries
where from_date >= '2001-01-01'
and to_date = '9999-01-01';