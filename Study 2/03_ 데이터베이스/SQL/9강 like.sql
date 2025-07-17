# 이름이 Tommaso 사원의 사원번호, 이름을 가져온다.
# select 사원번호, 사원이름
# from 
# where 사원 이름이 Tommaso 인 사원

select emp_no, first_name
from employees
where first_name = 'Tommaso';

# 이름의 첫 글자가 A로 시작하는 사원의 사원번호, 이름을 가져온다.
# select 사원의 번호, 사원의 이름
# from
# where 사원의 이름이 A로 시작하는 사원

select emp_no, first_name
from employees
where first_name like 'A%';

# 이름의 마지막 글자가 s로 끝나는 사원의 사원번호, 이름을 가져온다.
# select 사원의 사원번호, 사원의 이름
# from
# where 이름의 마지막 글자가 s로 끝난다

select emp_no, first_name
from employees
where first_name like '%s';

# 이름의 두 번째 글자가 i인 사원의 사원번호, 이름을 가져온다.
select emp_no, first_name
from employees
where first_name like '_i%';

# 이름이 5글자인 사원들의 사원번호, 이름을 가져온다.
# 이름이 5글자인 사원들의 사원번호, 이름을 가져온다.
select emp_no, first_name
from employees
where first_name like '_____';

select emp_no, first_name
from employees
where length(first_name) = 5;

# DBMS 제품군에 따라서는 날짜 데이터를 문자열 데이터 처럼 사용할 수 있도록
# 지원하고 있다.
select * 
from employees
where hire_date between '1980-01-01' and '1989-12-31';

select * 
from employees 
where hire_date like '198_______';

# d003 부서에 근무하고 있는 모든 사원들의 사원 번호와 부서 번호를 가져온다.
# 조건에는 무조건 like를 사용해주세요
select emp_no, dept_no
from dept_emp
where dept_no like '___3';

# last_name이 i로 끝나는 사원들의 사원번호와 last_name을 가져온다.
select emp_no, last_name
from employees
where last_name like '%i';

# 직함에 engineer 가 포함되어 있는 모든 사원들의 사원번호와 직함을 가져온다.
select emp_no, title 
from titles
where title like '%engineer%';