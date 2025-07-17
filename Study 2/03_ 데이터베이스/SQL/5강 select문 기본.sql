# 사원들의 정보를 모두 가져온다.
#어디에서 : 사원정보테이블
#무엇을 : 모든 것

select *
from salaries;

#부서 정보를 모두 가져온다.
select *
from salary;
#사원들의 직함 정보를 모두 가져온다.
select *
from title;

#모든 사원의 사원번호, 사원이름1, 사원이름2 를 모두 가져온다.
select emp_no, first_name, last_name
from employees;

#사원의 사원번호, 생년월일, 성별을 가져온다.
select emp_no, birth_date, gender
from employees;

#부서의 부서번호, 부서 이름을 가져온다.
select dept_no, dept_name
from departments;

#각 사원의 사원번호, 급여액을 가져온다
select emp_no, salary
from salaries;

#각 사원의 사원번호, 직함 이름을 가져온다.
select emp_no, title
from titles;

