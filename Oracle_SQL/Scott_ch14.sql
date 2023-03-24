--ex14_1
--NOT NULL제약 조건 (NULL은 사용 못하나, 다른 행과 중복은 허용한다.)
CREATE TABLE TABLE_NOTNULL
(LOGIN_ID VARCHAR2(20) NOT NULL,
LOGIN_PWD VARCHAR2(20) NOT NULL,
TEL VARCHAR2(20)
);

DESC TABLE_NOTNULL;

--ex14_2
--NOT NULL컬럼에 NULL값을 사용
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST_ID_01', NULL, '010-1234-5678');

--ex14_3
--NULL허용 컬럼 TEL 컬럼을 INSERT에서 제외시 NULL이 자동으로 부여된다.
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD)
VALUES ('TEST_ID_01', '1234');

SELECT * FROM TABLE_NOTNULL;

--ex14_4
--NOT NULL컬럼에 UPDATE시 오류가 발생한다.
UPDATE TABLE_NOTNULL
SET LOGIN_PWD = NULL
WHERE LOGIN_ID = 'TEST_ID_01';

--ex14_5
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS; --제약사항 관련 데이터 사전

--ex14_6
CREATE TABLE TABLE_NOTNULL2(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
TEL VARCHAR2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--ex14_7
/* 이미 컬럽값에 NULL이 있다면 NOT NULL 제약조건
때문에 변경이 불가능하여 오류가 발생한다. */
ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);

--ex14_8
--NULL을 다른 값으로 변경 후 NOT NULL로 수정한다.
UPDATE TABLE_NOTNULL
SET TEL = '010-1234-5678'
WHERE LOGIN_ID = 'TEST_ID_01';

SELECT * FROM TABLE_NOTNULL;

--ex14_9
--변경 후 NOT NULL로 변경 가능
ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--ex14_10
--제약조건에 이름을 부여
ALTER TABLE TABLE_NOTNULL2
MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--ex14_11
DESC TABLE_NOTNULL2;

--ex14_12
--이미 만들어진 제약조건 이름을 변경
ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN
TO TBLNN2_TEL_NN;

SELECT OWNER, CONSTRAINT_NAME,
CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--ex14_13 - 제약조건 삭제
ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TEL_NN;

DESC TABLE_NOTNULL2;

--ex14_14 - UNIQUE : 유일한 값
CREATE TABLE TABLE_UNIQUE (
LOGIN_ID VARCHAR2(20) UNIQUE, --유일한 값(NULL 허용)
LOGIN_PWD VARCHAR2(20) NOT NULL,
TEL VARCHAR2(20)
);

DESC TABLE_UNIQUE;

--ex14_15 - CONSTRAINT로 제약조건 확인
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE';

--ex14_16
--UNIQUE인 LOGIN_ID는 중복 값을 허용하지 않는다.

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) 
VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');

--ex14_19
--UNIQUE인 LOGIN_ID는 중복 값을 허용하지 않으며 NULL은 허용한다.
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) 
VALUES(NULL, 'PWD03', '010-1234-5677');

SELECT * FROM TABLE_UNIQUE;

--ex14_20
--UPDATE도 중복 값은 허용이 안되므로 에러 발생!
UPDATE TABLE_UNIQUE
SET LOGIN_ID = 'TEST_ID_01'
WHERE LOGIN_ID IS NULL;

--ex14_21
--테이블 생성시 제약조건 이름을 부여하여 제약조건을 설정한다.
CREATE TABLE TABLE_UNIQUE2 (
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPW_NN NOT NULL,
TEL VARCHAR2(20)
);

--ex14_22
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%'; 
--%는 와일드카드로서 0자 이상의 모든 문자열을 반환

SELECT * FROM TABLE_UNIQUE;
SELECT * FROM TABLE_UNIQUE2;

--ex14_23
ALTER TABLE TABLE_UNIQUE
MODIFY(TEL UNIQUE); --TEL컬럼에 중복된 값이 있으면 변경 불가(오류발생)

--ex14_24
UPDATE TABLE_UNIQUE
SET TEL = NULL;

SELECT * FROM TABLE_UNIQUE;

--ex14_25 - (수정성공)
ALTER TABLE TABLE_UNIQUE
MODIFY(TEL UNIQUE);

--ex14_26
--테이블 생성 후 제약조건명 주기
ALTER TABLE TALBE_UNIQUE2
MODIFY(TEL CONSTRAINT TBLUNQ_TEL_UNQ UNIQUE);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--ex14_27
--이미 주어진 제약조건 변경은 RENAME TO를 사용한다.
ALTER TABLE TABLE_UNIQUE2
RENAME CONSTRAINT TBLUNQ_TEL_UNQ TO TBLUNQ2_TEL_UNQ;

--ex14_28
--제약조건명 삭제는 DROP
ALTER TABLE TABLE_UNIQUE2
RENAME CONSTRAINT TBLUNQ_TEL_UNQ
TO TBLUNQ2_TEL_UNQ;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--ex14_29
--테이블 생성시 PRIMARY KEY지정
CREATE TABLE TABLE_PK (
   LOGIN_ID VARCHAR2(20) PRIMARY KEY,
   LOGIN_PWD VARCHAR2(20) NOT NULL,
   TEL VARCHAR2(20)
);

DESC TABLE_PK;

--ex14_30
SELECT OWNER,CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS --제약사항 관련 데이터 사전
WHERE TABLE_NAME LIKE 'TABLE_PK%';

--ex14_31
--PRIMARY KEY는 INDEX 자동생성
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME LIKE 'TABLE_PK%';

--ex14_32
--테이블 만들시 제약조건에 이름 부여
CREATE TABLE TABLE_PK2(
LOGIN_ID VARCHAR2(20) CONSTRAINT
TBLPK2_LGNID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR2(20) CONSTRAINT
TBLPK2_LGNPW_NN NOT NULL,
TEL VARCHAR2(20)
);

DESC TABLE_PK2;


--ex14_33
--테이블에 INSERT(DML로 COMMIT전까지는 영구 저장이 안됨)
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL) VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_PK;

--ex14_34
--PK에 중복값 입력하면 오류 발생
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL) 
VALUES('TEST_ID_01', 'PWD02', '010-2345-6789');

--ex14_35
--PK는 NULL을 허용하지 않는다
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES(NULL, ＇PWD02＇, ＇010-2345-6789＇);

--ex14_36
--묵시적 NULL도 오류
INSERT INTO TABLE_PK(LOGIN_PWD, TEL)
VALUES('PWD02', '010-2345-6789');

--ex14_37
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP', 'DEPT');

--ex14_38
--FOREIGN KEY로 DEPTNO가 참조하는 부모 테이블에 있는 값인지 확인
INSERT INTO EMP
(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9999, '홍길동', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50);

--ex14_39
--FOREIGN KEY용 부모 테이블
CREATE TABLE DEPT_FK(
DEPTNO NUMBER(2) CONSTRAINT
DEPTFK_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);

DESC DEPT_FK;

--ex14_40
CREATE TABLE EMP_FK(
EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK
REFERENCES DEPT_FK (DEPTNO) --외래키
);

DESC EMP_FK;

SELECT * FROM DEPT_FK;

--ex14_41
INSERT INTO EMP_FK --테이블의 모든 컬럼을 이용
VALUES(9999, 'TEST_NAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'),
3000, NULL, 10); --10이 DEPTNO(외래키)인데 부모 테이블 DEPT_FK에 값이 없음(오류발생)

--ex14_42
INSERT INTO DEPT_FK 
VALUES(10, 'TEST_DNAME', 'TEST_LOC');

SELECT * FROM DEPT_FK;

--ex14_43
INSERT INTO EMP_FK --테이블의 모든 컬럼을 이용
VALUES(9999, 'TEST_NAME', 'TEST_JOB', NULL,
TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10); 
--10이 DEPTNO(외래키)인데 부모 테이블 DEPT_FK에 값이 있음

--ex14_44
--부모 테이블의 참조열을 삭제하면 오류 발생(연결된 자식 테이블 문제)
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

--ex14_45
CREATE TABLE TABLE_CHECK(
LOGIN_ID VARCHAR2(20) CONSTRAINT
TBLCK_LOGINID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR2(20) CONSTRAINT
TBLCK_LOGINPW_CK
CHECK(LENGTH(LOGIN_PWD) > 3),
TEL VARCHAR2(20)
);

DESC TABLE_CHECK;

--ex14_46
INSERT INTO TABLE_CHECK
VALUES('TEST_ID', '1234', '010-1234-5678');

SELECT * FROM TABLE_CHECK;

--ex14_47
INSERT INTO TABLE_CHECK VALUES ('TEST_ID', '1234', '010-1234-5678');

SELECT * FROM TABLE_CHECK;

--ex14_48
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_CHECK';

--ex14_49
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20)
);

DESC TABLE_DEFAULT;

--ex14_50
INSERT INTO TABLE_DEFAULT 
VALUES('TEST_ID', NULL, '010-1234-5678');

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES ('TEST_ID2', '010-1234-5678');

SELECT * FROM TABLE_DEFAULT;