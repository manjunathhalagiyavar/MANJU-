7. Consider the schema for Company Database:

SQL> create table DEPARTMENT7(DNo number(4) primary key, 
DName varchar2(10), MgrStartDate date);

Table created.

SQL> desc department7;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNO                                       NOT NULL NUMBER(4)
 DNAME                                              VARCHAR2(10)
 MGRSTARTDATE                                       DATE

insert into department7 values(1,'Production','');


SQL> create table EMPLOYEE7(SSN number(4) primary key,Name varchar2(10),
  2  Address varchar2(10),Sex char(1),Salary number(8,2),
  3  SuperSSN number(4) references EMPLOYEE7(ssn) ,
  4  DNo number(4) references department7(dno));

Table created.

SQL> desc employee7;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SSN                                       NOT NULL NUMBER(4)
 NAME                                               VARCHAR2(10)
 ADDRESS                                            VARCHAR2(10)
 SEX                                                CHAR(1)
 SALARY                                             NUMBER(8,2)
 SUPERSSN                                           NUMBER(4)
 DNO                                                NUMBER(4)

SQL> insert into employee7 values(1,'Megha','Hubli','F',40000,'',1);

1 row created.

alter table DEPARTMENT7 add(MgrSSN number(4) references employee7(ssn)) 

SQL> alter table DEPARTMENT7 add(MgrSSN number(4) references employee7(ssn)) ;

Table altered.

SQL> desc department7;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNO                                       NOT NULL NUMBER(4)
 DNAME                                              VARCHAR2(10)
 MGRSTARTDATE                                       DATE
 MGRSSN                                             NUMBER(4)

SQL> alter table DEPARTMENT7 add(MgrSSN number(4) references employee7(ssn)) ;

Table altered.

SQL> desc department7;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNO                                       NOT NULL NUMBER(4)
 DNAME                                              VARCHAR2(10)
 MGRSTARTDATE                                       DATE
 MGRSSN                                             NUMBER(4)

SQL> update department7 set mgrssn=1,mgrstartdate='1-oct-2023';

1 row updated.

SQL> select *from department7;

       DNO DNAME      MGRSTARTD     MGRSSN
---------- ---------- --------- ----------
         1 Production 01-OCT-23          1

SQL> insert into department7 values(2,'Marketing','1-oct-23',1);

1 row created.

SQL> insert into department7 values(3,'Accounts','1-oct-23',1);

1 row created.

SQL> insert into department7 values(4,'HR','1-oct-23',1);

1 row created.

SQL> insert into department7 values(5,'Computer','1-oct-23',1);

1 row created.

SQL> select *from department7;

       DNO DNAME      MGRSTARTD     MGRSSN
---------- ---------- --------- ----------
         1 Production 01-OCT-23          1
         2 Marketing  01-OCT-23          1
         3 Accounts   01-OCT-23          1
         4 HR         01-OCT-23          1
         5 Computer   01-OCT-23          1

SQL> insert into employee7 values(2,'Tasmiya','Hebbali','F',30000,1,2);

1 row created.

SQL> insert into employee7 values(3,'Gangappa','Kittur','M',30000,1,3);

1 row created.

SQL> insert into employee7 values(4,'Bharati','Bailhongal','F',30000,1,4);

1 row created.

SQL> insert into employee7 values(5,'Pallavi','Ayatti','F',30000,1,5);

1 row created.

SQL> select * from employee7;

       SSN NAME       ADDRESS    S     SALARY   SUPERSSN        DNO
---------- ---------- ---------- - ---------- ---------- ----------
         1 Megha      Hubli      F      40000                     1
         2 Tasmiya    Hebbali    F      30000          1          2
         3 Gangappa   Kittur     M      30000          1          3
         4 Bharati    Bailhongal F      30000          1          4
         5 Pallavi    Ayatti     F      30000          1          5


SQL> create table DLOCATION7(DNo number(4) references department7(dno),
  2  DLoc varchar2(10));
Table created.
SQL> desc dlocation7;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNO                                                NUMBER(4)
 DLOC                                               VARCHAR2(10)

SQL> insert into dlocation7 values(1,'Hubbali');

1 row created.

SQL> insert into dlocation7 values(2,'Hebbali');

1 row created.

SQL> insert into dlocation7 values(3,'Kittur');

1 row created.

SQL> insert into dlocation7 values(4,'Bailhongal');

1 row created.

SQL> insert into dlocation7 values(5,'Ayatti');

1 row created.

SQL> select *from dlocation7;

       DNO DLOC
---------- ----------
         1 Hubbali
         2 Hebbali
         3 Kittur
         4 Bailhongal
         5 Ayatti


SQL> create table PROJECT7 (PNo number(4) primary key, PName varchar2(10),
  2   PLocation varchar2(10), DNo number(4) references department7(dno));

Table created.

SQL> desc project7;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PNO                                       NOT NULL NUMBER(4)
 PNAME                                              VARCHAR2(10)
 PLOCATION                                          VARCHAR2(10)
 DNO                                                NUMBER(4)

SQL>SQL> insert into project7 values(1,'Car Prod','Hubali',1);

1 row created.

SQL> insert into project7 values(2,'Car Mkt','Hebbali',2);

1 row created.

SQL> insert into project7 values(3,'Car Ac','Dharwad',3);

1 row created.

SQL> insert into project7 values(4,'Car HR','Bailhongal',4);

1 row created.

SQL> insert into project7 values(5,'Car CS','Ayatti',5);

1 row created.

SQL> select *from project7;

       PNO PNAME      PLOCATION         DNO
---------- ---------- ---------- ----------
         1 Car Prod   Hubali              1
         2 Car Mkt    Hebbali             2
         3 Car Ac     Dharwad             3
         4 Car HR     Bailhongal          4
         5 Car CS     Ayatti              5

create table WORKS_ON(SSN number(4) references EMPLOYEE7(SSN), 
PNo number(4) references PROJECT7(PNO), Hours number(3),
primary key(SSN,PNo));

SQL> insert into WORKS_ON values(1,1,10);

1 row created.

SQL> insert into WORKS_ON values(2,2,20);

1 row created.

SQL> insert into WORKS_ON values(3,3,30);

1 row created.

SQL> insert into WORKS_ON values(4,4,40);

1 row created.

SQL> insert into WORKS_ON values(5,5,50);

1 row created.

SQL> select * from WORKS_ON;

       SSN        PNO      HOURS
---------- ---------- ----------
         1          1         10
         2          2         20
         3          3         30
         4          4         40
         5          5         50


Create the above tables by properly specifying the primary keys and the foreign Keys
Enter at least five tuples for each relation.
Write SQLq ueries to
i. Make a list of all project numbers for projects that involve an employee whose last name is 
‘Scott’, either as a worker or as a manager of the department that controls the project.


SQL> (SELECT DISTINCT P.PNO
  2  FROM PROJECT7 P, EMPLOYEE7 E, WORKS_ON W
  3  WHERE E.NAME='Megha' AND E.SSN=W.SSN AND W.PNO=P.PNO)
  4  UNION
  5  (SELECT DISTINCT P.PNO
  6  FROM PROJECT7 P,EMPLOYEE7 E,DEPARTMENT7 D
  7  WHERE E.NAME='Megha' AND P.DNO=D.DNO AND D.MGRSSN=E.SSN);

       PNO
----------
         1
         2
         3
         4
         5

ii. Show the resulting salaries if every employee working on the ‘IoT’ project is given 
a10 percentraise.

SQL> SELECT SALARY*1.1
  2  FROM EMPLOYEE7 E,PROJECT7 P,WORKS_ON W
  3  WHERE P.PNAME='Car CS' AND E.SSN=W.SSN AND P.PNO=W.PNO;

SALARY*1.1
----------
     33000

iii. Find the sum of the salaries of all employees of the ‘Accounts’ department,
as well as the maximum salary, the minimum salary, and the average salary in
this department.

SQL> SELECT SUM(SALARY),MAX(SALARY),MIN(SALARY),AVG(SALARY)
  2  FROM EMPLOYEE7 E, Department7 D
  3  where E.dno=d.dno and d.dname='Accounts';

SUM(SALARY) MAX(SALARY) MIN(SALARY) AVG(SALARY)
----------- ----------- ----------- -----------
      55000       30000       25000       27500



iv. Create a view with columns dept name and dept location. Display name of dept located in
'Kittur' this view.

SQL> create view Kitturdept as select dname,dloc 
	from department7 D,dlocation7 L
	where d.dno=l.dno and dloc='Kittur';

View created.

SQL> select * from kitturdept;

DNAME      DLOC
---------- ----------
Accounts   Kittur

Write PL/SQL program to demonstrate explicit cursor.
DECLARE
    -- Declare an explicit cursor
    CURSOR emp_cursor IS
        SELECT SSN, name, salary
        FROM employee7
        WHERE DNO = 3;

    -- Variables to hold fetched data
    emp_id employee7.SSN%TYPE;
    emp_name employee7.name%TYPE;
    emp_salary employee7.salary%TYPE;
BEGIN
    -- Open the cursor
    OPEN emp_cursor;

    -- Loop through the rows returned by the cursor
    LOOP
        FETCH emp_cursor INTO emp_id, emp_name, emp_salary;

        -- Exit the loop when no more rows are found
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Display the fetched data
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_id);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_name);
        DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || emp_salary);
    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;
END;
/


