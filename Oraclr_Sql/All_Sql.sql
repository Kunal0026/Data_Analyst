select * from city;
select * from country;
select * from countries;
select * from employees;

-- seccesion 1
SELECT  entertainer_id,
        entertainer_groupname
FROM    casestudy_entertainer
INNER JOIN casestudy_availability ON casestudy_entertainer.entertainer_id = casestudy_availability.availability_entertainerid
INNER JOIN casestudy_calendardates ON casestudy_availability.availibility_calendardateid = casestudy_calendardates.calendar_id
WHERE entertainer_type = '&Entertainer_TYPE'
  AND casestudy_calendardates.calendar_date = '&Event_date';

create table Frid_list 
(
name varchar2(30),
Add varchar2(40),
mobile_no number(10),
email varchar2(20)
);

create table customers
(
cust_id number(6),
cust_name varchar2(50),
mobile_no number(10),
dob date,
city varchar2(30),
email_id varchar2(30)
);
select * from customers;

desc customers;



-- seccesion 2
insert into customers
(cust_id,cust_name,mobile_no,dob,city,email_id)
values(1001,'Arun',8080808080,to_date('01/09/2024','mm/dd/yyyy'),'pune','arun123@gmail.com');

rollback;

insert into customers
(cust_id,cust_name,mobile_no,dob,city,email_id)
values(1001,'Arun',8080808080,to_date('09/01/2024','mm/dd/yyyy'),'pune','arun123@gmail.com');

commit;

insert into customers
(cust_id,cust_name,dob,city,email_id)
values(1002,'Anurag',to_date('01/08/2024','mm/dd/yyyy'),'Mumbai','anurag124@gmail.com');

commit;
--update
update customers
set mobile_no = 7878787878;

rollback;

update customers
set mobile_no = 7878778783 where cust_id = 1002;

commit;

rollback;

-- add column
alter table customers
add country varchar2(30);

commit;

update customers
set country = 'india' where cust_id = 1001;

commit;

rollback;

update customers
set country = 'Bharta' where cust_id = 1002;

commit;

-- drop a column

alter table customers
drop column city;

desc customers;

insert into customers
(cust_id,cust_name,mobile_no,dob,email_id)
values(1003,'Arjun',9580808080,to_date('01/07/2024','mm/dd/yyyy'),'arjun1345@gmail.com');

update customers
set country = 'Bharta' where cust_id = 1003;

commit;

rollback;

insert into customers
(cust_id,cust_name,mobile_no,dob,email_id)
values(100300000000,'Arjun',+91-9580808080,to_date('01/07/2024','mm/dd/yyyy'),'arjun1345@gmail.com');

-- ORA-01438: value larger than specified precision allowed for this column

CUST_ID         NUMBER(6)
MOBILE_NO       NUMBER(10)  

alter table customers
modify cust_id number(10);

alter table customers
modify cust_id number(9);

-- 01440. 00000 -  "column to be modified must be empty to decrease precision or scale"

desc customers;

select * from customers;

-- problem 1) we change the data type of mobile_no column
-- 1) bkp a table
-- 2) truncate base table
-- 3) modify data type
-- 4) restore the data 
-- 5) drop bkp table

create table customers_bkp as select * from customers;
create table customers_bkp1 as select * from customers where 1 = 2;

select * from customers_bkp1;
select * from customers_bkp;

truncate table customers;
select * from customers;

rollback;
 
alter table customers
modify cust_id number(9);

alter table customers
modify mobile_no varchar2(15);

desc customers;

insert into customers(select * from customers_bkp);

insert into customers
(cust_id,cust_name,mobile_no,dob,email_id)
values(100300000,'Arjun',+91-9580808080,to_date('01/07/2024','mm/dd/yyyy'),'arjun1345@gmail.com');


select * from customers;

select * from customers_bkp;

delete from customers_bkp;

drop table customers_bkp;

select * from customers;

insert into customers
(cust_id,cust_name,dob,email_id,country)
values(1003,'Arun',to_date('01/09/2024','mm/dd/yyyy'),'arun124@gmail.com','india');

delete from customers where cust_id = 1001;

alter table customers
rename column mobile to mobile_no;

update customers
set mobile_no = 8080808080 where cust_id = 1002;

update customers 
set mobile_no = 9090909090 where cust_id = 1003;

alter table customers
rename column dob to data_of_birth;

-- rename of table name
rename customers to customers_2;

select * from customers_2;

-- SavePoint

create table customer_test(no1 number(3), no2 number(3));

insert into customer_test values (1,2);
savepoint a;
insert into customer_test values (3,4);
savepoint b;
insert into customer_test values (5,6);
savepoint c;
insert into customer_test values (7,8);

rollback to c;

select* from customer_test;


--seccesion 3

--Contraints in oracle

create table city
(
city_id number(4),
city_name varchar2(30)
);

insert into city
(city_id,city_name)values(10,'Pune');
insert into city
(city_id,city_name)values(20,'Mumbai');
insert into city
(city_id,city_name)values(30,'Nagpur');
insert into city
(city_id,city_name)values(40,'Jalgaon');

select * from city;

create table customress
(
cust_id number(6) primary key,
cust_name varchar2(25) not null,
mobile_no number(10) unique check(length(mobile_no) =10),
age number(3) check(age>=18),
city_id number(4) references city(city_id)
);

insert into customress values (100000,'Arun',9090909090,28,20);
insert into customress values (100001,'Arun',8080808080,31,30);
insert into customress values (100002,'Vijay',5050505050,31,10);
insert into customress values (100003,'Ajith',2894738243,13,30);
insert into customress values (100004,'Ramesh',2894738789,31,60);

select * from customress;


-- Seccesion 4

select * from employees;
select employee_id,first_name,last_name,email,hire_date,salary,department_id from employees;

-- column concatenation
select employee_id associate_id,first_name||' '||last_name full_name,email,hire_date,salary,department_id from employees;
--or
select employee_id,concat(concat(first_name,' '),last_name) full_name,email,hire_date,salary,department_id from employees;

--column catculation

select employee_id,first_name,last_name,email,hire_date,salary,salary*12 annual_salary,department_id from employees;

select * from employees;
select distinct department_id from employees;
select count(distinct department_id) from employees;


--and
select first_name||' '||last_name full_name,salary from employees where salary > 5000 and salary < 10000;
select first_name||' '||last_name full_name,salary from employees where salary not between 500 and 7000;

-- In

select * from employees where department_id in(30,60,90);
select * from employees where department_id not in (10,20,30,50,60);

select * from employees where job_id in('SA_MAN','AD_VP','FI_MGR');

select * from employees where department_id  = 60 and job_id = 'IT_PROG' ;

-- or

select * from employees where department_id  = 60 or job_id = 'IT_PROG' ;

select count(*) from employees where commission_pct is not null;
select count(*) from employees where commission_pct is null;

select * from employees where to_char(hire_date,'mmyyyy') = '032005';
select*from employees where to_char(hire_date,'fmday') = 'monday';

-- LIKE '%%'

select * from employees where first_name like 'A%';
select * from employees where first_name like '%s';

select * from employees where first_name like '%an%';
select * from employees where first_name like 'S%n';

select * from employees where first_name like '_____';
select * from employees where first_name like '_a___';
select * from employees where first_name like '_a_t__';


--  Order by

select * from employees order by first_name ;
select * from employees order by first_name desc;

select * from employees order by salary desc ;
select * from employees order by salary desc,hire_date ;

select * from employees order by 3 ;
select * from employees order by 8 desc,6 ;

select employee_id,first_name,last_name,salary,email from employees order by 3 ;


-- Seccesion 5

-- singlr row function

select employee_id,first_name,last_name,upper(first_name),lower(first_name),initcap(first_name)
,length(first_name),reverse(first_name) from employees;

select * from employees where first_name = 'john';

--substr

select substr('welcome to india1!!',12,5)from dual;
select substr('welcome to india1!!',12)from dual;
select substr('welcome to india1!!',-8)from dual;
select substr('welcome to india1!!',-8,5)from dual;

-- instr will return the position of the character

select instr('corporate floor','r')from dual;
select instr('corporate floor','r',1,2)from dual;
select instr('corporate floor','ab')from dual;
select instr('corporate floor','or',3,2)from dual;

-- left side pading LPAD and Rigth side pading

select lpad('welcome',15,'*') from dual;
select rpad('welcome',15,'*') from dual;
select lpad(rpad('welcome',15,'*'),23,'*') from dual;

select salary,lpad(salary,5,0) new_salary from employees;

-- LTRIM AND RTRIM trim: use to remove space 

select ltrim('     welcome     ')from dual;
select rtrim('     welcome     ')from dual;
select trim('     welcome     ')from dual;

select ltrim('00000000000012345','0') from dual;
select ltrim('000000000000123456785876979576','012') from dual;
select rtrim('456785876972123121200000000000','012') from dual;

select ltrim(rtrim('00122100123456654301210000120','012'),'012') from dual;


-- replace

select replace('jack and jue','j','bl') from dual;

select replace(job,'manager','boss') from employees;

select translate('welcome to chennai','abcdef','wxyz')from dual;

select employee_id,first_name,last_name,salary,commission_pct,salary+(salary*commission_pct)total_salary from employees;

select employee_id,first_name,last_name,salary,commission_pct,salary+(salary*nvl(commission_pct,0))total_salary from employees;


-- round : round the value

select round(0.7) from dual;
select round(2.7) from dual;
select round(4.47) from dual;
select round(34567.3457) from dual;
select round(546746.467,-2) from dual;


--trunc will always take base value

select trunc(0.7878)from dual;
select trunc(5858.7878)from dual;
select trunc(45646.3878)from dual;
select trunc(5467.7878,2)from dual;
select trunc(567867.7878,3)from dual;
select trunc(56786786.7878,4)from dual;
select trunc(56786786.7878,-1)from dual;
select trunc(56786786.7878,-2)from dual;
select trunc(56786786.7878,-3)from dual;


------------------------ joins -----------------------------------------------------


-- 1) Equi join : an equi join is a type of join that combines tables based on matching
-- value in specified columns.

-- 2) Nno-Equi join : the non equi joins is such a join which match column value 
--from different tables based on an inequality 
--(instead of the equal sign like >,<,>=,<=) expression

4 type of equi join:
=======================

inner join
left outer join
right outer join
full outer join

2 methods to write join query:
===============================

1) implicit methods
2) Anci methods


create table customer
(
cust_id number,
cust_name varchar2(50),
mob_no number(10),
email varchar2(50),
country_id number(3)
);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1000,'Kannan',8989898989,'kannan@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1001,'Arun',8989898990,'arun@gmail.com',204);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1002,'Karthik',8989898991,'Karthik@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1003,'Shankar',8989898992,'shankar@gmail.com',203);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1004,'Sree',8989898993,'Sree@gmail.com',205);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1005,'Babu',8989898994,'Babu@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1006,'Radha',8989898995,'Radha@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values
(1007,'Senthil',8989898996,'Senthil@gmail.com',200);
commit;


create table country
(
Country_id number(3),
Country_name varchar2(50)
);
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (200,'INDIA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (201,'CHINA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (202,'USA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (203,'SINGAPORE');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (204,'UK');
commit;

select * from customer;
select * from country;

I) inner join :

1) implicit methods
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from customer a,
country b where a.country_id = b.country_id;

2) Anci methods
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from 
customer a inner join country b on a.country_id = b.country_id;

II) left outer join :

1) implicit methods
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from
customer a ,country b where a.country_id = b.country_id(+);

2) Anci methods
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from 
customer a left join country b on a.country_id = b.country_id;


III) Rigth outer join :


1) implicit methods :
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from 
customer a , country b where a.country_id(+) = b.country_id;

2) Anci methods :
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from
customer a right join country b on a.country_id = b.country_id;


IV) Full join :

1) implicit methods :
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from
customer a , country b where a.country_id = b.country_id(+) 
union
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from
customer a , country b where a.country_id(+) = b.country_id; 


2) Anci methods :
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from
customer a full join country b on a.country_id = b.country_id;


-- cross join or cartesian product


select
e1.employee_id,
e1.first_name,
'reports to',
e2.employee_id,
e2.first_name
from employees e1,employees e2
where e1.manager_id=e2.employee_id order by e1.employee_id;

select
e1.employee_id,
e1.first_name,
'reports to',
e2.employee_id,
e2.first_name
from employees e1 inner join employees e2
on e1.manager_id=e2.employee_id order by e1.employee_id;

select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;
select count(salary) from employees;
select avg(salary) from employees;

create table studentss
(
Stud_id number(6),
Stud_name varchar(30),
Year_of_study number(6),
Maths number(6),
Physics number(6),
Chemistry number(6),
Biology number(6)
);

insert into studentss
values(1000, 'Neena' ,1, 89, 84, 90, 79);
insert into studentss
values(1001, 'Lex', 1, 80, 99, 84, 74);
insert into studentss
values(1002, 'Alexander', 1, 94, 92, 87, 81);
insert into studentss
values(1003, 'Bruce', 1, 90, 94, 98, 84);
insert into studentss
values(1004, 'David', 1, 92, 86, null, 94);
insert into studentss
values(1005, 'Valli', 2, 85, 87, 93, 93);
insert into studentss
values(1006, 'Diana', 2, 79, 90, 96, 88);
insert into studentss
values(1007, 'Nancy', 2, 72, 91, 85, 92);
insert into studentss
values(1008, 'Daniel', 2, 98, 84, 88, 87);

select * from studentss;

select stud_id,stud_name,year_of_study, maths, physics, nvl(chemistry,0),biology
,(maths+physics+nvl(chemistry,0)+biology) total_mark, (maths+physics+nvl(chemistry,0)+biology)/4 avg_mark from studentss;

select max(maths) from studentss group by year_of_study;

select avg(maths) from studentss group by year_of_study;

select max(salary) from employees;

select max(salary) from employees;

select e.department_id,d.department_name, sum(salary)
from employees e , departments d
where e.department_id=d.department_id and e.department_id is not null
group by e.department_id,d.department_name
having sum(salary) >50000 order by 1;



















select * from employees where salary =(select max(salary) from employees);

SELECT emp.*

FROM employees emp

INNER JOIN Employee mgr ON emp.manager_id = mgr.employee_id

WHERE emp.salary > mgr.salary;
