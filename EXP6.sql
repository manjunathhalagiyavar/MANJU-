SQL> CREATE TABLE PUB(NAME VARCHAR(20)PRIMARY KEY,PHONE NUMBER(5),ADDRESS VARCHAR(20));

Table created.

SQL> DESC PUB;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NAME                                      NOT NULL VARCHAR2(20)
 PHONE                                              NUMBER(5)
 ADDRESS                                            VARCHAR2(20)


SQL> INSERT INTO PUB VALUES('MCGRAW-HALL',12345,'BANGALORE');

1 row created.

SQL> INSERT INTO PUB VALUES('BPB',22345,'MANGALORE');

1 row created.

SQL> INSERT INTO PUB VALUES('PEARSON',22664,'PUNE');

1 row created.

SQL> INSERT INTO PUB VALUES('LIRE',22334,'CHENNAI');

1 row created.

SQL> INSERT INTO PUB VALUES('MACMILLAN',33445,'BANGALORE');

1 row created.

SQL> SELECT * FROM PUB;

NAME                      PHONE ADDRESS
-------------------- ---------- --------------------
MCGRAW-HALL               12345 BANGALORE
BPB                       22345 MANGALORE
PEARSON                   22664 PUNE
LIRE                      22334 CHENNAI
MACMILLAN                 33445 BANGALORE


SQL> CREATE TABLE BOOK(BID VARCHAR(20)PRIMARY KEY,TITLE VARCHAR(20) ,PUBYEAR VARCHAR(20),PUBNAME VARCHAR(20)REFERENCES PUB(NAME)ON DELETE CASCADE);

Table created.

SQL> DESC BOOK;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BID                                       NOT NULL VARCHAR2(20)
 TITLE                                              VARCHAR2(20)
 PUBYEAR                                            VARCHAR2(20)
 PUBNAME                                            VARCHAR2(20)

SQL>

SQL> INSERT INTO BOOK VALUES('B01','DBMS','JAN-2001','MCGRAW-HALL');

1 row create

SQL> INSERT INTO BOOK VALUES('B02','PYTHON','FEB-2002','MCGRAW-HALL');

1 row created.

SQL> INSERT INTO BOOK VALUES('B03','GRAPHICS','MAR-2003','PEARSON');

1 row created.

SQL> INSERT INTO BOOK VALUES('B04','DATA STUC','SEP-2014','MACMILLAN');

1 row created.

SQL> INSERT INTO BOOK VALUES('B05','NETWORK','MAY-2015','PEARSON');

1 row created.


SQL> SELECT * FROM BOOK;

BID                  TITLE                PUBYEAR              PUBNAME
-------------------- -------------------- -------------------- --------------------
B01                  DBMS                 JAN-2001             MCGRAW-HALL
B02                  PYTHON               FEB-2002             MCGRAW-HALL
B03                  GRAPHICS             MAR-2003             PEARSON
B04                  DATA STUC            SEP-2014             MACMILLAN
B05                  NETWORK              MAY-2015             PEARSON



QL> DESC BOOK_AUTHORS;
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 ANAME                                                             NOT NULL VARCHAR2(20)
 BID                                                                        VARCHAR2(20)


SQL> INSERT INTO BOOK_AUTHORS VALUES('NAVATHE','B01');

1 row created.

SQL> INSERT INTO BOOK_AUTHORS VALUES('GUIDO','B02');

1 row created.

SQL> INSERT INTO BOOK_AUTHORS VALUES('RAJIV','B03');

1 row created.

SQL> INSERT INTO BOOK_AUTHORS VALUES('TANENBAUM','B04');

1 row created.

SQL> INSERT INTO BOOK_AUTHORS VALUES('KAMATHANE','B05');

1 row created.

SQL> SELECT * FROM BOOK_AUTHORS;

ANAME                BID
-------------------- --------------------
NAVATHE              B01
GUIDO                B02
RAJIV                B03
TANENBAUM            B04
KAMATHANE            B05


SQL> CREATE TABLE LIBRARY_BRANCH(BID INTEGER PRIMARY KEY,BNAME VARCHAR(20),ADDRESS VARCHAR(20));

Table created.

SQL> DESC LIBRARY_BRANCH;
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 BID                                                               NOT NULL NUMBER(38)
 BNAME                                                                      VARCHAR2(20)
 ADDRESS                                                                    VARCHAR2(20)

SQL>


SQL> INSERT INTO LIBRARY_BRANCH VALUES(11,'VIDYAGIRI','DHARWAD');

1 row created.

SQL> INSERT INTO LIBRARY_BRANCH VALUES(12,'VIDYAGIRI','HUBLI');

1 row created.

SQL> INSERT INTO LIBRARY_BRANCH VALUES(13,'RAMNAGAR','BENGALORE');

1 row created.

SQL> INSERT INTO LIBRARY_BRANCH VALUES(14,'RAJNAGAR','BELGAUM');

1 row created.

SQL> INSERT INTO LIBRARY_BRANCH VALUES(15,'GANDHINAGAR','KARWAR');

1 row created.

SQL> SELECT *FROM LIBRARY_BRANCH;

       BID BNAME                ADDRESS
---------- -------------------- --------------------
        11 VIDYAGIRI            DHARWAD
        12 VIDYAGIRI            HUBLI
        13 RAMNAGAR             BENGALORE
        14 RAJNAGAR             BELGAUM
        15 GANDHINAGAR          KARWAR

SQL> CREATE TABLE BOOK_COPIES(NOOFCOPIES INTEGER,BID REFERENCES BOOK(BID)ON DELETE CASCADE,BRANCHID REFERENCES LIBRARY_BRANCH(BID)ON DELETE CASCADE,PRIMARY KEY (BID,BRANCHID));

Table created.

SQL> DESC BOOK_COPIES;
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 NOOFCOPIES                                                                 NUMBER(38)
 BID                                                               NOT NULL VARCHAR2(20)
 BRANCHID                                                          NOT NULL NUMBER(38)


SQL> INSERT INTO BOOK_COPIES VALUES(50,'B01',11);

1 row created.

SQL> INSERT INTO BOOK_COPIES VALUES(40,'B02',12);

1 row created.

SQL> INSERT INTO BOOK_COPIES VALUES(22,'B03',13);

1 row created.

SQL> INSERT INTO BOOK_COPIES VALUES(35,'B04',14);

1 row created.

QL> INSERT INTO BOOK_COPIES VALUES(74,'B04',15);

1 row created.

SQL> INSERT INTO BOOK_COPIES VALUES(21,'B05',15);

1 row created.



QL> SELECT * FROM BOOK_COPIES;

NOOFCOPIES BID                    BRANCHID
---------- -------------------- ----------
        50 B01                          11
        40 B02                          12
        22 B03                          13
        35 B04                          14
        74 B04                          15
        21 B05                          15

6 rows selected.

SQL> CREATE TABLE CARD(CARDNO INTEGER PRIMARY KEY);

Table created.

SQL> DESC CARD;
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 CARDNO                                                            NOT NULL NUMBER(38)

QL> INSERT INTO CARD VALUES(100);

1 row created.

SQL> INSERT INTO CARD VALUES(200);

1 row created.

SQL> INSERT INTO CARD VALUES(300);

1 row created.

SQL> INSERT INTO CARD VALUES(400);

1 row created.

SQL> INSERT INTO CARD VALUES(500);

1 row created.

QL> SELECT * FROM CARD;

    CARDNO
----------
       100
       200
       300
       400




SQL> CREATE TABLE BOOK_LENDING(DATEOUT DATE,DUEDATE DATE,BID REFERENCES BOOK(BID)ON DELETE CASCADE,BRANCHID REFERENCES LIBRARY_BRANCH(BID)ON DELETE CASCADE,CARDNO REFERENCES CARD (CARDNO)ON DELETE CASCADE,PRIMARY KEY(BID,BRANCHID,CARDNO));

Table created.

SQL> DESC BOOK_LENDING;
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 DATEOUT                                                                    DATE
 DUEDATE                                                                    DATE
 BID                                                               NOT NULL VARCHAR2(20)
 BRANCHID                                                          NOT NULL NUMBER(38)
 CARDNO                                                            NOT NULL NUMBER(38)








SQL> INSERT INTO BOOK_LENDING VALUES('1-JAN-17','1-JUN-17','B01','11',100);

1 row created.

SQL> INSERT INTO BOOK_LENDING VALUES('4-JAN-17','4-JUN-17','B02','12',200);

1 row created.

SQL> INSERT INTO BOOK_LENDING VALUES('2-JAN-17','2-JUN-17','B03','13',300);

1 row created.

SQL> INSERT INTO BOOK_LENDING VALUES('3-JAN-17','3-JUN-17','B04','14',400);

1 row created.

SQL> INSERT INTO BOOK_LENDING VALUES('5-JAN-17','5-JUN-17','B05','15',500);

1 row created.

SQL> SELECT * FROM BOOK_LENDING;

DATEOUT   DUEDATE   BID                    BRANCHID     CARDNO
--------- --------- -------------------- ---------- ----------
01-JAN-17 01-JUN-17 B01                          11        100
04-JAN-17 04-JUN-17 B02                          12        200
02-JAN-17 02-JUN-17 B03                          13        300
03-JAN-17 03-JUN-17 B04                          14        400
05-JAN-17 05-JUN-17 B05                          15        500



1ST Q:

SQL> SELECT B.BID,B.TITLE,B.PUBNAME,A.ANAME,C.NOOFCOPIES,L.BID FROM BOOK B,BOOK_AUTHORS A,BOOK_COPIES C,LIBRARY_BRANCH L WHERE B.BID=A.BID AND B.BID=C.BID AND L.BID=C.BRANCHID;

BID                  TITLE                PUBNAME              ANAME                NOOFCOPIES        BID
-------------------- -------------------- -------------------- -------------------- ---------- ----------
B01                  DBMS                 MCGRAW-HALL          NAVATHE                      50         11
B02                  PYTHON               MCGRAW-HALL          GUIDO                        40         12
B03                  GRAPHICS             PEARSON              RAJIV                        22         13
B04                  DATA STUC            MACMILLAN            TANENBAUM                    35         14
B04                  DATA STUC            MACMILLAN            TANENBAUM                    74         15
B05                  NETWORK              PEARSON              KAMATHANE                    21         15

6 rows selected.


----------------------------------------------------------------------------------

SQL> INSERT INTO BOOK_LENDING VALUES('5-JAN-17','5-JUN-17','B02','15',500);

1 row created.

SQL> INSERT INTO BOOK_LENDING VALUES('5-JAN-17','5-JUN-17','B03','15',500);

1 row created.
INSERT INTO BOOK_LENDING VALUES('5-JAN-17','5-JUN-17','B04','15',500);

------------------------------------------------------------------------------------

2ND Q:

SQL> SELECT CARDNO,COUNT(CARDNO) FROM BOOK_LENDING WHERE DATEOUT BETWEEN '1-JAN-17' AND '1-JUN-17' GROUP BY CARDNO HAVING COUNT(*)>3;

    CARDNO COUNT(CARDNO)
---------- -------------
       500             4

3ND Q:

SQL> DELETE FROM BOOK WHERE BID='B03';

1 row deleted.

SQL> SELECT * FROM BOOK;

BID                  TITLE                PUBYEAR              PUBNAME
-------------------- -------------------- -------------------- --------------------
B01                  DBMS                 JAN-2001             MCGRAW-HALL
B02                  PYTHON               FEB-2002             MCGRAW-HALL
B04                  DATA STUC            SEP-2014             MACMILLAN
B05                  NETWORK              MAY-2015             PEARSON


4RH Q:
SQL> CREATE VIEW VPUBLICATION AS SELECT PUBYEAR FROM BOOK;



