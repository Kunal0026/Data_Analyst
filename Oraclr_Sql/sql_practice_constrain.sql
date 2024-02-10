--constraint

create table city(
city_id number(4),
city_name varchar2(30)
);

insert into city values(10,'pune');
insert into city values(11,'munmbai');
insert into city values(12,'delhi');
insert into city values(13,'Nashik');
rollback;
select*from city;

create table customer(
cust_id number(8) primary key,
cust_name varchar2(30)not null,
mobile_no number(10)unique check(length(mobile_no)=10),
age number(5) check(age>=18),
city_id number(6)references city(city_id)
);