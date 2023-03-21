--ex8_1
--모든 가능한 두 테이블의 조합된 경우를 출력한다.(데카르토글)
SELECT * FROM EMP,DEPT
ORDER BY EMPNO;

--ex8_2
--두 테이블의 관련이 있는 특정 열을 기준으로 (동등비교 조건으로)조인한다.
--제목줄에 두개의 테이블에 열 이름이 같은 것은 자동으로 하나는_1이 붙는다.
SELECT * FROM EMP,DEPT  --조인을 위해 2개 테이블을 사용
WHERE EMP.DEPTNO = DEPT.DEPTNO --동등비교
ORDER BY EMPNO;

--ex8_3
--TABLE명에 별칭 사용
--TABLE에 병칭 사용시 컬럼명에도 테이블의 별칭을 이용한다.

SELECT * FROM EMP E, DEPT D --테이블 별칭 사용
WHERE E.DEPTNO = D.DEPTNO --컬럼에 별칭 사용
ORDER BY EMPNO;

--ex8_4
--두 테이블의 컬럼명이 같은 것을 바로 사용하면 에러남
SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC --에러발생
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--ex8_5
--컬럼명에 테이블 별칭을 사용하여 컬럼이 속한 테이블을 지정한다.
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO --동등조인( 이퀄,내부,단순 (조인) )
ORDER BY D.DEPTNO, E.EMPNO;

--ex8_6
--WHERE절에 동등 비교와의 추가 조건 사용
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

--ex8_7
--연산자가 = (동등비교 연산자)가 아닌 BETWEEN AND를 사용하므로 비등가 조인이다.
SELECT * 
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL; --범위안에 포함 여부를 판단한다.

--ex8_8
--SELF JOIN은 일종의 등가 조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS MGR_EMPNO, --컬럼에 별칭 사용
    E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2 --테이블이 같으므로 자체조인(셀프조인)
WHERE E1.MGR = E2.EMPNO;

--ex8_9
--LEFT OUTER JOIN
--왼쪽의 NULL을 포함한 모든 행을 포함
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_EANME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;

--ex8_10
--RIGHT OUTER JOIN
--OUTER JOIN이 아닌 등가 조인과 자체조인은 INNER JOIN
--우측의 모든 행을 포함하여 조인(조건에 안맞는 왼쪽의 행은 NULL)
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_EANME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO;

--ex8_11
--SQL-99
--등가 조인, 동등비교 대산 컬럼명이 두 테이블에 같아야 하며 별칭을 사용하지 않는다.
--WHERE절로 동등 비교 안함
SELECT E. EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
    DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

--ex8_12
--JOIN USING(등가비교, 컬럼명)
--WHERE절에서는 등가 비교는 안함
--SELECT절에서  비교 컬럼명은 별칭 사용 안함
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING(DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, EMPNO;

--ex8_13
--제일 많이 사용한다.
--OR에 조건 비교식을 사용한다.
--SELECT절에 비교 컬럼에 별칭을 사용한다.
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
WHERE SAL <= 3000
ORDER BY DEPTNO, EMPNO;

--ex8_14
--SQL-99로 FROM절에서 JOIN ON 형태로 사용한다.
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
            E2.EMPNO AS MGR_EMPNO,
            E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) 
ORDER BY E1.EMPNO;

--ex8_15
--SQL-99로 FROM절에서 JOIN ON 형태로 사용한다
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
            E2.EMPNO AS MGR_EMPNO,
            E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) 
ORDER BY E1.EMPNO;

--ex8_16
--SQL-99로 FROM절에서 JOIN ON 형태로 사용한다
--FULL OUTER JOIN은 기존 방식은 없고, UNION 집합 연산자를 사용한다.
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
            E2.EMPNO AS MGR_EMPNO,
            E2.ENAME AS MGR_ENAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) 
ORDER BY E1.EMPNO;