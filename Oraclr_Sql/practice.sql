--2nd highest salary

select max(salary) from employees where salary not in (select max(salary) from employees);
select max(salary) from employees where salary <(select max(salary) from employees);

--highest salary form each department
select max(salary),job_id from employees group by job_id;
select count(*),job_id from employees group by job_id;

--display odd no or even no record
select*from(select first_name,last_name,salary,job_id,rownum rn from employees order by rn )where mod(rn,2) = 0;

--find duplicated value and its frequency of a column
select first_name,count(*) from employees group by first_name having count(*)>1 ;

-- name start with A letter
select* from employees where first_name like 'A%';

-- name end with a letter
select* from employees where first_name like '%a';

-- name start and end with A letter
select* from employees where first_name  like '%A%';

-- name not content with A letter
select* from employees where first_name  not like '%A%';

-- name content 5 letter
select* from employees where first_name  like '_____';

-- name content 2nd posstion a letter
select* from employees where first_name  like '_a%';

-- hire_date is in december
select* from employees where hire_date  like '%DEC%';

--display 2nd row of table
select*from employees where rownum< =2 minus
select*from employees where rownum <= 1;
--or
select*from(select rownum r, employees.* from employees)where r = 2;

--display 2nd row of table
select*from employees where rownum< =4 minus
select*from employees where rownum <= 3;
--or
select*from(select rownum r, employees.* from employees)where r = 4;

-- JOINT
-- INNER JOINT :rigth table row is joined with left table row only if there is maching in r & l joint
select*from employees e,departments d where e.department_id=d.department_id;

--location_id = 1500 show the result from inner joint
select*from employees e, departments d where e.department_id = d.department_id and location_id = 1500;

--SELF JOIN:joint a table with itself is called self join comparing values of a vales with the values of 
--same column itself or different column values of the same table
select e1.first_name "first_id",e2.first_name "second_id" from employees e1,employees e2 where e2.employee_id = e1.job_id;

--LEFT JOIN: all rows from left side table matching value rows from right side table
--null values in place of non matching rows in other table
select * from employees e left join departments d on e.department_id = d.department_id;

--RIGHT JOIN: all rows from right side table matching value rows from left side table
--null values in place of non matching rows in other table
select * from employees e right join departments d on e.department_id = d.department_id;

--FULL JOIN:full join is viewd as a result of union opration of an inner join,left join and right join
--it returns all matched recored join condition is satisfied on both table
select * from employees e full join departments d on e.department_id = d.department_id;

--

select*from employees;
select*from departments;

