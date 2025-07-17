-- select 부서의 이름, 평균 급여
-- from
-- where 현재 받는 급여
-- group by 부서이름
-- having 평균 급여가 남자 사원들의 평균 급여보다 많다
-- order by 없음

select a1.dept_name, a2.salary
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a2.to_date = '9999-01-01' and a3.to_date = '9999-01-01';


-- select 부서의 이름, 평균 급여
-- from
-- where 현재 받는 급여
-- group by 부서이름
-- having 평균 급여가 남자 사원들의 평균 급여보다 많다
-- order by 없음


select a1.dept_name, avg(a2.salary)
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a2.to_date = '9999-01-01' and a3.to_date = '9999-01-01'
group by a1.dept_name
having avg(a2.salary) > 65000;

select avg(a2.salary)
from employees a1, salaries a2
where a1.emp_no = a2.emp_no and
      a2.to_date = '9999-01-01' and a1.gender = 'M';
      
select a1.dept_name, avg(a2.salary)
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a2.to_date = '9999-01-01' and a3.to_date = '9999-01-01'
group by a1.dept_name
having avg(a2.salary) > (select avg(b2.salary)
                        from employees b1, salaries b2
                        where b1.emp_no = b2.emp_no and
                              b2.to_date = '9999-01-01' and b1.gender = 'M');