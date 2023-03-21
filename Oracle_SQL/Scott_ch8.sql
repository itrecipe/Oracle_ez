--ex8_1
--��� ������ �� ���̺��� ���յ� ��츦 ����Ѵ�.(��ī�����)
SELECT * FROM EMP,DEPT
ORDER BY EMPNO;

--ex8_2
--�� ���̺��� ������ �ִ� Ư�� ���� �������� (����� ��������)�����Ѵ�.
--�����ٿ� �ΰ��� ���̺� �� �̸��� ���� ���� �ڵ����� �ϳ���_1�� �ٴ´�.
SELECT * FROM EMP,DEPT  --������ ���� 2�� ���̺��� ���
WHERE EMP.DEPTNO = DEPT.DEPTNO --�����
ORDER BY EMPNO;

--ex8_3
--TABLE�� ��Ī ���
--TABLE�� ��Ī ���� �÷����� ���̺��� ��Ī�� �̿��Ѵ�.

SELECT * FROM EMP E, DEPT D --���̺� ��Ī ���
WHERE E.DEPTNO = D.DEPTNO --�÷��� ��Ī ���
ORDER BY EMPNO;

--ex8_4
--�� ���̺��� �÷����� ���� ���� �ٷ� ����ϸ� ������
SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC --�����߻�
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--ex8_5
--�÷��� ���̺� ��Ī�� ����Ͽ� �÷��� ���� ���̺��� �����Ѵ�.
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO --��������( ����,����,�ܼ� (����) )
ORDER BY D.DEPTNO, E.EMPNO;

--ex8_6
--WHERE���� ���� �񱳿��� �߰� ���� ���
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

--ex8_7
--�����ڰ� = (����� ������)�� �ƴ� BETWEEN AND�� ����ϹǷ� �� �����̴�.
SELECT * 
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL; --�����ȿ� ���� ���θ� �Ǵ��Ѵ�.

--ex8_8
--SELF JOIN�� ������ � ����
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS MGR_EMPNO, --�÷��� ��Ī ���
    E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2 --���̺��� �����Ƿ� ��ü����(��������)
WHERE E1.MGR = E2.EMPNO;

--ex8_9
--LEFT OUTER JOIN
--������ NULL�� ������ ��� ���� ����
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_EANME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;

--ex8_10
--RIGHT OUTER JOIN
--OUTER JOIN�� �ƴ� � ���ΰ� ��ü������ INNER JOIN
--������ ��� ���� �����Ͽ� ����(���ǿ� �ȸ´� ������ ���� NULL)
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_EANME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO;

--ex8_11
--SQL-99
--� ����, ����� ��� �÷����� �� ���̺� ���ƾ� �ϸ� ��Ī�� ������� �ʴ´�.
--WHERE���� ���� �� ����
SELECT E. EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
    DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

--ex8_12
--JOIN USING(���, �÷���)
--WHERE�������� � �񱳴� ����
--SELECT������  �� �÷����� ��Ī ��� ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING(DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, EMPNO;

--ex8_13
--���� ���� ����Ѵ�.
--OR�� ���� �񱳽��� ����Ѵ�.
--SELECT���� �� �÷��� ��Ī�� ����Ѵ�.
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
WHERE SAL <= 3000
ORDER BY DEPTNO, EMPNO;

--ex8_14
--SQL-99�� FROM������ JOIN ON ���·� ����Ѵ�.
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
            E2.EMPNO AS MGR_EMPNO,
            E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) 
ORDER BY E1.EMPNO;

--ex8_15
--SQL-99�� FROM������ JOIN ON ���·� ����Ѵ�
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
            E2.EMPNO AS MGR_EMPNO,
            E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) 
ORDER BY E1.EMPNO;

--ex8_16
--SQL-99�� FROM������ JOIN ON ���·� ����Ѵ�
--FULL OUTER JOIN�� ���� ����� ����, UNION ���� �����ڸ� ����Ѵ�.
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
            E2.EMPNO AS MGR_EMPNO,
            E2.ENAME AS MGR_ENAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) 
ORDER BY E1.EMPNO;