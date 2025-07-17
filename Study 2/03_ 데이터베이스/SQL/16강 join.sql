# join
# 다수에 테이블에 있는 데이터들을 한번에 가져올 수 있다.
# 한번에 가져오고자 하는 테이블간에 공통된 부분이 있어야만 한다.

# 각 사원들의 사원번호, 근무 부서 번호, 근무 부서 이름을 가져온다. 
# 사원번호를 기준으로 오름 차순 정렬한다.

-- select 사원번호, 근무 부서 번호, 근무 부서 이름
-- from
-- where 현재 근무하고 있는 근무 부서
-- group by 없음
-- having 없음
-- order by 사원번호를 기준으로 오름 차순

select dept_emp.emp_no, dept_emp.dept_no, departments.dept_no, departments.dept_name
from dept_emp, departments
where dept_emp.to_date = '9999-01-01' and dept_emp.dept_no = departments.dept_no
order by dept_emp.emp_no;

-- 테이블 명에 별칭을 부여해 주면 편하게 작업할 수 있다.
-- as 별칭 (as는 생략 가능)
select a1.emp_no, a1.dept_no, a2.dept_no, a2.dept_name
from dept_emp as a1, departments a2
where a1.to_date = '9999-01-01' and a1.dept_no = a2.dept_no
order by a1.emp_no;

-- 별칭은 데이터를 가져오는 결과의 컬럼 명에도 붙힐 수 있다.
select salary * 1.1 as 인상
from salaries
where to_date = '9999-01-01';

# join의 종류

# INNER JOIN : join을 하고자 하는 두 테이블에서 조인 조건에 만족하는 것만 
# 모두 가져온다. 만족하지 않는 행들은 모두 제거된다.

# from [기준이 되는 테이블명]
#      inner join [join하고자 하는 테이블 명]
#      on [join을 위한 조건]
select a1.emp_no, a1.dept_no, a2.dept_no, a2.dept_name
from dept_emp a1
     inner join departments a2
     on a1.dept_no = a2.dept_no
where a1.to_date = '9999-01-01'
order by a1.emp_no;

# inner join 시 inner는 생략할 수 있다.
select a1.emp_no, a1.dept_no, a2.dept_no, a2.dept_name
from dept_emp a1
     join departments a2
     on a1.dept_no = a2.dept_no
where a1.to_date = '9999-01-01'
order by a1.emp_no;

# 대부분의 join 작업은 inner join 이기 때문에 편하게 작성할 수 있는 문법도
# 제공된다.
select a1.emp_no, a1.dept_no, a2.dept_no, a2.dept_name
from dept_emp as a1, departments a2
where a1.to_date = '9999-01-01' and a1.dept_no = a2.dept_no
order by a1.emp_no;

# Outer Join
# Inner Join의 경우 조건에 만족하지 않는 행은 모두 제외가 된다.
# Outer Join 역시 조건에 만족하지 않는 행은 모두 제외가 된다.
# 단, Outer Join은 한 쪽 테이블에는 있지만 다른 테이블에 없는 것은 포함시킬 수 있다.
# 이 때, 없는 쪽은 값이 null로 채워진다.
# 즉, 두 테이블이 다:다의 관계로 조인이 이루어지고 on다음의 조건을 수행해서
# 조건에 위배가 되는 것들은 모두 제외시킨다.
# 그 후, left인 경우에는 left에는 있지만 right에는 없는 것들을 포함시켜주고
# right인 경우 right에는 있지만 left에는 없는 것을 포함시켜준다.
# full인 경우 left에는 있지만 right에는 없는 것과 right에는 있지만 left에는 없는 것들을
# 포함시켜준다.

# left outer join 
# 기준이 되는 테이블(좌측)에는 있지만 join을 하는 테이블(우측)에는 없는 것 까지 결과에
# 포함된다. 가져온 행에서 join을 하는 테이블(우측) 부분의 컬럼에는 null 값이 채워진다.
select a2.last_name 'employees의 last_name', 
       a2.emp_no 'employees의 emp_no', 
       a1.emp_no 'dept_manager의 emp_no',
       a1.dept_no 'dept_manager의 dept_no' 
from employees as a2 
 left outer join dept_manager as a1
     on a1.emp_no = a2.emp_no;
     
# right outer join
# 기준이 되는 테이블(좌측)에는 없지만 join을 하는 테이블(우측)에는 있는 것 까지 결과에
# 포함된다. 가져온 행에서 기준이 되는 테이블(좌측) 부분의 컬럼에는 null 값이 채워진다.
select a1.dept_no 'dept_manager의 dept_no',
       a1.emp_no 'dept_manager의 emp_no',
       a2.emp_no 'employees의 emp_no', 
   a2.last_name 'employees의 last_name'
from dept_manager as a1
 right outer join employees as a2 
     on a1.emp_no = a2.emp_no;