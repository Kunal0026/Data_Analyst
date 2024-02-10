select* from employees;

select employee_id,first_name||last_name full_name,email,hire_date,salary,department_id from employees;

select employee_id,concat(concat(first_name,''),last_name) full_name,email,hire_date,salary,department_id from employees;

select employee_id,first_name||last_name full_name,email,hire_date,salary,salary+1000 new_salary,department_id from employees;

select employee_id,first_name||last_name full_name,email,hire_date,salary,salary*12 annual_salary,department_id from employees;

select distinct department_id from employees;

select count(distinct department_id) from employees;

-- where clause

select * from employees where salary>10000;
select*from employees where salary<3000;
select*from employees where salary > 5000 and salary < 7000;
select*from employees where salary<3000 and salary > 5000;
select*from employees where salary between 5000 and 8000;
select*from employees where salary between 20000 and 30000;

select*from employees where department_id in (30,34,45);
select * from employees where department_id not in (23,45,65,45);

select*from employees where department_id = 80 and salary >10000;

select *from employees where department_id= 60 and salary >15000;

select*from employees where department_id = 60 or salary> 15000;
select*from employees where to_char(hire_date,'mon') = 'feb';
select*from employees where to_char(hire_date,'fmday') = 'monday';

