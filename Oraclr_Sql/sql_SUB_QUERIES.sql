
select*from employees;
select max(salary)from employees;

select*from employees where salary = 99999;

select*from employees where salary = (select max(salary)from employees);

select*from employees where salary>(select avg(salary) from employees);

select*from employees where salary = (select max(salary)from employees group by department_id);
--RA-01427: single-row subquery returns more than one row

--Multirow subquery
select*from employees where (department_id,salary) in(select department_id,max(salary)from employees group by department_id);

select*from employees where department_id>ANY(30,60,90)order by department_id;
select*from employees where department_id>ANY(select department_id from departments where department_name in ('Purchasing','IT','Executive'))order by department_id;

select*from employees where department_id<ANY(30,60,90)order by department_id;

select*from employees where department_id<all(30,60,90)order by department_id;

select*from employees where department_id>all(30,60,90)order by department_id;

--whose employees job is the same as the job of 'Stephen'?

select*from employees where first_name = 'Stephen'--ST_CLERK

select*from employees where job_id=(
select job_id from employees where first_name = 'Stephen');

select*from employees where job_id = (select job_id from employees where first_name = 'Ellen')and salary> (select salary from employees where first_name = 'Ellen');--SA_REP

--senior employees in data
select*from employees where hire_date = (select min(hire_date) from employees);

--second hights salary
select * from employees where salary = 
(select max(salary) from employees where salary <
(select max(salary) from employees));
