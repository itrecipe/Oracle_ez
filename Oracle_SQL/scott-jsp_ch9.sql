--ex9_1
SELECT SAL FROM EMP WHERE ENAME = 'JONES';

--ex9_2
SELECT * FROM EMP WHERE SAL > 2975;

--ex9_3
--ex9_1�� ���ǿ��� �� ������ ����ϴµ� �̸� �������� ��� �Ѵ�.
--���������� �� WHERE(����)�� ���� ()�� ��� ����ؾ� �Ѵ�.
SELECT * FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

--ex9_4
--DATE���� �� ����
--��¥ ���� �۴ٴ� ���� ���� ��¥�� �ǹ��Ѵ�.
SELECT * FROM EMP
WHERE HIREDATE < 
(SELECT HIREDATE FROM EMP WHERE ENAME = 'ALLEN');

SELECT * FROM EMP;

--ex9_5
SELECT E.EMPNO, ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO --�� ���̺� � ����
    AND E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP); 
--������������ ���ϰ��� ��ȯ�ϴ� ������ �Լ� AVG���
-- > �����ڴ� ���ϰ� ���� ���ϴ� ������ ������

--ex9_6
SELECT * FROM EMP WHERE DEPTNO IN (20,30); 
--IN�����ڴ� �������� ���� ���ϴ� ������
--������ ���������� ���� ��밡���ϴ�.

--ex9_7
--������ �Լ� MAX�� ����ϳ�, GROUP BY�� ����ϹǷ� �׷캰 MAX�� ��ȯ(�������� ���)
--�������� ���� �񱳴� ������ ������ IN�� ����Ѵ�.
SELECT * 
FROM EMP
WHERE SAL IN 
(SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO);

--ex9_8
--�׷캰 �ִ� ����(SAL)
SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

SELECT * FROM EMP;

--ex9_9 - ���� �� ������ ���
--����� = �� ANY�� ���
SELECT * FROM EMP
WHERE SAL = ANY
(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--ex9_10
--SOME�����ڷ� ANY�����ڿ� �����ϰ� ����Ѵ�.
SELECT * FROM EMP
WHERE SAL = SOME
(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--ex9_11
--DEPTNO 30�� ���� �� �� ������ �ϳ��� ������ TRUE
--�ִ밪���� ������ TRUE
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
--����� �ּҰ��� ��
SELECT * FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--ex9_14
/*
- ALL�����ڵ� ������ ���������� ����Ѵ�.
- �񱳿����� ALL()
- ALL�� ��� ������� < ������ �����Ϸ��� ����� �ּҰ� ���� ������
��� �����Ѵ�. 
*/
SELECT * FROM EMP
WHERE SAL < ALL 
(SELECT SAL FROM EMP WHERE DEPTNO = 30);

--ex9_15
/*
- ALL�����ڵ� ������ ���������� ����Ѵ�.
- �񱳿����� ALL()
- ALL�� ��� ������� > ������ �����Ϸ��� ����� �ּҰ� ���� ũ��
��� �����Ѵ�. 
*/
SELECT * 
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--ex9_16
--EXISTS�� ���������� ����� �ϳ��� �ִٸ� TRUE
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
--���������� ����� 2�� �̻��� �÷��� �������� �񱳿��� ����
--�̶� ���������� �� ���� ��� (�÷�1, �÷�2 ...)���
--�̶� ���������� ��ġ�ؾ��ϸ� ������ ��ġ�ؾ� �Ѵ�.
SELECT *
FROM EMP
WHERE (DEPTNO, SAL)
IN (SELECT DEPTNO, MAX(SAL) 
FROM EMP
GROUP BY DEPTNO);

--ex9_19
--�ش� ����� ���� �����

--���������� FROM�� �ȿ��� ����Ѵ�.

/* ���̺�ó�� �����ϸ� ��Ī�� �־� SELECT���̳� 
WHERE�������� ��Ī���� ����Ѵ�. */

/* 2���� ���������� FROM������ ����Ѵ�.
(������ �Ϲ����̺��� ��ȸ�Ѱ��̶� �Ȱ���) */
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
(SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO; --�� ���̺� �÷��� =�� ���ϹǷ� ������̴�.

--ex9_20
/* 
- WITH���� �̿����� ���������� ���� ��Ī�� �̸� �����Ѵ�
(SELECT�� ���� �����) 

- ��Ī AS(����������), ������ �������� ��Ī�� �̿��Ѵ�.

- FROM������ ���������� �̿��ϴ°ͺ��� ����ؼ� �˾ƺ��� ����.
*/

WITH
E10 AS(SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

--ex9_21
--SELECT���� �׸����� �������� ���
--������ ���� ���� �������� ���ప
SELECT EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE 
    FROM SALGRADE 
    WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,DEPTNO,
    (SELECT DNAME
    FROM DEPT
    WHERE E.DEPTNO = DEPT.DEPTNO) AS DANE
FROM EMP E;


