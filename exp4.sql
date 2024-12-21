AUTHOR(author-id:int,name:string,city:string,country:string)
PUBLISHER(publisherid:int,name:string,city:string,country:string)
CATALOG(bookid:int,title:string,author-id#:int,publisher-id#:int,category-id#:int,year:int,price:int)
CATEGORY(category-id:int, description: string)
ORDER-DETAILS(order-no:int, #book-id:int, quantity:int

Create the above tables by properly specifying the primary keys and the foreign keys.

Enter at least five tuples for each relation.

Write SQL queries to
i. Give the details of the authors who have 2or more books in the catalog and the price of the books
is greater than the average price of the books in the catalog.
ii. Find the author of the book, which has maximum sales.
iii. Demonstrate how you increase the price of books published by a specific publisher by10%.
Write PL/SQL program illustrates how to create and call a function

SQL> create table AUTHOR(author_id number(4) primary key,
 name varchar(30),city varchar(30),country varchar(30));

Table created.

SQL> desc author
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 AUTHOR_ID                                             NOT NULL NUMBER(4)
 NAME                                                           VARCHAR2(30)
 CITY                                                           VARCHAR2(30)
 COUNTRY                                                        VARCHAR2(30)

SQL> desc author
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 AUTHOR_ID                                             NOT NULL NUMBER(4)
 NAME                                                           VARCHAR2(30)
 CITY                                                           VARCHAR2(30)
 COUNTRY                                                        VARCHAR2(30)

SQL> insert into author values(1,'Sagar','Belagavi','India');

1 row created.

SQL> insert into author values(2,'Prakash','Hubbali','India');

1 row created.

SQL> insert into author values(3,'Vinayak','Dharwad','India');

1 row created.

SQL> insert into author values(4,'Jyoti','Dharwad','India');

1 row created.

SQL> insert into author values(5,'Rajeshwari','Hubbali','India');

1 row created.

SQL> select * from author;

 AUTHOR_ID NAME                           CITY                           COUNTRY
---------- ------------------------------ ------------------------------ ------------------------------
         1 Sagar                          Belagavi                       India
         2 Prakash                        Hubbali                        India
         3 Vinayak                        Dharwad                        India
         4 Jyoti                          Dharwad                        India
         5 Rajeshwari                     Hubbali                        India

SQL> create table PUBLISHER(publisher_id number(4)  primary key,name varchar(30),
city varchar(30), country varchar(30))

Table created. 

SQL> desc publisher
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PUBLISHER_ID                           NOT NULL NUMBER(4)
 NAME                                            VARCHAR2(30)
 CITY                                               VARCHAR2(30)
 COUNTRY                                     VARCHAR2(30)

SQL> insert into publisher values(1,'Pearson','Newyork','USA');

1 row created.

SQL> insert into publisher values(2,'Tata','Delhi','India');

1 row created.

SQL> insert into publisher values(3,'Chand','Delhi','India');

1 row created.

SQL> insert into publisher values(4,'EBPB','Gadag','India');

1 row created.

SQL> insert into publisher values(5,'Amazone','losangal','USA');

1 row created.

SQL> select * from publisher;

PUBLISHER_ID NAME                           CITY                           COUNTRY
------------ ------------------------------ ------------------------------ ------------------------------
           1 Pearson                        Newyork                        USA
           2 Tata                           Delhi                          India
           3 Chand                          Delhi                          India
           4 EBPB                           Gadag                          India
           5 Amazone                        losangal                       USA

SQL> create  table CATEGORY(category_id number(4) primary key, description varchar(20));

Table created.

SQL> desc category;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CATEGORY_ID                               NOT NULL NUMBER(4)
 DESCRIPTION                                        VARCHAR2(20)

SQL> insert into category values(1,'Text Book');

1 row created.

SQL> insert into category values(2,'Novel');

1 row created.

SQL> insert into category values(3,'Comic');

1 row created.

SQL> insert into category values(4,'Biography');

1 row created.

SQL> insert into category values(5,'Autobiography');

1 row created.

SQL> seect * from category;
SP2-0734: unknown command beginning "seect * fr..." - rest of line ignored.
SQL> select * from category;

CATEGORY_ID 	DESCRIPTION
----------- 		--------------------
          1 		Text Book
          2		 Novel
          3 		Comic
          4 		Biography
          5 		Autobiography

SQL>
SQL> create table CATALOG(book_id number(4) primary key, 
title varchar(20),
author_id number(4) references author(author_id),
publisher_id number(4) references publisher(publisher_id),
category_id number(4) references category(category_id), 
year number(4),price number(6,2));

SQL> create table CATALOG(book_id number(4) primary key,
  2  title varchar(20),
  3  author_id number(4) references author(author_id),
  4  publisher_id number(4) references publisher(publisher_id),
  5  category_id number(4) references category(category_id),
  6  year number(4),price number(6,2));

Table created.

SQL> insert into catalog values(1,'dbms',1,1,1,2001,1000);

1 row created.

SQL> insert into catalog values(2,'Java',2,2,2,2002,2000);

1 row created.

SQL> insert into catalog values(3,'Unix',3,3,3,2003,3000);

1 row created.

SQL> insert into catalog values(4,'Python',4,4,4,2004,4000);

1 row created.

SQL> insert into catalog values(5,'C',5,5,5,2005,5000);

1 row created.

SQL> select * from catalog;

   BOOK_ID 	TITLE           AUTHOR_ID PUBLISHER_ID CATEGORY_ID       YEAR      PRICE
---------- 		------------------- ---------- 		------------		 -----------	 ---------- ----------
         1 		dbms               1        	    1          		 1      	 2001       1000
         2 		Java                 2         	   2         		  2    	   2002       2000
         3		 Unix                3        	    3       		   3    	   2003       3000
         4		 Python            4        	    4       		    4    	   2004       4000
         5		 C                     5         	   5        		   5      	 2005       5000


SQL> create table ORDER_DETAILS(order_no number(4) primary Key,
  2  book_id number(4) references catalog(book_id), quantity  number(4));

Table created.

SQL> insert into order_details values(1,1,100);

1 row created.

SQL> insert into order_details values(2,2,200);

1 row created.

SQL> insert into order_details values(3,3,300);

1 row created.

SQL> insert into order_details values(4,4,400);

1 row created.

SQL> insert into order_details values(5,5,500);

1 row created.

SQL> select * from order_details;

  ORDER_NO    	BOOK_ID   	QUANTITY
----------	        	----------		----------
         1          	1        		100
         2		2        		200
         3          	3        		300
         4          	4        		400
         5          	5        		500

 insert into catalog values(6,'PST',1,1,1,2010,6000);

i. Give the details of the authors who have 2or more books in the catalog and the price of the books
is greater than the average price of the books in the catalog.

 select * from author where author_id in
(select author_id from catalog group by author_id having count(author_id)>=2)
and author_id in
 (select author_id from catalog where price>(select avg(price) from catalog))

ii. Find the author of the book, which has maximum sales.

SQL> SELECT NAME FROM AUTHOR A, CATALOG C
  2  WHERE A.AUTHOR_ID=C.AUTHOR_ID AND A.AUTHOR_ID=
  3  (SELECT BOOK_ID  FROM ORDER_DETAILS WHERE QUANTITY =
  4  (SELECT MAX(QUANTITY) FROM ORDER_DETAILS));

NAME
------------------------------
Rajeshwari

III. Demonstrate how you increase the price of books published by a specific publisher by10%

SQL> UPDATE CATALOG SET PRICE=PRICE*1.1 WHERE PUBLISHER_ID=1;

2 rows updated.

SQL> SELECT * FROM CATALOG;

   BOOK_ID TITLE                 AUTHOR_ID PUBLISHER_ID CATEGORY_ID       YEAR      PRICE
---------- -------------------- ---------- ------------ ----------- ---------- ----------
         1 	dbms                        1            	 1           1       2001       1100
         2 	Java                          2           	  2           2       2002       2000
         3 	Unix                          3          	  3           3       2003       3000
         4 	Python                      4         	  4           4       2004       4000
         5 	C                               5         	  5           5       2005       5000
         6 	PST                           1        	  1           1       2010       6600

6 rows selected.

SQL> CREATE OR REPLACE FUNCTION add_two_numbers(
  2      num1 IN NUMBER, -- First input number
  3      num2 IN NUMBER  -- Second input number
  4  )
  5  RETURN NUMBER
  6  IS
  7      sum_result NUMBER; -- Variable to store the result
  8  BEGIN
  9      -- Perform addition
 10      sum_result := num1 + num2;
 11
 12      -- Return the result
 13      RETURN sum_result;
 14  END add_two_numbers;
 15  /

Function created.



SQL> DECLARE
  2      a NUMBER := 10; -- First number
  3      b NUMBER := 20; -- Second number
  4      result NUMBER;  -- Variable to store the result
  5  BEGIN
  6      -- Call the function
  7      result := add_two_numbers(a, b);
  8
  9      -- Display the result
 10      DBMS_OUTPUT.PUT_LINE('The sum of ' || a || ' and ' || b || ' is: ' || result);
 11  EXCEPTION
 12      WHEN OTHERS THEN
 13          DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
 14  END;
 15  /
The sum of 10 and 20 is: 30

PL/SQL procedure successfully completed.


