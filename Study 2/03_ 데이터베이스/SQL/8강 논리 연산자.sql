# d001 부서의 매니저 중에 1990년 이후부터 매니저인 사원의 
# 사원번호, 부서번호, 매니저 시작 날짜를 가져온다.
# select 매니저 사원의 사원번호, 매니저 사원의 부서번호, 매니저 사원의 매니저 시작 날짜
# from
# where 매니저가 근무하는 부서 번호가 d001 and 매니저 시작 날짜가 1990년 이후

select emp_no, dept_no, from_date
from dept_manager
where dept_no = 'd001' and from_date >= '1990-01-01';

# 1990년 이후에 입사한 남자 사원의 사원번호, 성별, 입사일을 가져온다.
# select 사원의 사원번호, 사원의 성별, 사원의 입사일
# from
# where 입사일이 1990년 이후 and 성별이 남자인 사원

select emp_no, gender, hire_date
from employees
where hire_date >= '1990-01-01' and gender = 'M';

# 1990년 이후부터 60000 이상의 급여를 받는 사원의 
# 사원번호, 급여, 급여 수령 시작 날짜를 가져온다.
select emp_no, salary, from_date
from salaries
where from_date >= '1990-01-01' and salary >= 60000;


# d001 부서와 d002 부서 매니저의 사원 번호, 부서 번호를 가져온다.
select emp_no, dept_no
from dept_nanager
where dept_no = 'd001' or dept_no = 'd002';

# 직함이 Staff인 사원과 Engineer인 사원의 사원번호, 직함을 가져온다.
select emp_no, title
from titles
where title = 'Staff' or title = 'Engineer';

# select 매니저의 사원번호, 매니저가 근무하고 있는 부서 번호
# from
# where 매니저가 근무하고 있는 부서의 번호가 d003이 아니다
select emp_no, dept_no
from dept_manager
where not dept_no = 'd003';

select emp_no, dept_no
from dept_manager
where dept_no <> 'd003';

# 급여가 60000이상 70000이하인 사원의 사원번호, 급여를 가져온다.
select emp_no, salary
from salaries
where salary >= 60000 and salary <= 70000;
# = salary between 60000 and 70000;

# d001부서와 d002부서 매니저의 사원번호, 부서 번호를 가져온다.
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';
# = where dept_no in ('d001', 'd002');
#특정 컬럼의 값이 이거이거나 이거이거나 하는 조건은 in을 사용할 수 있다.

# d001부서와 d002부서가 아닌 매니저의 사원번호, 부서 번호를 가져온다.
select emp_no, dept_no
from dept_manager
where dept_no not in ('d001', 'd002');

# 사원들의 사원번호와 급여액을 가져온다. 급여액은 1988년에 받는 급여이다.
select emp_no, salary
from salaries
where from_date >= '1988-01-01' and to_date <= '1988-12-31';

# 매니저의 사원 번호와 근무시작일짜를 가져온다. 근무 시작일이 1985년인 매니저 사원들의 정보
# 만 가져온다.
select emp_no, from_date　
from dept_manager
where from_date >= '1985-01-01' and from_date <= '1985-12-31';

# 직함이 Senior Enginner이거나 Staff 이거나 Engineer 인 사원들의 사원 번호와
# 직함을 가져온다
select emp_no, title
from titles
where title = 'Enginner' or title = 'Staff' or title = 'Senior Enginner';