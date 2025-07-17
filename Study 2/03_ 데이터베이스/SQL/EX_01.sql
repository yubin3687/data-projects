#모든 사원의 사원 번호와 현재 받는 급여에서 10% 인상한 급여액을 가져온다.
select emp_no, salary*1.1
from salaries;

#모든 사원의 사원 번호와 현재 받는 급여에서 10% 삭감(90%로 변경된) 급여액을 가져온다.
select emp_no, salary*0.9
from salaries;

#부서명을 다음과 같은 양식으로 가져오시오. "부서번호 0000의 이름은 0000 입니다"
select CONCAT('부서번호 ', dept_no, '의 이름은 ', dept_name, ' 입니다') AS result
from departments;

#각 사원들의 사원 번호와 현재 근무하고 있는 부서(to_date가 9999년 1월 1일)번호를 근무 부서 번호를 기준으로 내림 차순 정렬하여 가져온다.
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01'
order by dept_no desc;

#현재 매니저일을 하고 있는(to_date가 9999년 1월 1일) 사원들의 사원 번호와 근무 부서 번호를 가져온다. 이 때, d001 부서와 d002 부서는 제외한다.
select emp_no, dept_no
from dept_manager
where to_date = '9999-01-01'
and dept_no not in ('d001','d002');

#1960년대에 태어난 사원들의 사원번호, first_name, last_name, 생년월일을 가져와 생년월일을 기준으로 내림차순 정렬한다.
select emp_no, first_name, last_name, birth_date
from employees
order by birth_date desc;

#성별이 여성(F)인 사원들 중 고용 날짜가 1990년 1월 1일 이후인 사원들의 사원번호, last_name, 고용날짜를 가져온다. 이 때, last_name을 기준으로 오름차순 정렬한다.
select emp_no, last_name, hire_date
from employees
where gender = 'F'
and hire_date >= '1990-01-01'
order by last_name asc;

#현재의 직함(to_date가 9999년 1월 1일)에 Senior가 들어있는 사원들의 사원번호, 직함명을 가져온다.
select emp_no, title
from titles
where title like '%Senior%'
and to_date <= '9999-01-01'