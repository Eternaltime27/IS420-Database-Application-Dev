/*cd "C:\Program files\apache-cassandra-3.11.14\bin"
cqlsh
*/

create keyspace hr_Lo with replication={'class':'SimpleStrategy', 'replication_factor':1};

use hr_Lo;

create table emp2
(
ename varchar,
dname varchar,
hiredate timestamp,
salary varint,
primary key((dname), ename)
);

insert into emp2(ename, dname, hiredate, salary)
VALUES('Jeff', 'IT','2019-02-03',60000);

insert into emp2(ename, dname, hiredate, salary)
VALUES('Susan', 'HR', '2016-01-03', 70000);

insert into emp2(ename, dname, hiredate, salary)
VALUES('Emma', 'IT', '2017-11-03', 80000);

insert into emp2(ename, dname, hiredate, salary)
VALUES('Bob', 'IT', '2018-01-03', 70000);

Select * from emp2;
/*------------------------------------------------------------------------------*/
Describe keyspaces;
/*------------------------------------------------------------------------------*/
Describe tables;
/*------------------------------------------------------------------------------*/
select ename, dname
from emp2
where dname = 'IT';
/*------------------------------------------------------------------------------*/
select ename,hiredate
from emp2
where hiredate > '2019-02-01'allow filtering;
/*------------------------------------------------------------------------------*/
select avg(salary)
from emp2;
/*------------------------------------------------------------------------------*/