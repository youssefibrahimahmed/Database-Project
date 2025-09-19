CREATE TABLE DEPARTMENT (
D_NUM INT PRIMARY KEY,
D_NAME VARCHAR (20),
I_ID INT , 
CONSTRAINT FK4 FOREIGN KEY (I_ID) REFERENCES INSTRUCTOR (I_ID )
)
GO 
CREATE TABLE STUDENT (
S_ID INT PRIMARY KEY,
S_FNAME VARCHAR (20),
S_LNAME VARCHAR (20),
S_AGE INT ,
S_BD DATE , 
D_NUM INT ,
CONSTRAINT FK1 FOREIGN KEY (D_NUM) REFERENCES DEPARTMENT (D_NUM) 
)
GO

CREATE TABLE INSTRUCTOR(
I_ID INT PRIMARY KEY ,
I_NAME VARCHAR (20),
I_AGE INT , 
I_SALARY INT 
) 
GO 

CREATE TABLE COURSE (
C_ID INT PRIMARY KEY,
C_NAME VARCHAR (20),
C_DURATION INT ,
I_ID INT ,
CONSTRAINT FK6 FOREIGN KEY (I_ID) REFERENCES INSTRUCTOR (I_ID )
)
GO
CREATE TABLE TOPIC (
T_ID INT PRIMARY KEY,
T_NAME VARCHAR (20),
C_ID INT,
CONSTRAINT FK5 FOREIGN KEY (C_ID) REFERENCES COURSE  (C_ID )
)
GO 
CREATE TABLE STUDENT_COURSE 
(S_ID INT , 
C_ID INT , 
CONSTRAINT PK1 PRIMARY KEY (S_ID, C_ID) ,
CONSTRAINT FK2 FOREIGN KEY (S_ID) REFERENCES STUDENT (S_ID ),
CONSTRAINT FK3 FOREIGN KEY (C_ID) REFERENCES COURSE (C_ID )
)
GO

CREATE TABLE EXAM(
E_ID INT PRIMARY KEY,
E_DATE DATE ,
E_DURATION INT,
E_NAME VARCHAR (20)
)
GO
CREATE TABLE STUDENT_EXAM(
S_ID INT ,
E_ID INT ,
GRADE INT,
CONSTRAINT PK2 PRIMARY KEY(S_ID, E_ID),
CONSTRAINT FK8 FOREIGN KEY (S_ID) REFERENCES STUDENT (S_ID ),
CONSTRAINT FK9 FOREIGN KEY (E_ID) REFERENCES EXAM (E_ID )
)
GO 
 
CREATE TABLE QUESTION (
Q_NUM INT PRIMARY KEY,
Q_TEXT VARCHAR (200),
Q_MARK INT,
E_ID INT ,
CONSTRAINT FK7 FOREIGN KEY (E_ID) REFERENCES EXAM  (E_ID )
)
GO

CREATE TABLE STUDENT_ANS(
S_ID INT ,
Q_NUM INT ,
E_ID INT ,
A_TEXT VARCHAR (200),
CONSTRAINT PK3 PRIMARY KEY (S_ID, Q_NUM, E_ID),
CONSTRAINT FK10 FOREIGN KEY (S_ID) REFERENCES STUDENT (S_ID ),
CONSTRAINT FK11 FOREIGN KEY (Q_NUM) REFERENCES QUESTION (Q_NUM ),
CONSTRAINT FK12 FOREIGN KEY (E_ID) REFERENCES EXAM (E_ID )
)

---------------------------------------------------------------
-- MAKE A PROCEDURE FOR SELECT ANY COLUMN WE WANT 

CREATE PROC SELECTT
    @columns_name VARCHAR(200) = '*',  
    @table_name   VARCHAR(20),  
    @condition    VARCHAR(200) = 'NULL'
    AS
       BEGIN
          IF @condition='NULL'
          EXEC (' SELECT '+ @COLUMNS_NAME+' FROM ' +@TABLE_NAME  )
          ELSE 
          EXEC('SELECT ' + @columns_name + ' FROM ' + @table_name + ' WHERE ' + @condition)
       END

       SELECTT ' *' ,'student', 'S_lNAME =''ahmed'''


---------------------------------------------------------------
-- MAKE A PROCEDURE FOR UPDATE ANY TABLE WE WANT 
CREATE PROC UPDATEE
@table_nam varchar(20), @column_nam varchar(20), @cond varchar(200)='null'
AS
 BEGIN
  IF @cond = 'null' OR @cond = ''
    BEGIN
        EXEC ('update ' + @table_nam +
              ' set ' + @column_nam)
    END
    ELSE 
    BEGIN 
        EXEC ('update ' + @table_nam +
              ' set ' + @column_nam +
              ' where ' + @cond)
    END 
 END

 UPDATEE 'STUDENT ', 'S_lNAME= ''ahmed''', 'S_lNAME=''y'''
 ---------------------------------------------------------------
 -- MAKE A PROCEDURE FOR INSERT INTO  ANY TABLE WE WANT 
 ---------------------------------------------------------------
 --INSERT INTO STUDENT TABLE 
 SELECTT '*','STUDENT','s_id =255'
CREATE PROC INSERT_STUDENT 
@S_ID INT,@S_FNAME VARCHAR(20),@S_LNAME VARCHAR(20),@S_AGE INT, @S_BD Date , @S_DNUM INT
AS 
BEGIN  EXECUTE (' INSERT INTO STUDENT VALUES ( ' + @S_ID+' , '''+@S_FNAME +''' , '''+@S_LNAME+''' , '+@S_AGE+ ' , ''' +@S_BD+ ''' , '+@S_DNUM+' ) ' )
END

INSERT_STUDENT '211215','X','Y','21','2006-01-01','10'
---------------------------------------------------------------
SELECTT '*', 'COURSE'
--INSERT INTO COURSE  TABLE 
CREATE PROC INSERT_COURSE 
@C_ID INT,@C_NAME VARCHAR(20),@C_DURATION INT, @I_ID INT
AS 
BEGIN
EXECUTE (' INSERT INTO COURSE VALUES ( ' +@C_ID+' , '''+@C_NAME +''' , '+@C_DURATION+' , '+@I_ID+' ) ' )
END

INSERT_COURSE '123','OOP','30','1'
---------------------------------------------------------------
SELECTT'*', 'DEPARTMENT'
--INSERT INTO DEPARTMENT  TABLE 
CREATE PROC INSERT_DEPARTMENT  
@D_NUM INT,@D_NAME VARCHAR(20),@I_ID INT
AS 
BEGIN
EXECUTE (' INSERT INTO DEPARTMENT VALUES ( ' +@D_NUM+' , '''+@D_NAME +''' , '+@I_ID+' ) ' )
END
INSERT_DEPARTMENT '20','IT','1'
---------------------------------------------------------------
SELECTT '*', 'EXAM'
--INSERT INTO EXAM  TABLE 
ALTER PROC INSERT_EXAM 
@E_ID INT,@E_DATE DATE,@E_DURATION INT ,@E_NAME VARCHAR(20),@C_ID INT
AS 
BEGIN
EXECUTE (' INSERT INTO EXAM VALUES ( ' +@E_ID+' , '''+@E_DATE+''' , '+@E_DURATION+' , '''+@E_NAME +''' , '+@C_ID+' ) ' )
END

INSERT_EXAM '123','1-1-2006','1','IT'
---------------------------------------------------------------
SELECTT '*', 'INSTRUCTOR'
--INSERT INTO INSTRUCTOR  TABLE 
CREATE PROC INSERT_INSTRUCTOR 
@I_ID INT,@I_NAME VARCHAR(20),@I_AGE INT,@I_SALARY INT
AS 
BEGIN
EXECUTE (' INSERT INTO INSTRUCTOR VALUES ( ' +@I_ID+' , '''+@I_NAME +''' , '+@I_AGE+' , '+@I_SALARY+' ) ' )
END

INSERT_INSTRUCTOR '1','TAMER','4500','35'
---------------------------------------------------------------
SELECTT '*', 'STUDENT_COURSE'
--INSERT INTO STUDENT_COURSE  TABLE 
CREATE PROC INSERT_STUDENT_COURSE 
@S_ID INT,@C_ID INT
AS 
BEGIN
EXECUTE (' INSERT INTO STUDENT_COURSE VALUES ( ' +@S_ID+' , '+@C_ID +' ) ' )
END

INSERT_STUDENT_COURSE '1','123'
---------------------------------------------------------------
SELECTT '*', 'STUDENT_EXAM'
--INSERT INTO STUDENT_EXAM  TABLE 
ALTER PROC INSERT_IN_STUDENT_EXAM 
@S_ID INT,@E_ID INT, @GRADE INT
AS 
BEGIN
EXECUTE (' INSERT INTO STUDENT_EXAM VALUES ( ' +@S_ID+' , '+@E_ID +' , '+@GRADE+' ) ' )
END

INSERT_IN_STUDENT_EXAM '1','1','20'


  
---------------------------------------------------------------
SELECTT '*', 'TOPIC'
--INSERT INTO TOPIC  TABLE 
CREATE PROC INSERT_TOPIC 
@T_ID INT,@T_NAME VARCHAR(20),@C_ID INT
AS 
BEGIN
EXECUTE (' INSERT INTO TOPIC VALUES ( ' +@T_ID+' , '''+@T_NAME +''' , '+@C_ID+' ) ' )
END

INSERT_TOPIC '1','IIT','123'
---------------------------------------------------------------
SELECTT ' *','QUESTION'
--INSERT INTO QUESTION TABLE
ALTER PROC INSERT_QUESTION
@Q_NUM INT ,@Q_TEXT VARCHAR(200),@Q_MARK INT, @E_ID INT , @Q_ANSWER VARCHAR(200)
AS
  BEGIN
    EXECUTE('INSERT INTO QUESTION VALUES ( '+@Q_NUM+' , '''+@Q_TEXT+''' , '+@Q_MARK +' , ' +@E_ID+' , '''+@Q_ANSWER+''' )')
  END 

INSERT_QUESTION '1','HOW ARE YOU', '5','123'
---------------------------------------------------------------
SELECTT '*' , 'STUDENT_ANS'
--INSERT INTO STUDENT TABLE
CREATE PROC INSERT_STUDENT_ANS
@S_ID INT , @Q_NUM INT , @E_ID INT , @A_TEXT VARCHAR(200)
   AS
     BEGIN 
        EXECUTE(' INSERT INTO STUDENT_ANS VALUES ( '+@S_ID+' , '+@Q_NUM+' , '+@E_ID+' , '''+@A_TEXT+''' ) ' )
     END

INSERT_STUDENT_ANS '1','1','123','GOOD'
---------------------------------------------------------------
--CREATE PROCEDURE FOR DELETE
--------------------------------------------------------
CREATE PROC DELETE_TABLE 
@TABLE_NAME VARCHAR(20), @WHERE VARCHAR(200) ='NULL'
AS
BEGIN
IF @WHERE ='NULL'
EXECUTE (' DELETE '+@TABLE_NAME)
ELSE
EXECUTE (' DELETE '+@TABLE_NAME+' WHERE '+ @WHERE)
END


-----------------------------------------------------------------------------------------------------------------
--[ 1ST REPORT ]
ALTER PROC  STUD_INFO @DEPT_NUM INT 
AS
 BEGIN
 SELECT *FROM STUDENT S 
 WHERE S.D_NUM =@DEPT_NUM
 END

 STUD_INFO 10
 --------------------------------------------
 -- [ 2ND REPORT ] -- REPORT FOR STUDENT GARDES 
CREATE PROC EXAM_CORRECTION @SID INT
 AS
   BEGIN 
        UPDATE SE
        SET    SE.GRADE=SE.GRADE +Q.Q_MARK 
        FROM   STUDENT_EXAM SE JOIN STUDENT_ANS SA
        ON     SE.E_ID  =SA.E_ID AND SE.S_ID =SA.S_ID
        JOIN   QUESTION Q 
        ON     Q.E_ID=SE.E_ID 
        AND    Q.Q_NUM= SA.Q_NUM 
        AND    Q.Q_ANSWER=SA.A_TEXT
        WHERE @SID= SE.S_ID
   END
   EXAM_CORRECTION 1
   SELECTT '*' , 'STUDENT_EXAM'
   ------------------------------------
  
   ALTER  PROC STUD_GRAD @ID INT
AS
BEGIN
    SELECT SUM(SE.GRADE) AS [TOTAL GRADES], C.C_NAME
    FROM STUDENT_EXAM SE
    JOIN EXAM E 
        ON E.E_ID = SE.E_ID
    JOIN COURSE C
        ON C.C_ID = E.C_ID 
    WHERE SE.S_ID = @ID
    GROUP BY C.C_name
END
STUD_GRAD 1
   ----------------------------------
  
-----------
-- 3RD REPORT --> (INSTRUCTOR & COURSES & STUDENTS)

CREATE PROC INS_TEACH @I_ID INT
  AS
    BEGIN
        SELECT C.C_name ,COUNT (SC.S_ID)
        FROM COURSE C JOIN STUDENT_COURSE SC
        ON SC.c_id=C.C_id
       WHERE I_id=@I_ID  
       GROUP BY C.C_name
    END
    INS_TEACH 2
-----------
-- 4TH REPORT FOR COURSES & TOPICS
SELECTT'*' ,'COURSE'
GO
SELECTT'*' ,'TOPIC'

ALTER PROC COURSE_TOPIC @C_ID INT
   AS
     BEGIN
         SELECT DISTINCT T_NAME FROM TOPIC T
         JOIN COURSE C 
         ON @C_ID =T.C_id
     END
COURSE_TOPIC 300
------------------------------------------------------

--  5TH REPORT FOR 
CREATE PROC EXAM_QUESTIONS @E_ID INT
   AS
        BEGIN
                SELECT Q_TEXT FROM QUESTION Q
                WHERE Q.E_ID=@E_ID
        END
        EXAM_QUESTIONS 500---------------------------------------------------------------------
--  6TH REPORT FOR EXAM &STUDENT
ALTER PROC EXAM_STUDENT @E_ID INT,@S_ID INT
    AS
        BEGIN
            SELECT Q_TEXT, SA.A_TEXT FROM QUESTION Q 
            JOIN STUDENT_ANS SA ON Q.Q_NUM=SA.Q_NUM AND @S_ID=SA.S_ID
            
            WHERE Q.E_ID =@E_ID
        END
      

        EXAM_STUDENT 800,3

------------------------------------------------------------------------------------
    --CURSOR
    create proc s_q @eid int
as
begin
           declare @n int , @t varchar (200), @m int

     DECLARE SHOW_Q CURSOR  
      FOR SELECT Q_NUM,Q_TEXT,Q_MARK 
         FROM QUESTION
          where E_ID=@eid
           FOR READ ONLY
           open show_q
           fetch show_q into @n,@t,@m
           while @@fetch_status=0
            begin
            select @n,@t,@m
           fetch show_q into @n,@t,@m
            end
            close show_q
            deallocate show_q
            end
            s_q 500
 -----------------------------------------------------------------------------------
    SELECTT '*','EXAM'
    GO
    SELECTT '*','QUESTION'

------------------------------------------------------------------------------------
EXEC INSERT_INSTRUCTOR 1,'Tamer',40,6000;
EXEC INSERT_INSTRUCTOR 2,'Mona',35,5500;
EXEC INSERT_INSTRUCTOR 3,'Yasser',45,7000;

-- Departments
EXEC INSERT_DEPARTMENT 10,'CS',1;
EXEC INSERT_DEPARTMENT 20,'IT',2;

-- Students
EXEC INSERT_STUDENT 1,'Ali','Hassan',21,'2004-01-01',10;
EXEC INSERT_STUDENT 2,'Sara','Mahmoud',22,'2003-05-15',10;
EXEC INSERT_STUDENT 3,'Omar','Youssef',23,'2002-09-20',20;

-- Courses
EXEC INSERT_COURSE 100,'DB',30,1;
EXEC INSERT_COURSE 200,'OOP',40,2;
EXEC INSERT_COURSE 300,'Networks',35,1;
EXEC INSERT_COURSE 400,'AI',45,2;

-- Topics
EXEC INSERT_TOPIC 1,'SQL',100;
EXEC INSERT_TOPIC 2,'ERD',100;
EXEC INSERT_TOPIC 3,'Classes',200;
EXEC INSERT_TOPIC 4,'Inheritance',200;
EXEC INSERT_TOPIC 5,'IP',300;
EXEC INSERT_TOPIC 6,'Routing',300;
EXEC INSERT_TOPIC 7,'ML',400;
EXEC INSERT_TOPIC 8,'NN',400;
SELECTT '*','EXAM'
-- Exams
EXEC INSERT_EXAM 500,'2024-06-01',90,'DB_Final',100;
EXEC INSERT_EXAM 501,'2024-07-01',60,'DB_Mid',100;
EXEC INSERT_EXAM 600,'2024-06-05',120,'OOP_Mid',200;
EXEC INSERT_EXAM 601,'2024-07-10',90,'OOP_Final',200;
EXEC INSERT_EXAM 700,'2024-06-10',90,'Net_Final',300;
EXEC INSERT_EXAM 800,'2024-06-15',100,'AI_Final',400;

-- Questions 
-- DB_Final (500): 1..5
EXEC INSERT_QUESTION 1,'What is SQL?',5,500,'Structured Query Language';
EXEC INSERT_QUESTION 2,'Define PK',5,500,'Unique row identifier';
EXEC INSERT_QUESTION 3,'What is Normalization?',10,500,'Reduce redundancy';
EXEC INSERT_QUESTION 4,'What is FK?',5,500,'Referential link';
EXEC INSERT_QUESTION 5,'What is Index?',5,500,'Speed up queries';

-- DB_Mid (501): 11..13
EXEC INSERT_QUESTION 11,'Write SELECT with WHERE',10,501,'Using WHERE clause';
EXEC INSERT_QUESTION 12,'Aggregate function example',10,501,'SUM';
EXEC INSERT_QUESTION 13,'JOIN types?',10,501,'Inner Left Right Full';

-- OOP_Mid (600): 101..103
EXEC INSERT_QUESTION 101,'What is OOP?',10,600,'Object Oriented Programming';
EXEC INSERT_QUESTION 102,'What is Inheritance?',10,600,'Reuse via parent-child';
EXEC INSERT_QUESTION 103,'What is Polymorphism?',10,600,'Many forms';

-- OOP_Final (601): 111..113
EXEC INSERT_QUESTION 111,'Encapsulation means?',10,601,'Hide data';
EXEC INSERT_QUESTION 112,'Abstract class?',10,601,'Cannot instantiate';
EXEC INSERT_QUESTION 113,'Interface?',10,601,'Contract of methods';

-- Networks_Final (700): 201..203
EXEC INSERT_QUESTION 201,'What is IP?',5,700,'Internet Protocol';
EXEC INSERT_QUESTION 202,'Router role?',10,700,'Forwarding packets';
EXEC INSERT_QUESTION 203,'TCP vs UDP?',10,700,'Reliable vs Unreliable';

-- AI_Final (800): 301..303
EXEC INSERT_QUESTION 301,'Define ML',10,800,'Algorithms learn from data';
EXEC INSERT_QUESTION 302,'Neural Network?',15,800,'Brain-inspired model';
EXEC INSERT_QUESTION 303,'Overfitting?',10,800,'Fits noise';

-- Student_Course 
EXEC INSERT_STUDENT_COURSE 1,100; -- Ali -> DB
EXEC INSERT_STUDENT_COURSE 1,200; -- Ali -> OOP
EXEC INSERT_STUDENT_COURSE 1,300; -- Ali -> Networks
EXEC INSERT_STUDENT_COURSE 2,100; -- Sara -> DB
EXEC INSERT_STUDENT_COURSE 2,400; -- Sara -> AI
EXEC INSERT_STUDENT_COURSE 3,200; -- Omar -> OOP
EXEC INSERT_STUDENT_COURSE 3,300; -- Omar -> Networks
EXEC INSERT_STUDENT_COURSE 3,400; -- Omar -> AI

-- Student_Exam 
EXEC INSERT_IN_STUDENT_EXAM 1,500,0;  -- Ali DB Final
EXEC INSERT_IN_STUDENT_EXAM 1,600,0;  -- Ali OOP Mid
EXEC INSERT_IN_STUDENT_EXAM 1,700,0;  -- Ali Net Final
EXEC INSERT_IN_STUDENT_EXAM 2,500,0;  -- Sara DB Final
EXEC INSERT_IN_STUDENT_EXAM 2,800,0;  -- Sara AI Final
EXEC INSERT_IN_STUDENT_EXAM 3,600,0;  -- Omar OOP Mid
EXEC INSERT_IN_STUDENT_EXAM 3,601,0;  -- Omar OOP Final
EXEC INSERT_IN_STUDENT_EXAM 3,700,0;  -- Omar Net Final
EXEC INSERT_IN_STUDENT_EXAM 3,800,0;  -- Omar AI Final

-- Student Answers 
-- Ali
EXEC INSERT_STUDENT_ANS 1,1,500,'Structured Query Language'; -- صح
EXEC INSERT_STUDENT_ANS 1,2,500,'Unique';                     -- غلط
EXEC INSERT_STUDENT_ANS 1,3,500,'Reduce redundancy';          -- صح
EXEC INSERT_STUDENT_ANS 1,101,600,'OOP';                      -- غلط
EXEC INSERT_STUDENT_ANS 1,102,600,'Reuse via parent-child';   -- صح
EXEC INSERT_STUDENT_ANS 1,201,700,'Internet Protocol';        -- صح
EXEC INSERT_STUDENT_ANS 1,202,700,'Switching';                -- غلط

-- Sara
EXEC INSERT_STUDENT_ANS 2,1,500,'Database Language';          
EXEC INSERT_STUDENT_ANS 2,2,500,'A column';                   
EXEC INSERT_STUDENT_ANS 2,301,800,'Algorithms learn from data';
EXEC INSERT_STUDENT_ANS 2,302,800,'Brain model';              
EXEC INSERT_STUDENT_ANS 2,303,800,'Fits noise';               

-- Omar
EXEC INSERT_STUDENT_ANS 3,101,600,'Object Oriented Programming';
EXEC INSERT_STUDENT_ANS 3,111,601,'Hide data';                    
EXEC INSERT_STUDENT_ANS 3,112,601,'Abstract class cannot instantiate';
EXEC INSERT_STUDENT_ANS 3,201,700,'Internet Protocol';         
EXEC INSERT_STUDENT_ANS 3,202,700,'Forwarding packets';          
EXEC INSERT_STUDENT_ANS 3,301,800,'Algorithms learn from data'; 
EXEC INSERT_STUDENT_ANS 3,302,800,'Brain-inspired model';
