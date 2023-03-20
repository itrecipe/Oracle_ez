--ex7_1
SELECT SUM(SAL) FROM EMP;

--ex7_2
/* 다중행 함수를 사용하는 SELECT절에는 여러 행의 값을
출력하는 컬럼이나 데이터는 사용하지 못한다. */
SELECT ENAME, SUM(SAL) FROM EMP; --ORA-00937: 에러 발생

--ex7_3
/* ALL이 생략되어 있음(기본값), 컬럼 값이 NULL은 제외하고 합산 수행 */
SELECT SUM(COMM) FROM EMP;

--ex7_4
/* 선택사항 : DISTINCT는 중복을 한번만 처리, 
ALL 또는 생략은 중복을 모두 포함하여 합산처리 수행 */
SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL)
FROM EMP;

--ex7_5
/* COUNT대상 열을 * 로 하면, NULL이 포함된 컬럼이 있더라도
COUNT 기본값 ALL로 (중복 포함) 처리한다. */
SELECT COUNT(*) FROM EMP;

--ex7_6
SELECT COUNT(*) FROM EMP
WHERE DEPTNO = 30;

--ex7_7
--선택사항 DISTINCT, ALL, 생략 조건을 모두 사용
SELECT COUNT(DISTINCT SAL), COUNT(ALL SAL), COUNT(SAL)
FROM EMP;

--ex7_8
--COMM컬럼에 NULL이 있는 행은 COUNT에서 제외
SELECT COUNT(COMM)
FROM EMP;

--ex7_9
/* 조건절인 WHERE절에서 IS NOT NULL함수로 NULL이 아닌것만
선택하도록 제한하여 출력 */
SELECT COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;

--ex7_10 - MAX
--숫자중 최대값을 반환
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

--ex7_11 - MIN
--숫자 중 최소값을 반환
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 10;

--ex7_12
--날짜 중 최대값을 반환
--MAX, MIN함수는 숫자, 문자열, 날짜를 모두 처리한다.
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

--ex7_13
--날짜 중 최소값을 반환
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

--ex7_14 - AVG(SAL) 
/* ALL(*)과 같은 의미, AVG로 SAL의 평균을 모두 구하라 */
SELECT AVG(SAL) 
FROM EMP
WHERE DEPTNO = 30;

--ex7_15 - AVG(DISTINCT SAL)
--중복된값은 제거 후 출력
SELECT AVG(DISTINCT SAL)
FROM EMP
WHERE DEPTNO = 30;

--ex7_16
/* 집합 연산자 : UNION ALL을 사용하여 DEPTNO별로 결합(세로 결합)
SELECT절에 데이터 값이 있으면 그 값을 출력한다. */
SELECT AVG(SAL), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--ex7_17
--DEPTNO로 그룹화
SELECT AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

--ex7_18
--GROUP BY의 컬럼이 여러개일 경우 순서대로 그룹화(대그룹, 소그룹)
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--ex7_19
/* GROUP BY 사용시 SELECT절에는 GROUP BY의 값이 아닌
컬럼은 사용하지 못한다. -에러 발생! */
SELECT ENAME, DEPTNO, AVG(SAL) --다중행 함수는 사용가능
FROM EMP
GROUP BY DEPTNO;

--ex7_20 - GROUP BY ~ HAVING
/* - HAVING절은 GROUP BY의 조건절이다.
   - 그룹화된 결과에 조건을 준다.
   - GROUP BY 조건으로는 WHERE조건을 사용하지 않는다.
*/
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--ex7_21 - HAVING절 사용시  유의 사항
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE AVG(SAL) >= 2000 --WHERE절에 그룹화에 사용한 그룹화 함수 사용으로 오류발생!
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--ex7_22 - WHERE절과 HAVING절의 차이점
SELECT DEPTNO, JOB, AVG(SAL) 
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--ex7_23 - WHERE절과 HAVING절의 차이점
/* WHERE절과 GROUP BY절이 같이 있을시 
WHERE절이 먼저 실행되며 해당 결과를 가지고
GROUP BY 절을 실행한다. */
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--ex7_24 - ROLLUP, CUBE : 그룹화 데이터의 합계(요약) 행을 반환
/* 그룹화  항목이 2개이고 여러개의 그룹 함수를 사용하여 그룹별로  출력 */
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--ex7_25 - GROUP BY ROLLUP(그룹화 열지정(여러개가능));
/* GROUP BY의 값을 ROLLUP함수에 적어준다.
첫번째 GROUP BY 항목을 기준으로 
각 열의 그룹 연산 결과를 나타내는 행을 추가한다.
(즉, 표에서 소계란을 만들어 준다)
*/
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

--ex7_26 - GROUP BY CUBE (그룹화 열지정(여러개가능));
 /* - ROLLUP과 다른점은 GROUP BY의 첫번째 열에 대한 연산 결과뿐만 
 아니라 밑에 두번째 열에 대한 합계도 반환 
 
 -CUBE는 ROLLUP과 유사하나, 
 제 2의 그룹화 항목에 대한 연산 결과 소계란을 추가 해준다.
 */
 SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
 FROM EMP
 GROUP BY CUBE(DEPTNO, JOB)
 ORDER BY DEPTNO, JOB;
 
 --ex7_27
 --ROLLUP과 CUBE로 소게란 만드는 것을 일부에만 적용한다.
 SELECT DEPTNO, JOB, COUNT(*)
 FROM EMP
 GROUP BY DEPTNO, ROLLUP(JOB);
 
 --ex7_28
 SELECT DEPTNO, JOB, COUNT(*)
 FROM EMP
 GROUP BY JOB, ROLLUP(DEPTNO);
 
--ex7_29
/*GROUPING SETS(DEPTNO, JOB)는 GROUP BY 뒤에 오며 모두
대그룹으로 처리, 대그룹 처리 항목이 아닌 다른 그룹 항목은 NULL로 처리*/
SELECT DEPTNO, JOB, COUNT(*) 
FROM EMP 
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--ex7_30
/* GROUPING() 함수는 SELECT절에서 
그룹화 된 여부를 나타낸다(0은 그룹화, 1은 안됨.) 
ROLLUP이나 CUBE함수를 사용한 경우에 가능하다.
*/
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
    GROUPING(DEPTNO), GROUPING(JOB)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--ex7_31 - DECODE 함수로 다중 비교 연산
SELECT
    DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT',DEPTNO) AS DEPTNO,
    DECODE(GROUPING(JOB), 1, 'ALL_JOB', JOB) AS JOB,
    COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;
    
--ex7_32 - GROUPING_ID 함수
/* - GROUPING은 하나의 그룹화대상 컬럼을 사용한다.
- GROUPING_ID는 복수개의 그룹화 대상 컬럼을 사용한다.

- 앞의 값을 두번째 자리 비트 값, 
뒤의 값을 첫번째 자리 비트 값으로 처리하여 10진수로 표시한다.
ex) 00은 0.01은 1, 10은 2, 11은 3

-2진 비트값 계산 결과를 10진수로 반환한다.
*/
SELECT DEPTNO, JOB, COUNT(*), SUM(SAL),
    GROUPING(DEPTNO),
    GROUPING(JOB),
    GROUPING_ID(DEPTNO, JOB)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--ex7_33 - 행으로 표시하기
SELECT DEPTNO, ENAME
FROM EMP
GROUP BY DEPTNO, ENAME;

--ex7_34 - 한 컬럼에 값을 나열
/* DEPTNO를 기준으로 ENAME을 가로로 출력
 - LISTAGG(가로 배치 컬럼명, 구분자)는
 WITHIN GROUP(배치컬럼을 가로 배치시 정렬 순서)과 사용하고
 - 즉, 함수의 결과를 나타내는 별칭 ENAMES안에 배치한다.
 -LISTAGG는 ORACLE 11.VER부터 사용가능하다고 한다.
*/
SELECT DEPTNO,
LISTAGG(ENAME, ',')
WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES
FROM EMP
GROUP BY DEPTNO;

--ex7_35
SELECT DEPTNO, JOB, MAX(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--ex7_36
/* - PIVOT은 행과 열로 변환
- 서브 쿼리로 변환할 컬럼을 SELECT하여 PIVOT함수로 행으로
표시된 컬럼을 열로 표시
- 여기서는 DEPTNO를 열로 하여 PIVOT에서 구한 값을 표시
- 열로 변환할 컬럼의 값을 IN()연산자에 넣어줌
*/
SELECT *
FROM(SELECT DEPTNO, JOB, SAL
    FROM EMP)
PIVOT(MAX(SAL)
    FOR DEPTNO IN(10, 20, 30)
    )
ORDER BY JOB;

--ex7_37
/* - JOB의 값을 열에 표시하고 JOB에 해당하는 MAX(SAL)을 표시한다. 
- 열에 표시되는 이름은 JOB 값에 표시 */
SELECT *
    FROM(SELECT JOB, DEPTNO, SAL FROM EMP)
PIVOT(MAX(SAL)
    FOR JOB IN ('CLERK' AS CLERK,
                      'SALESMAN' AS SALESMAN,
                      'PRESIDENT' AS PRESIDENT,
                      'MANAGER' AS MANAGER,
                      'ANALYST' AS ANALYST
                      )
)
ORDER BY DEPTNO;

--ex7_38
/* PIVOT을 사용하지 않고 JOB값을 열로 표시하고 해당하는 값을 행으로 표시
(TIP : 이런 예제가 있다는 것만 알아두자) */
SELECT DEPTNO,
            MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK",
            MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN",
            MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT",
            MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER",
            MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--ex7_39
--UNPIVOT은 PIVOT과 반대(열을 행으로 변환)
SELECT * FROM(SELECT DEPTNO,
    MAX(DECODE(JOB, 'CLERK' , SAL)) AS "CLERK",
    MAX(DECODE(JOB, 'SALESMAN' , SAL)) AS "SALESMAN",
    MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT",
    MAX(DECODE(JOB, 'MANAGER' , SAL)) AS "MANAGER",
    MAX(DECODE(JOB, 'ANALYST' , SAL)) AS "ANALYST"
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO)
    UNPIVOT(SAL FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER,ANALYST))
    ORDER BY DEPTNO, JOB;