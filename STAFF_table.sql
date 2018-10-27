/*
create table staff(name varchar(10), id number, address varchar(10), dept number, doj date, salary number);

insert into staff values('John', 1, 'BOSTON', 1, '03-Dec-2008', 18000);
insert into staff values('Bill', 2, 'CHILLE', 3, '04-Nov-2007', 15000);
insert into staff values('Mary', 3, 'KENYA', 1, '05-Jul-2007', 16000);
insert into staff values('David', 4, 'SYDNEY', 3, '04-Jun-2006', 20000);
insert into staff values('Nancy', 5, 'BELGIUM', 1, '18-Mar-2008', 13000);
insert into staff values('Smith', 6, 'DELHI', 4, '06-Nov-2007', 16000);
*/

--1) List the number of employees in each Dept:

select count(name), dept from staff group by dept;
/*
COUNT(NAME)       DEPT
----------- ----------
          3          1
          1          4
          2          3
*/

--2) Average salary of those Depts having more than 2 employees: 

select avg(salary) from staff group by dept having count(name) > 2;
/*
AVG(SALARY)
-----------
 15666.6667
*/

--3) The sum of salaries of employees drawing greater than or equal to 16000:

select sum(salary) from staff where salary >= 16000;
/*
SUM(SALARY)
-----------
      70000
*/

--4) Find out all the employees who have salary greater than at least one employee in the department 1 :

select * from staff where salary > (select min(salary) from staff where dept=1);
/*
NAME               ID ADDRESS          DEPT DOJ           SALARY
---------- ---------- ---------- ---------- --------- ----------
John                1 BOSTON              1 03-DEC-08      18000
Bill                2 CHILLE              3 04-NOV-07      15000
Mary                3 KENYA               1 05-JUL-07      16000
David               4 SYDNEY              3 04-JUN-06      20000
Smith               6 DELHI               4 06-NOV-07      16000
*/

--5) Create a view StaffView having employees who belong to department number 1 or 2: 

create view StaffView as select * from staff where dept=1 or dept=2;

/*
SQL> select * from StaffView;

NAME               ID ADDRESS          DEPT DOJ           SALARY
---------- ---------- ---------- ---------- --------- ----------
John                1 BOSTON              1 03-DEC-08      18000
Mary                3 KENYA               1 05-JUL-07      16000
Nancy               5 BELGIUM             1 18-MAR-08      13000
*/