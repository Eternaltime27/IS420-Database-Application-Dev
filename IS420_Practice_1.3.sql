create table proj4
(
pname varchar,
startdate timestamp,
emps map<text,text>,
primary key(pname));

insert into proj4(pname, startdate, emps)
Values('UMBC Library','2019-01-11',{'Jeff':'IT','Emma':'IT'});

insert into proj4(pname, startdate, emps)
Values('UMBC Student Record','2019-03-01',{'Jeff':'IT','Bob':'IT'});

/*------------------------------------------------------------------------------*/

select *
from proj4;

/*------------------------------------------------------------------------------*/

select emps
from proj4
where pname = 'UMBC Library'
and emps contains 'IT' allow filtering;

/*------------------------------------------------------------------------------*/

create table emp5
(
dname varchar,
ename varchar,
hiredate timestamp,
salary varint,
proj list<Text>,
primary key(ename));

insert into emp5(Ename, Dname, Hiredate, Salary, proj)
values('Jeff', 'IT', '2019-02-03', 60000, ['UMBC Library','UMBC Student Record']);

insert into emp5(Ename, Dname, Hiredate, Salary, proj)
values('Susan', 'HR', '2016-01-03', 70000, []);

insert into emp5(Ename, Dname, Hiredate, Salary, proj)
values('Emma', 'IT', '2017-11-03', 80000, ['UMBC Library']);

insert into emp5(Ename, Dname, Hiredate, Salary, proj)
values('Bob', 'IT', '2018-01-03', 70000, ['UMBC Student Record']);

/*------------------------------------------------------------------------------*/

select *
from emp5;

/*------------------------------------------------------------------------------*/

select ename, dname
from emp5
where dname = 'IT'
and proj contains 'UMBC Student Record' allow filtering;

/*------------------------------------------------------------------------------*/

/*
Cassandra doesn't utilize join so we would have to denormalize the table into one table
that best fit our interest and needs. Our table would be...

Customer Name -  Transaction Date  - Product Name

This fits well because customer name and transaction is tied through CID and
Transaction and product is tied through PID.
SQL code would be... 

Create table name
(
cname int,
tdate timestamp,
pname varchar,
primary key (cname);

select pname
from name;

select cname, tdate,
from name,
where pname = ???? (whatever this might be)

No image for this one since its theoritical and there not actual values.
*/

create table firsttable
(
pid int,
cid int,
pname varchar,
cname varchar,
tdate timestamp,
primary key ((pid),cid));

insert into firsttable(pid,cid,pname,cname,tdate)
values(1,1,'IPhone 10', 'Jeff', '2019-02-01');

insert into firsttable(pid,cid,pname,cname,tdate)
values(1,2,'IPhone 10', 'Alice', '2019-01-01');

insert into firsttable(pid,cid,pname,cname,tdate)
values(2,1,'Harry Potter', 'Jeff', '2019-03-01');

insert into firsttable(pid,cid,pname,cname, tdate)
values(5,2,'Levi Jean', 'Alice', '2019-03-01');

select *
from firsttable;

Select cname, pname, tdate
from firsttable
where cname = 'Jeff' allow filtering;

/*------------------------------------------------------------------------------*/

create table secondtable
(
cid int,
pid int,
cname varchar,
pname varchar,
tdate timestamp,
primary key ((cid),pid));

insert into secondtable(cid,pid,cname,pname,tdate)
values(1,1,'Jeff','IPhone 10', '2019-02-01');

insert into secondtable(cid,pid,cname,pname,tdate)
values(2,1,'Alice','IPhone 10', '2019-01-01');

insert into secondtable(cid,pid,cname,pname,tdate)
values(1,2,'Jeff','Harry Potter', '2019-03-01');

insert into secondtable(cid,pid,cname,pname, tdate)
values(2,5,'Alice','Levi Jean', '2019-03-01');

select *
from secondtable;

Select cname,pname,tdate
from secondtable
where pname = 'Harry Potter' allow filtering;

