create table student(
stud_name varchar2(100),
stud_id number(8),
stud_std number(8),
stud_email varchar2(100),
dob date,
mobile_no number(10),
city varchar2(100)
)

select*from student;
insert into student(stud_name,stud_id ,stud_std,stud_email,dob ,mobile_no,city)
VALUES('Aaru Patil',01,01,'aaru123@email.com',to_date('07/26/2021','mm/dd/yyyy'),1234567890,'Pune');

insert into student(stud_name,stud_id ,stud_std,stud_email,dob ,mobile_no,city)
VALUES('shiv Patil',01,01,'shiv123@email.com',to_date('12/22/2021','mm/dd/yyyy'),1234567890,'Sanpule');
commit;

insert into student(stud_name,stud_id ,stud_std,stud_email,dob ,city)
VALUES('rituraj Patil',04,01,'ruturaj123@email.com',to_date('12/22/2021','mm/dd/yyyy'),'Sanpule');

commit;

update student
set mobile_no = 234553456 where stud_id = 4; 

insert into student(stud_name,stud_id ,stud_std,stud_email,dob ,mobile_no,city)
VALUES('rituraj Patil',05,01,'ruturaj123@email.com',to_date('12/22/2021','mm/dd/yyyy'),123245667,'Sanpule');

ROLLBACK;

commit;

alter table student
add country varchar2(50);

update student
set country = 'Bharat' where stud_id = 1;

update student
set country = 'india' where stud_id = 4;

update student
set country = 'india' where stud_id = 5;

ROLLBACK;

alter table student
drop column city;

desc student;

select*from student;

create table student_bkp as select* from student;

truncate table student;

select* from student;
select* from student_bkp;

alter table student
modify stud_id VARCHAR2(10);

alter table student
modify mobile_no VARCHAR2(15);

insert into student(select* from student_bkp);

update student
set mobile_no = 235+23413345 where stud_id = 4;

alter table student
rename column mobile_no to mobile;

alter table student
rename column dob to date_of_birth;

alter table student
rename column stud_name to stud_full_name;

delete from student where stud_id = 5;

select * from students;
rollback;

rename student to students;
rename students to student;
rename student to students;

create table student_test(no1 number(5),no2 number(3));
select* from student_test;

insert into student_test values(02,34);
savepoint a;
insert into student_test values(03,35);
savepoint b;
insert into student_test values(04,36);
savepoint c;
insert into student_test values(05,37);
savepoint d;
insert into student_test values(06,38);

rollback to c;
