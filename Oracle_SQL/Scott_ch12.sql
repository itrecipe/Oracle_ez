--ex12_1 - EMP_DDL ���̺� ����
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

--DESCRIBE�� DESC�� ���� ���̺� ������ �����ִ� ���
--DESC�� DESCRIBE�� ������̴�. (DESC : ���̺��� ������ ���� ��ɾ�)
DESCRIBE EMP_DDL;

SELECT * FROM EMP_DDL;

--ex12_2 - DEPT_DDL ���̺� ����
--���̺��� ���� �� �����ͱ��� ��� �����ͼ� �� ���̺��� �����ߴ�.
CREATE TABLE DEPT_DDL
AS SELECT  * FROM DEPT;

DESC DEPT_DDL;

--ex12_3
SELECT * FROM DEPT_DDL;

--ex12_4 - EMP_DDL_30 ���̺� ����
/* ������ �״�� �������� �����ʹ�
WHERE���ǿ� �´� �����͸� �����ͼ� ���̺��� �����ߴ�. */

CREATE TABLE EMP_DDL_30
AS SELECT  * FROM EMP
WHERE DEPTNO = 30;

SELECT * FROM EMP_DDL_30;

--ex12_5 - EMPDEPT_DDL ���̺� ����
/* ���������� SELECT���� �÷��� ���� ������ ���� ���̺��� �����,
�����ʹ� �������� �ʴ´�. */
CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
                  E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
            FROM EMP E, DEPT D
            WHERE 1 <> 1;

SELECT * FROM EMPDEPT_DDL;

--ex12_6 - EMP_ALTER ���̺� ����
CREATE TABLE EMP_ALTER
AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

--ex12_7 - EMP_ALTER�� HP�÷� �߰� (ADD ���)
ALTER TABLE EMP_ALTER
ADD HP VARCHAR2(20);

SELECT * FROM EMP_ALTER;

--ex12_8 - EMP_ALTER�� HP�÷��� RENAME���� TEL�� �����غ���
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

SELECT * FROM EMP_ALTER;
