--ex7_1
SELECT SUM(SAL) FROM EMP;

--ex7_2
/* ������ �Լ��� ����ϴ� SELECT������ ���� ���� ����
����ϴ� �÷��̳� �����ʹ� ������� ���Ѵ�. */
SELECT ENAME, SUM(SAL) FROM EMP; --ORA-00937: ���� �߻�

--ex7_3
/* ALL�� �����Ǿ� ����(�⺻��), �÷� ���� NULL�� �����ϰ� �ջ� ���� */
SELECT SUM(COMM) FROM EMP;

--ex7_4
/* ���û��� : DISTINCT�� �ߺ��� �ѹ��� ó��, 
ALL �Ǵ� ������ �ߺ��� ��� �����Ͽ� �ջ�ó�� ���� */
SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL)
FROM EMP;

--ex7_5
/* COUNT��� ���� * �� �ϸ�, NULL�� ���Ե� �÷��� �ִ���
COUNT �⺻�� ALL�� (�ߺ� ����) ó���Ѵ�. */
SELECT COUNT(*) FROM EMP;

--ex7_6
SELECT COUNT(*) FROM EMP
WHERE DEPTNO = 30;

--ex7_7
--���û��� DISTINCT, ALL, ���� ������ ��� ���
SELECT COUNT(DISTINCT SAL), COUNT(ALL SAL), COUNT(SAL)
FROM EMP;

--ex7_8
--COMM�÷��� NULL�� �ִ� ���� COUNT���� ����
SELECT COUNT(COMM)
FROM EMP;

--ex7_9
/* �������� WHERE������ IS NOT NULL�Լ��� NULL�� �ƴѰ͸�
�����ϵ��� �����Ͽ� ��� */
SELECT COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;

--ex7_10 - MAX
--������ �ִ밪�� ��ȯ
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

--ex7_11 - MIN
--���� �� �ּҰ��� ��ȯ
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 10;

--ex7_12
--��¥ �� �ִ밪�� ��ȯ
--MAX, MIN�Լ��� ����, ���ڿ�, ��¥�� ��� ó���Ѵ�.
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

--ex7_13
--��¥ �� �ּҰ��� ��ȯ
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

--ex7_14 - AVG(SAL) 
/* ALL(*)�� ���� �ǹ�, AVG�� SAL�� ����� ��� ���϶� */
SELECT AVG(SAL) 
FROM EMP
WHERE DEPTNO = 30;

--ex7_15 - AVG(DISTINCT SAL)
--�ߺ��Ȱ��� ���� �� ���
SELECT AVG(DISTINCT SAL)
FROM EMP
WHERE DEPTNO = 30;

--ex7_16
/* ���� ������ : UNION ALL�� ����Ͽ� DEPTNO���� ����(���� ����)
SELECT���� ������ ���� ������ �� ���� ����Ѵ�. */
SELECT AVG(SAL), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--ex7_17
--DEPTNO�� �׷�ȭ
SELECT AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

--ex7_18
--GROUP BY�� �÷��� �������� ��� ������� �׷�ȭ(��׷�, �ұ׷�)
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--ex7_19
/* GROUP BY ���� SELECT������ GROUP BY�� ���� �ƴ�
�÷��� ������� ���Ѵ�. -���� �߻�! */
SELECT ENAME, DEPTNO, AVG(SAL) --������ �Լ��� ��밡��
FROM EMP
GROUP BY DEPTNO;

--ex7_20 - GROUP BY ~ HAVING
/* - HAVING���� GROUP BY�� �������̴�.
   - �׷�ȭ�� ����� ������ �ش�.
   - GROUP BY �������δ� WHERE������ ������� �ʴ´�.
*/
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--ex7_21 - HAVING�� ����  ���� ����
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE AVG(SAL) >= 2000 --WHERE���� �׷�ȭ�� ����� �׷�ȭ �Լ� ������� �����߻�!
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--ex7_22 - WHERE���� HAVING���� ������
SELECT DEPTNO, JOB, AVG(SAL) 
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--ex7_23 - WHERE���� HAVING���� ������
/* WHERE���� GROUP BY���� ���� ������ 
WHERE���� ���� ����Ǹ� �ش� ����� ������
GROUP BY ���� �����Ѵ�. */
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--ex7_24 - ROLLUP, CUBE : �׷�ȭ �������� �հ�(���) ���� ��ȯ
/* �׷�ȭ  �׸��� 2���̰� �������� �׷� �Լ��� ����Ͽ� �׷캰��  ��� */
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--ex7_25 - GROUP BY ROLLUP(�׷�ȭ ������(����������));
/* GROUP BY�� ���� ROLLUP�Լ��� �����ش�.
ù��° GROUP BY �׸��� �������� 
�� ���� �׷� ���� ����� ��Ÿ���� ���� �߰��Ѵ�.
(��, ǥ���� �Ұ���� ����� �ش�)
*/
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

--ex7_26 - GROUP BY CUBE (�׷�ȭ ������(����������));
 /* - ROLLUP�� �ٸ����� GROUP BY�� ù��° ���� ���� ���� ����Ӹ� 
 �ƴ϶� �ؿ� �ι�° ���� ���� �հ赵 ��ȯ 
 
 -CUBE�� ROLLUP�� �����ϳ�, 
 �� 2�� �׷�ȭ �׸� ���� ���� ��� �Ұ���� �߰� ���ش�.
 */
 SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
 FROM EMP
 GROUP BY CUBE(DEPTNO, JOB)
 ORDER BY DEPTNO, JOB;
 
 --ex7_27
 --ROLLUP�� CUBE�� �ҰԶ� ����� ���� �Ϻο��� �����Ѵ�.
 SELECT DEPTNO, JOB, COUNT(*)
 FROM EMP
 GROUP BY DEPTNO, ROLLUP(JOB);
 
 --ex7_28
 SELECT DEPTNO, JOB, COUNT(*)
 FROM EMP
 GROUP BY JOB, ROLLUP(DEPTNO);
 
--ex7_29
/*GROUPING SETS(DEPTNO, JOB)�� GROUP BY �ڿ� ���� ���
��׷����� ó��, ��׷� ó�� �׸��� �ƴ� �ٸ� �׷� �׸��� NULL�� ó��*/
SELECT DEPTNO, JOB, COUNT(*) 
FROM EMP 
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--ex7_30
/* GROUPING() �Լ��� SELECT������ 
�׷�ȭ �� ���θ� ��Ÿ����(0�� �׷�ȭ, 1�� �ȵ�.) 
ROLLUP�̳� CUBE�Լ��� ����� ��쿡 �����ϴ�.
*/
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
    GROUPING(DEPTNO), GROUPING(JOB)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--ex7_31 - DECODE �Լ��� ���� �� ����
SELECT
    DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT',DEPTNO) AS DEPTNO,
    DECODE(GROUPING(JOB), 1, 'ALL_JOB', JOB) AS JOB,
    COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;
    
--ex7_32 - GROUPING_ID �Լ�
/* - GROUPING�� �ϳ��� �׷�ȭ��� �÷��� ����Ѵ�.
- GROUPING_ID�� �������� �׷�ȭ ��� �÷��� ����Ѵ�.

- ���� ���� �ι�° �ڸ� ��Ʈ ��, 
���� ���� ù��° �ڸ� ��Ʈ ������ ó���Ͽ� 10������ ǥ���Ѵ�.
ex) 00�� 0.01�� 1, 10�� 2, 11�� 3

-2�� ��Ʈ�� ��� ����� 10������ ��ȯ�Ѵ�.
*/
SELECT DEPTNO, JOB, COUNT(*), SUM(SAL),
    GROUPING(DEPTNO),
    GROUPING(JOB),
    GROUPING_ID(DEPTNO, JOB)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--ex7_33 - ������ ǥ���ϱ�
SELECT DEPTNO, ENAME
FROM EMP
GROUP BY DEPTNO, ENAME;

--ex7_34 - �� �÷��� ���� ����
/* DEPTNO�� �������� ENAME�� ���η� ���
 - LISTAGG(���� ��ġ �÷���, ������)��
 WITHIN GROUP(��ġ�÷��� ���� ��ġ�� ���� ����)�� ����ϰ�
 - ��, �Լ��� ����� ��Ÿ���� ��Ī ENAMES�ȿ� ��ġ�Ѵ�.
 -LISTAGG�� ORACLE 11.VER���� ��밡���ϴٰ� �Ѵ�.
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
/* - PIVOT�� ��� ���� ��ȯ
- ���� ������ ��ȯ�� �÷��� SELECT�Ͽ� PIVOT�Լ��� ������
ǥ�õ� �÷��� ���� ǥ��
- ���⼭�� DEPTNO�� ���� �Ͽ� PIVOT���� ���� ���� ǥ��
- ���� ��ȯ�� �÷��� ���� IN()�����ڿ� �־���
*/
SELECT *
FROM(SELECT DEPTNO, JOB, SAL
    FROM EMP)
PIVOT(MAX(SAL)
    FOR DEPTNO IN(10, 20, 30)
    )
ORDER BY JOB;

--ex7_37
/* - JOB�� ���� ���� ǥ���ϰ� JOB�� �ش��ϴ� MAX(SAL)�� ǥ���Ѵ�. 
- ���� ǥ�õǴ� �̸��� JOB ���� ǥ�� */
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
/* PIVOT�� ������� �ʰ� JOB���� ���� ǥ���ϰ� �ش��ϴ� ���� ������ ǥ��
(TIP : �̷� ������ �ִٴ� �͸� �˾Ƶ���) */
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
--UNPIVOT�� PIVOT�� �ݴ�(���� ������ ��ȯ)
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