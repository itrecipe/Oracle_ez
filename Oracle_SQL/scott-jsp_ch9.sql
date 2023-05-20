--ex9_1
SELECT SAL FROM EMP WHERE ENAME = 'JONES';

--ex9_2
SELECT * FROM EMP WHERE SAL > 2975;

--ex9_3
--ex9_1을 조건열에 비교 값으로 사용하는데 이를 서브쿼리 라고 한다.
--서브쿼리는 꼭 WHERE(조건)절 옆에 ()로 묶어서 사용해야 한다.
SELECT * FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

--ex9_4
--DATE형도 비교 가능
--날짜 값이 작다는 뜻은 빠른 날짜를 의미한다.
SELECT * FROM EMP
WHERE HIREDATE < 
(SELECT HIREDATE FROM EMP WHERE ENAME = 'ALLEN');

SELECT * FROM EMP;

--ex9_5
SELECT E.EMPNO, ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO --두 테이블 등가 조인
    AND E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP); 
--서브쿼리에서 단일값을 반환하는 다중행 함수 AVG사용
-- > 연산자는 단일값 끼리 비교하는 단일행 연산자

--ex9_6
SELECT * FROM EMP WHERE DEPTNO IN (20,30); 
--IN연산자는 복수개의 값과 비교하는 연산자
--다중행 서브쿼리와 같이 사용가능하다.

--ex9_7
--다중행 함수 MAX를 사용하나, GROUP BY를 사용하므로 그룹별 MAX를 반환(복수개를 사용)
--복수개의 값과 비교는 다중행 연산자 IN을 사용한다.
SELECT * 
FROM EMP
WHERE SAL IN 
(SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO);

--ex9_8
--그룹별 최대 월급(SAL)
SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

SELECT * FROM EMP;

--ex9_9 - 동등 비교 연산자 사용
--동등비교 = 과 ANY를 사용
SELECT * FROM EMP
WHERE SAL = ANY
(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--ex9_10
--SOME연산자로 ANY연산자와 동일하게 사용한다.
SELECT * FROM EMP
WHERE SAL = SOME
(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--ex9_11
--DEPTNO 30의 값들 중 그 값보다 하나라도 작으면 TRUE
--최대값보다 적으면 TRUE
SELECT * FROM EMP
WHERE SAL < ANY
(SELECT SAL FROM EMP
WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

--ex9_12
SELECT SAL
FROM EMP
WHERE DEPTNO = 30;

--ex9_13
--결과의 최소값과 비교
SELECT * FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--ex9_14
/*
- ALL연산자도 다중행 서브쿼리와 사용한다.
- 비교연산자 ALL()
- ALL의 모든 결과보다 < 조건을 만족하려면 결과의 최소값 보다 작으면
모두 만족한다. 
*/
SELECT * FROM EMP
WHERE SAL < ALL 
(SELECT SAL FROM EMP WHERE DEPTNO = 30);

--ex9_15
/*
- ALL연산자도 다중행 서브쿼리와 사용한다.
- 비교연산자 ALL()
- ALL의 모든 결과보다 > 조건을 만족하려면 결과의 최소값 보다 크면
모두 만족한다. 
*/
SELECT * 
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--ex9_16
--EXISTS는 서브쿼리의 결과가 하나라도 있다면 TRUE
SELECT * 
FROM EMP
WHERE EXISTS 
(SELECT DNAME FROM DEPT WHERE DEPTNO = 10);

--ex9_17
SELECT * 
FROM EMP
WHERE EXISTS
(SELECT DNAME FROM DEPT WHERE DEPTNO = 50);

--ex9_18
--서브쿼리의 결과가 2개 이상의 컬럼을 가질때도 비교연산 가능
--이때 메인쿼리의 비교 연산 대상에 (컬럼1, 컬럼2 ...)사용
--이때 데이터형이 일치해야하며 순서도 일치해야 한다.
SELECT *
FROM EMP
WHERE (DEPTNO, SAL)
IN (SELECT DEPTNO, MAX(SAL) 
FROM EMP
GROUP BY DEPTNO);

--ex9_19
--해당 방식을 많이 사용함

--서브쿼리를 FROM절 안에서 사용한다.

/* 테이블처럼 간주하며 별칭을 주어 SELECT절이나 
WHERE절에서는 별칭으로 사용한다. */

/* 2개의 서브쿼리를 FROM절에서 사용한다.
(실제론 일반테이블에서 조회한것이랑 똑같다) */
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
(SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO; --두 테이블 컬럼을 =로 비교하므로 등가조인이다.

--ex9_20
/* 
- WITH절을 이용히여 서브쿼리에 대한 별칭을 미리 지정한다
(SELECT절 위에 만든다) 

- 별칭 AS(서브쿼리문), 나머지 절에서는 별칭을 이용한다.

- FROM절에서 서브쿼리를 이용하는것보다 깔끔해서 알아보기 쉽다.
*/

WITH
E10 AS(SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

--ex9_21
--SELECT절의 항목으로 서브쿼리 사용
--각각의 형에 대해 서브쿼리 실행값
SELECT EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE 
    FROM SALGRADE 
    WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,DEPTNO,
    (SELECT DNAME
    FROM DEPT
    WHERE E.DEPTNO = DEPT.DEPTNO) AS DANE
FROM EMP E;


