--ex13_1
--모든 데이터 사전 테이블 조회
SELECT * FROM DICT;

--ex13_2
--ex13_1과 동일함
SELECT * FROM DICTIONARY;

--ex13_3
--접속한 계정의 데이터 사전의 이름을 조회
SELECT TABLE_NAME  --컬럼명
FROM USER_TABLES; --접속계정 관련 테이블

--ex13_4
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES; --접속한 계정들이 허가 받은 객체에 관련된 테이블

--ex13_5
SELECT * FROM DBA_TABLES;
--관리자 권한을 가진 계정에 관련된 데이터 사전
--SCOTT로 조회시는 권한이 없어서 조회가 안됨

--ex13_6
--SYSTEM 또는 SYS계정으로 조회해야 한다.
SELECT * FROM DBA_TABLES;

--ex13_7
--SCOTT계정의 정보를 조회한다.
--ex13_5 ~ ex13_7까지는 모두 SYSTEM이나 SYS계정으로 조회해야 한다.
SELECT * FROM DBA_USERS --사용자에 관련된 데이터 테이블
WHERE USERNAME = 'SCOTT';

--ex13_8
SELECT * FROM USER_INDEXES;
--접속한 계정의 INDEX의 관련된 데이터 사전

--ex13_9
SELECT * FROM USER_IND_COLUMNS;

--ex13_10 - INDEX : IMP_EMP_SAL 인덱스 생성
/* 인덱스는 책의 목차번호나 색인번호의 개념으로 이해하면 된다.
빠르게 찾아서 조회 하려는 목적성을 띄고 있다고 한다. */
CREATE INDEX IMP_EMP_SAL
ON EMP(SAL); --EMP테이블의 SAL컬럼에 인덱스를 부여한다.

--ex13_11
SELECT * FROM USER_IND_COLUMNS;

--ex13_12 - DROP INDEX : 인덱스 삭제
DROP INDEX IMP_EMP_SAL;

--ex13_13
SELECT * FROM USER_IND_COLUMNS;

--ex13_14
--SYSTEM계정으로 VIEW를 생성할 권한을 부여한다.
GRANT CREATE  VIEW  TO  SCOTT;

--ex13_15
CREATE VIEW VW_EMP20
AS (SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 30);

--ex13_16
SELECT * FROM USER_VIEWS; --VIEW에 관련된 데이터 사전

--ex13_17
SELECT VIEW_NAME, TEXT_LENGTH, TEXT --VIEW 생성시 SELECT 구문
FROM USER_VIEWS;

--ex13_18
SELECT * FROM VW_EMP20;

--ex13_19
DROP VIEW VW_EMP20;

--ex13_20 - TOP-N SQL문 (중요!)
--SELECT한 결과 순서대로 ROWNUM을 부여한다.
SELECT ROWNUM, E. * 
FROM EMP E;

--ex13_21
/* ROWNUM은 SELECT시 부여되고,
ORDER BY는 제일 마지막에 실행되므로,
ROWNUM은 원래의 번호를 가지게 된다. 
(그래서 조회해보면 번호가 순서에 맞지 않게 꼬여 있다)*/
SELECT ROWNUM, E. *
FROM EMP E
ORDER BY SAL DESC;

--ex13_22
/* TOP-N방식의 서브쿼리사용 인라인 뷰로 사전에 정렬한
서브쿼리 결과 객체를 SELECT하면 
정렬 상태가 된 ROWNUM이 부여 된다. */
SELECT ROWNUM, E. *
FROM (SELECT * 
          FROM EMP E 
          ORDER BY SAL DESC) E;

--ex13_23
--WITH절로 서브쿼리의 별칭을 부여한다.
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E. * FROM E;

--ex13_24
--ROWNUM을 WHERE절에 사용
--의사 컬럼인 ROWNUM도 일반 컬럼처럼 사용가능
SELECT ROWNUM, E. *
FROM(SELECT * FROM EMP E ORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

--ex13_25
--WITH절 사용
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E. *
FROM E
WHERE ROWNUM <= 3;

--ex13_26 - DEPT_SEQUENCE : 시퀀스 실습용 테이블 생성
CREATE TABLE DEPT_SEQUENCE
AS SELECT * FROM DEPT WHERE 1 <> 1;

--ex13_27 - SEQ_DEPT_SEQUENCE : 시퀀스 생성
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;
    
--ex13_28
SELECT * FROM USER_SEQUENCES; --시퀀스 관련 데이터사전 조회

--ex13_29
--NEXTVAL은 다음 번호
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--ex13_30
--CURRVAL은 현재 번호
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

--ex13_31
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL'); 
--9회 반복(절대 중복되는 번호는 안나옴)

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--ex13_32
--변경시 CREATE(생성문)대신 ALTER(수정문)을 사용한다.
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 3
MAXVALUE 99
CYCLE;

--ex13_33
SELECT * FROM USER_SEQUENCES;

--ex13_34
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--ex13_35
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--ex13_36
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

SELECT * FROM USER_SEQUENCE;

--ex13_37 - SNONYM 권한 부여
--SYNONYM객체 생성 권한을 관리자가 부여 해줘야 사용가능하다.
/* SQLPLUS SYSTEM/ORACLE <- 여기로 접속하여
아래 GRANT(권한) 명령을 입력해주면 된다. */
GRANT CREATE SYNONYM TO SCOTT;

GRANT CREATE PUBLIC SYNONYM TO SCOTT; 

--ex13_38
--SYNONYM은 객체에 별칭(동의어) 부여
CREATE SYNONYM E 
FOR EMP; --EMP테이블 객체중 E로 동의어를 부여한다.
--EMP앞에 사용자 계정이 생략되면 현재 접속 계정에 생성하게 된다.

--ex13_39
--SYNONYM생성 이후에는 동의어 E를 사용할 수 있다.
SELECT * FROM E;

SELECT * FROM EMP;

--ex13_40
DROP SYNONYM E;