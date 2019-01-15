-- 아래의 출력은 문제풀이를 위한 참조사항입니다.
select * from employees;
select * from salaries;
select * from departments;
select * from dept_manager;
select * from salaries;
select * from titles;
select * from dept_emp;

-- 문제1
select max(salary) as '최고임금', 
	   min(salary) as '최저임금',
	   abs(max(salary) - min(salary)) as '최고임금 - 최저임금'
from salaries;

-- 문제2
select date_format(max(hire_date), '%Y년%m월%d일')
from employees;

-- 문제3
	-- (1) 현재까지 근속일 수 구하여 계산한 값 ↓↓↓
	select date_format(hire_date, '%Y년%m월%d일') '입사일'
	from employees
	where emp_no = ( select emp_no
				   from dept_emp
				   having max(abs(period_diff(from_date, now()))));
                   
	-- (2) 입사일이 가장 오래된 사람을 구하여 계산한 것 ↓↓↓
	select min(date_format(hire_date, '%Y년%m월%d일')) '입사일'
	from employees;

-- 문제4
select avg(salary) as '평균연봉'
from salaries
where to_date = '9999-01-01';

-- 문제5
select max(salary) as '최고연봉',
	   min(salary) as '최저연봉'
from salaries
where to_date = '9999-01-01';

-- 문제6
select abs(
	period_diff(max(birth_date), min(birth_date))) as '최연장 나이 - 최고 어린애'
from employees;