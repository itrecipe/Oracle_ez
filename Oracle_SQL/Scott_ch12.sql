--ex12_1 - EMP_DDL 테이블 생성
CREATE TABLE EMP_DDL(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7, 2),
COMM NUMBER(7, 2),
DEPTNO NUMBER(2)
);

DESC EMP_DDL;

--DESCRIBE도 DESC와 같은 테이블 구조를 보여주는 명령
--DESC는 DESCRIBE의 축약형이다. (DESC : 테이블의 구조를 보는 명령어)
DESCRIBE EMP_DDL;

SELECT * FROM EMP_DDL;

--ex12_2 - DEPT_DDL 테이블 생성
--테이블의 구조 및 데이터까지 모두 가져와서 새 테이블을 생성했다.
CREATE TABLE DEPT_DDL
AS SELECT  * FROM DEPT;

DESC DEPT_DDL;

--ex12_3
SELECT * FROM DEPT_DDL;

--ex12_4 - EMP_DDL_30 테이블 생성
/* 구조는 그대로 가져오고 데이터는
WHERE조건에 맞는 데이터만 가져와서 테이블을 생성했다. */

CREATE TABLE EMP_DDL_30
AS SELECT  * FROM EMP
WHERE DEPTNO = 30;

SELECT * FROM EMP_DDL_30;

--ex12_5 - EMPDEPT_DDL 테이블 생성
/* 서브쿼리의 SELECT절의 컬럼과 같은 구조를 가진 테이블을 만들고,
데이터는 가져오지 않는다. */
CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
                  E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
            FROM EMP E, DEPT D
            WHERE 1 <> 1;

SELECT * FROM EMPDEPT_DDL;

--ex12_6 - EMP_ALTER 테이블 생성
CREATE TABLE EMP_ALTER
AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

--ex12_7 - EMP_ALTER에 HP컬럼 추가 (ADD 사용)
ALTER TABLE EMP_ALTER
ADD HP VARCHAR2(20);

SELECT * FROM EMP_ALTER;

--ex12_8 - RENAME : 테이블 컬럼명 변경하기
--EMP_ALTER에 HP컬럼을 RENAME으로 TEL로 변경
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

SELECT * FROM EMP_ALTER;

--ex12_9 - ALTER ~ MODIFY : 테이블의 자료형을 변경
--테이블의 컬럼의 데이터형을 변경시 사용
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

DESC EMP_ALTER;

--ex12_10 ALTER ~ DROP : 테이블의 컬럼 삭제
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT * FROM EMP_ALTER;

--ex12_11 - RENAME : 테이블명 변경하기
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

--ex12_12 - 테이블명 변경전 이름은 사용 불가
DESC EMP_ALTER;

--ex12_13
SELECT * FROM EMP_RENAME;

--ex12_14 - TRUNCATE
--DDL이므로 AUTO COMMIT이 되기 때문에 ROLLBACK은 불가
TRUNCATE TABLE EMP_RENAME;

SELECT * FROM EMP_RENAME;

--ex12_15 - DROP : 테이블 삭제 명령
DROP TABLE EMP_RENAME;

--ex12_16
DESC EMP_RENAME;
