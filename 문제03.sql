
-- 문제 1
select	employees.emp_no as '사번',
		concat(employees.last_name, ' ' , employees.first_name) as '이름',
        salaries.salary as '급여'
from 	employees, salaries
where	employees.emp_no = salaries.emp_no
	and salaries.to_date = '9999-01-01'
order by salaries.salary desc;


-- 문제 2
select	employees.emp_no as '사번',
		concat(employees.last_name, ' ' , employees.first_name) as '이름',
        titles.title
from	employees, titles
where	employees.emp_no = titles.emp_no
	and titles.to_date = '9999-01-01'
order by  concat(employees.last_name, ' ' , employees.first_name) asc;


-- 문제 3
select	employees.emp_no as '사번',
		concat(employees.last_name, ' ' , employees.first_name) as '이름',
        departments.dept_name as '부서'
from	employees, departments, dept_emp
where	employees.emp_no = dept_emp.emp_no
	and dept_emp.to_date = '9999-01-01'
order by concat(employees.last_name, ' ', employees.first_name) asc;


-- 문제 4
select	employees.emp_no as '사번',
		concat(employees.last_name, ' ' , employees.first_name) as '이름',
		salaries.salary '연봉',
        titles.title '직책',
        departments.dept_name as '부서'
from	employees, departments, dept_emp, titles, salaries
where	titles.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01'
    and salaries.to_date = '9999-01-01'
	and	employees.emp_no = salaries.emp_no
	and employees.emp_no = titles.emp_no
	and employees.emp_no = dept_emp.emp_no
	and departments.dept_no = dept_emp.dept_no
order by concat(employees.last_name, ' ', employees.first_name) asc;


-- 문제 5
select	employees.emp_no as '사번',
		concat(employees.last_name, ' ' , employees.first_name) as '이름'
from	employees, titles
where	titles.to_date <> '9999-01-01'
		and titles.title = 'Technique Leader';
        
        
-- 문제 6
select	concat(employees.last_name, ' ' , employees.first_name) as '이름',
		departments.dept_name as '부서명',
        titles.title as '직책'
from	employees, departments, titles, dept_emp
where	employees.emp_no = titles.emp_no
	and employees.emp_no = dept_emp.emp_no
	and dept_emp.dept_no = departments.dept_no
    and employees.last_name like 'S%'
    and titles.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01';
    

-- 문제 7
select	concat(employees.last_name, ' ' , employees.first_name) as '이름',
		salaries.salary
from	employees, titles, salaries
where	titles.title = 'Engineer'
	and salaries.salary >= 40000
	and salaries.emp_no = employees.emp_no
    and titles.emp_no = employees.emp_no
    and salaries.to_date = '9999-01-01'
    and titles.to_date = '9999-01-01'
order by salaries.salary desc;


-- 문제 8
select	titles.title as '직책',
		salaries.salary as '급여'
from	titles, salaries
where	titles.emp_no = salaries.emp_no
	and salaries.salary >= 50000
    and titles.to_date = '9999-01-01'
    and salaries.to_date = '9999-01-01'
order by salaries.salary desc;


-- 문제 9
select 	departments.dept_name as '부서',
		avg(salaries.salary) as '평균 연봉'
from	departments, dept_emp, salaries, employees
where	salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01'
    and employees.emp_no = salaries.emp_no
    and employees.emp_no = dept_emp.emp_no
    and departments.dept_no = dept_emp.dept_no
group by departments.dept_name
order by avg(salaries.salary) desc;


-- 문제 10
select	titles.title as '직책',
		avg(salaries.salary) as '평균 연봉'
from	titles, employees, dept_manager, departments, salaries
where	salaries.to_date = '9999-01-01'
	and titles.to_date = '9999-01-01'
    and titles.emp_no = employees.emp_no
    and employees.emp_no = dept_manager.emp_no
    and dept_manager.dept_no = departments.dept_no
    and salaries.emp_no = employees.emp_no
group by titles.title
order by avg(salaries.salary);
		



-- ------------------------------------------------------
-- ppt p.119 예제문제
-- 예제 5
select	titles.title as '직책',
		avg(salaries.salary) as '평균연봉',
        count(*) as '인원수'
from	salaries, titles, employees
where	salaries.to_date = '9999-01-01'
	and titles.to_date = '9999-01-01'
    and employees.emp_no = salaries.emp_no
    and employees.emp_no = titles.emp_no
group by titles.title
having	count(titles.title) >= 100;


-- 예제 6
select	departments.dept_name as '부서이름',
		avg(salaries.salary) '평균연봉'
from	salaries, employees, departments, dept_emp, titles
where	salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01'
	and titles.to_date = '9999-01-01'
    and employees.emp_no = salaries.emp_no
    and employees.emp_no = dept_emp.emp_no
    and employees.emp_no = titles.emp_no
    and departments.dept_no = dept_emp.dept_no
	and titles.title = 'Engineer'
group by departments.dept_name;


-- 예제 7
select	titles.title as '직책',
		sum(salaries.salary) as '급여 총합'
from	titles, employees, salaries
where	salaries.to_date = '9999-01-01'
	and titles.to_date = '9999-01-01'
    and employees.emp_no = salaries.emp_no
    and employees.emp_no = titles.emp_no
    and titles.title <> 'Engineer'
group by titles.title
having sum(salaries.salary) >= 2000000000
order by sum(salaries.salary) desc;



-- 아래의 sql문은 테이블 조회를 위한 sql문입니다.
select * from salaries;
select * from employees;
select * from dept_emp;
select * from titles;
select * from departments;