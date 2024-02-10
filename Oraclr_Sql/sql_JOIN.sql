--JOINS
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

--I) Equi joint :

--four type
-- 1) inner
--2) left 
--3) Right
--4) full

--2) nON Equi join:

--two method 
--1) implicit method
--1) inner join
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a,country b where
a.country_id = b.country_id;

--2) left 
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a,country b where
a.country_id = b.country_id(+);

--3) Right
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a,country b where
a.country_id(+) = b.country_id;

--4) full
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a,country b where
a.country_id = b.country_id(+)
UNION
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a,country b where
a.country_id(+) = b.country_id;

--2) ansi method
--1) inner join
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a inner join country b
on a.country_id = b.country_id;

--2) left 
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a left join country b
on a.country_id = b.country_id;

--3) Right
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a right join country b on
a.country_id = b.country_id;

--4) full
select a.cust_id,a.cust_name,a.mob_no,a.email,
a.country_id,b.country_name from customer a full join country b on
a.country_id = b.country_id;

--II) nON Equi join:

--two method 
--1) implicit method




--2) ansi method
