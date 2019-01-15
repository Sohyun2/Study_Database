-- 아래의 출력은 문제풀이를 위한 참조사항입니다.
select * from employees;
select * from salaries;
select * from departments;
select * from dept_manager;
select * from salaries;
select * from titles;
select * from dept_emp;


-- 문제1
select concat(first_name, last_name)
from employees
where emp_no = 10944;

-- 문제2
select concat(first_name, last_name) as '이름',
	   gender as '성별',
       hire_date as '입사일'
from employees
order by hire_date asc;

-- 문제3
select count(if(gender = 'F', gender, null)) as '여자', 
	   count(if(gender = 'M',gender,null)) as '남자' 
from employees;

-- 문제4
select distinct count(emp_no) as '직원수' 
from salaries
where to_date = '9999-01-01';

-- 문제5
select count(dept_no) as '부서갯수'
from departments;

-- 문제6
select count(emp_no) as '매니저 수'
from dept_manager
where to_date = '9999-01-01';

-- 문제7
select dept_name
from departments
order by length(dept_name) desc;

-- 문제8
select count(salary)
from salaries
where salary >= 120000 and to_date='9999-01-01';

-- 문제9
select distinct title
from titles
order by length(title) desc;

-- 문제10
select count(title) as 'Engineer'
from titles
where to_date = '9999-01-01';

-- 문제11
select title, from_date
from titles
where emp_no = 13250
order by from_date;