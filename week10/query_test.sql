create index if not exists idx_employee_last_name on employee(last_name);
create index if not exists idx_employee_hire_date on employee(hire_date);
create index if not exists idx_employee_last_name_hire_date on employee(last_name, hire_date);
create index if not exists idx_employee_dept_from_to_date on dept_emp(dept_no, from_date, to_date);


-- 3
drop view if exists v_current_salary;
create view if not exists v_current_salary as
select e.emp_no, e.last_name || ' ' || e.first_name as name, s.amount
from employee e
join salary s on e.emp_no = s.emp_no
group by e.emp_no;

select * from v_current_salary;


-- 4
drop view if exists v_current_managers;
create view if not exists v_current_managers as
select manager.emp_no, e.first_name || ' ' || e.last_name as name, s.amount
from dept_manager manager
join salary s on manager.emp_no = s.emp_no
join employee e on manager.emp_no = e.emp_no
group by manager.emp_no;
select * from v_current_managers;


