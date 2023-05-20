--ex13_1
--��� ������ ���� ���̺� ��ȸ
SELECT * FROM DICT;

--ex13_2
--ex13_1�� ������
SELECT * FROM DICTIONARY;

--ex13_3
--������ ������ ������ ������ �̸��� ��ȸ
SELECT TABLE_NAME  --�÷���
FROM USER_TABLES; --���Ӱ��� ���� ���̺�

--ex13_4
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES; --������ �������� �㰡 ���� ��ü�� ���õ� ���̺�

--ex13_5
SELECT * FROM DBA_TABLES;
--������ ������ ���� ������ ���õ� ������ ����
--SCOTT�� ��ȸ�ô� ������ ��� ��ȸ�� �ȵ�

--ex13_6
--SYSTEM �Ǵ� SYS�������� ��ȸ�ؾ� �Ѵ�.
SELECT * FROM DBA_TABLES;

--ex13_7
--SCOTT������ ������ ��ȸ�Ѵ�.
--ex13_5 ~ ex13_7������ ��� SYSTEM�̳� SYS�������� ��ȸ�ؾ� �Ѵ�.
SELECT * FROM DBA_USERS --����ڿ� ���õ� ������ ���̺�
WHERE USERNAME = 'SCOTT';

--ex13_8
SELECT * FROM USER_INDEXES;
--������ ������ INDEX�� ���õ� ������ ����

--ex13_9
SELECT * FROM USER_IND_COLUMNS;

--ex13_10 - INDEX : IMP_EMP_SAL �ε��� ����
/* �ε����� å�� ������ȣ�� ���ι�ȣ�� �������� �����ϸ� �ȴ�.
������ ã�Ƽ� ��ȸ �Ϸ��� �������� ��� �ִٰ� �Ѵ�. */
CREATE INDEX IMP_EMP_SAL
ON EMP(SAL); --EMP���̺��� SAL�÷��� �ε����� �ο��Ѵ�.

--ex13_11
SELECT * FROM USER_IND_COLUMNS;

--ex13_12 - DROP INDEX : �ε��� ����
DROP INDEX IMP_EMP_SAL;

--ex13_13
SELECT * FROM USER_IND_COLUMNS;

--ex13_14
--SYSTEM�������� VIEW�� ������ ������ �ο��Ѵ�.
GRANT CREATE  VIEW  TO  SCOTT;

--ex13_15
CREATE VIEW VW_EMP20
AS (SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 30);

--ex13_16
SELECT * FROM USER_VIEWS; --VIEW�� ���õ� ������ ����

--ex13_17
SELECT VIEW_NAME, TEXT_LENGTH, TEXT --VIEW ������ SELECT ����
FROM USER_VIEWS;

--ex13_18
SELECT * FROM VW_EMP20;

--ex13_19
DROP VIEW VW_EMP20;

--ex13_20 - TOP-N SQL�� (�߿�!)
--SELECT�� ��� ������� ROWNUM�� �ο��Ѵ�.
SELECT ROWNUM, E. * 
FROM EMP E;

--ex13_21
/* ROWNUM�� SELECT�� �ο��ǰ�,
ORDER BY�� ���� �������� ����ǹǷ�,
ROWNUM�� ������ ��ȣ�� ������ �ȴ�. 
(�׷��� ��ȸ�غ��� ��ȣ�� ������ ���� �ʰ� ���� �ִ�)*/
SELECT ROWNUM, E. *
FROM EMP E
ORDER BY SAL DESC;

--ex13_22
/* TOP-N����� ����������� �ζ��� ��� ������ ������
�������� ��� ��ü�� SELECT�ϸ� 
���� ���°� �� ROWNUM�� �ο� �ȴ�. */
SELECT ROWNUM, E. *
FROM (SELECT * 
          FROM EMP E 
          ORDER BY SAL DESC) E;

--ex13_23
--WITH���� ���������� ��Ī�� �ο��Ѵ�.
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E. * FROM E;

--ex13_24
--ROWNUM�� WHERE���� ���
--�ǻ� �÷��� ROWNUM�� �Ϲ� �÷�ó�� ��밡��
SELECT ROWNUM, E. *
FROM(SELECT * FROM EMP E ORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

--ex13_25
--WITH�� ���
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E. *
FROM E
WHERE ROWNUM <= 3;

--ex13_26 - DEPT_SEQUENCE : ������ �ǽ��� ���̺� ����
CREATE TABLE DEPT_SEQUENCE
AS SELECT * FROM DEPT WHERE 1 <> 1;

--ex13_27 - SEQ_DEPT_SEQUENCE : ������ ����
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;
    
--ex13_28
SELECT * FROM USER_SEQUENCES; --������ ���� �����ͻ��� ��ȸ

--ex13_29
--NEXTVAL�� ���� ��ȣ
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--ex13_30
--CURRVAL�� ���� ��ȣ
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

--ex13_31
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL'); 
--9ȸ �ݺ�(���� �ߺ��Ǵ� ��ȣ�� �ȳ���)

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--ex13_32
--����� CREATE(������)��� ALTER(������)�� ����Ѵ�.
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

--ex13_37 - SNONYM ���� �ο�
--SYNONYM��ü ���� ������ �����ڰ� �ο� ����� ��밡���ϴ�.
/* SQLPLUS SYSTEM/ORACLE <- ����� �����Ͽ�
�Ʒ� GRANT(����) ����� �Է����ָ� �ȴ�. */
GRANT CREATE SYNONYM TO SCOTT;

GRANT CREATE PUBLIC SYNONYM TO SCOTT; 

--ex13_38
--SYNONYM�� ��ü�� ��Ī(���Ǿ�) �ο�
CREATE SYNONYM E 
FOR EMP; --EMP���̺� ��ü�� E�� ���Ǿ �ο��Ѵ�.
--EMP�տ� ����� ������ �����Ǹ� ���� ���� ������ �����ϰ� �ȴ�.

--ex13_39
--SYNONYM���� ���Ŀ��� ���Ǿ� E�� ����� �� �ִ�.
SELECT * FROM E;

SELECT * FROM EMP;

--ex13_40
DROP SYNONYM E;