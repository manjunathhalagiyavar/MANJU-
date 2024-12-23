5.book adopted 

1) STUDENT(regno: string, name:string, major: string, bdate: date)

Create table STUD(regno  varchar2(10) primary key, name varchar2(10), 
major varchar2(10), bdate  date);

SQL> desc stud;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REGNO                                     NOT NULL VARCHAR2(10)
 NAME                                               VARCHAR2(10)
 MAJOR                                              VARCHAR2(10)
 BDATE                                              DATE

SQL> insert into stud values('s1','Megha','BCA','14/nov/04');

1 row created.

SQL> insert into stud values('s2','Ashwarya','BCom','15/nov/04');

1 row created.

SQL> insert into stud values('s3','Soumya','BA','16/nov/05');

1 row created.

SQL> insert into stud values('s4','SOujnya','BBA','17/nov/05');

1 row created.

SQL> insert into stud values('s5','Basavaraj','BCA','18/nov/05');

1 row created.

SQL> select * from stud;

REGNO      NAME       MAJOR      BDATE
---------- ---------- ---------- ---------
s1         Megha      BCA        14-NOV-04
s2         Ashwarya   BCom       14-NOV-04
s3         Soumya     BA         16-NOV-05
s4         SOujnya    BBA        17-NOV-05
s5         Basavaraj  BCA        18-NOV-05



2) COURSE (course: int, cname: string, dept: string)


SQL> Create table COURSE (course_no number(4) primary key, 
cname varchar2(20), dept varchar2(10) );

Table created.

SQL> desc course
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COURSE_NO                                 NOT NULL NUMBER(4)
 CNAME                                              VARCHAR2(20)
 DEPT                                               VARCHAR2(10)

SQL> insert into course values(1,'Unix','CS');

1 row created.

SQL> insert into course values(2,'Algorithm','CS');

1 row created.

SQL> insert into course values(3,'DBMS','CS');

1 row created.

SQL> insert into course values(4,'JAVA','CS');

1 row created.

SQL> insert into course values(5,'OEC ENG','ENG');

1 row created.

SQL> insert into course values(6,'Account','Commerce');

1 row created.

SQL> select * from course;

 COURSE_NO CNAME                DEPT
---------- 	-------------------- ----------
         1 	Unix                 	CS
         2 	Algorithm            	CS
         3 	DBMS                 	CS
         4 	JAVA                 	CS
         5 	OEC ENG              	ENG
         6 	Account              	Commerce

6 rows selected.

3) ENROLL (regno: string, course#:int, sem: int marks:int)

Create table ENROLL (regno varchar2(10) references STUD(regno), 
course_no number(4) references COURSE (course_no), 
sem number(1), marks number(3));

SQL> desc enroll;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REGNO                                              VARCHAR2(10)
 COURSE_NO                                          NUMBER(4)
 SEM                                                NUMBER(1)
 MARKS                                              NUMBER(3)

SQL> insert into enroll values('s1',1,1,91);

1 row created.

SQL> insert into enroll values('s2',2,2,92);

1 row created.

SQL> insert into enroll values('s3',3,3,93);

1 row created.

SQL> insert into enroll values('s4',4,4,94);

1 row created.

SQL> insert into enroll values('s5',5,5,95);

1 row created.

SQL> insert into enroll values('s1',2,2,96);

1 row created.

SQL> select  * from enroll ;

REGNO       COURSE_NO        SEM      MARKS
---------- ---------- ---------- ----------
s1                  1          1         91
s2                  2          2         92
s3                  3          3         93
s4                  4          4         94
s5                  5          5         95
s1                  2          2         96

6 rows selected.

SQL>
4) TEXT(book-ISBN: int,book-title: string, publisher: string, author:string)

 SQL> create table TEXT(book_ISBN number(10) primary key ,book_title  varchar2(10), 
publisher varchar2(10),
    author varchar2(10));

Table created.

SQL> desc text;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BOOK_ISBN                                 NOT NULL NUMBER(10)
 BOOK_TITLE                                         VARCHAR2(10)
 PUBLISHER                                          VARCHAR2(10)
 AUTHOR                                             VARCHAR2(10)

SQL> insert into text values(1,'Unix','GFGC','Sagar');

1 row created.

SQL> insert into text values(2,'Algorithm','GFGC','Praveen');

1 row created.

SQL> insert into text values(3,'DBMS','GFGC','Rajeshwari');

1 row created.

SQL> insert into text values(4,'JAVA','GFGC','Jyoti');

1 row created.

SQL> insert into text values(5,'OEC','GFGC','Gurunath');

1 row created.

SQL> insert into text values(6,'Account','GFGC','Sumitra');

1 row created.

SQL> select * from text;

 BOOK_ISBN BOOK_TITLE PUBLISHER  AUTHOR
---------- ---------- ---------- ----------
         1 Unix       GFGC       Sagar
         2 Algorithm  GFGC       Praveen
         3 DBMS       GFGC       Rajeshwari
         4 JAVA       GFGC       Jyoti
         5 OEC        GFGC       Gurunath
         6 Account    GFGC       Sumitra

6 rows selected.
SQL>

5) BOOK_ADOPTION (course#:int, sem:int, book-ISBN#:int)

SQL> create table  BOOK_ADOPTION(
course_no number(4) references COURSE (course_no),
  sem number (1),
  book_ISBN number(10) references  TEXT(book_ISBN),
  constraint PKBA primary key (course_no,book_ISBN));

Table created.
i. Demonstrate how you add a textbook to the database and 
make this book be adapted by some
department.

SQL> insert into book_adoption values(1,1,1);

1 row created.

SQL> insert into book_adoption values(2,2,2);

1 row created.

SQL> insert into book_adoption values(3,3,3);

1 row created.

SQL> insert into book_adoption values(4,4,4);

1 row created.

SQL> insert into book_adoption values(5,5,5);

1 row created.

SQL> insert into book_adoption values(6,2,6);

1 row created.

SQL> select * from book_adoption;

 COURSE_NO        SEM  BOOK_ISBN
---------- ---------- ----------
         1          1          1
         2          2          2
         3          3          3
         4          4          4
         5          5          5
         6          2          6

6 rows selected.

ii. Produce list of textbooks (include Course#, Book-ISBN, Book-title) in the alphabetical order for
courses offered by the CS department that use more than two books.

select  a.course_no,a.book_isbn,b.book_title 
from book_adoption a,text b  where a.book_isbn=b.book_isbn 
and a.course_no in(select course_no from course where dept='CS')
order by b.book_title;



iii. List any department that has its adopted books published by a specific publisher.

select distinct dept 
from course a,text b,book_adoption c 
where a.course_no=c.course_no and c.book_isbn= b.book_isbn 
and publisher='GFGC'







Write PL/SQL program to demonstrate user defined exception handling.
