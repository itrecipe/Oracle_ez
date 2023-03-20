--ex6_1
--UPPER(���ڿ�)�� ���� �빮�ڷ� ��ȯ,
--LOWER(���ڿ�)�� ���� �ҹ��ڷ� ��ȯ,
--INITCAP(���ڿ�)�� ù���ڸ� �빮�ڷ� ��ȯ
--select���� �׸��� �÷���, �����, �Լ��� �´�.
select ename,
upper(ename),
lower(ename), 
initcap(ename)
from emp;

--ex6_2
--where������ ���ں�ȯ �Լ��� ����Ͽ� ��,�ҹ��� �񱳰� ������� �ذ�
--�Ű������� �÷��� �Ǵ� ���ڿ� ����(����) �־��� �� �ִ�.
select * from emp 
where upper(ename) = upper('scott');

--ex6_3
--LIKE �����ڿ��� UPPER���� ����ϴ� ���
select * from emp
where upper(ename) like upper('%scott%');

--ex6_4
--length�Լ��� ���ڿ����� ���� ������ ��ȯ�Ѵ�.
select ename, length(ename) from emp;

--ex6_5 - LENGTH�Լ��� WHERE������ ���
select ename, length(ename) 
from emp
where length(ename) >= 5;

--ex6_6
--length�� ���ڼ��� ��ȯ, lengthb�� ����Ʈ���� ��ȯ
--�ѱ��� 1���ڴ� 2����Ʈ
--DUAL ���̺��� SYS�� ���� �ִ� ���̺�μ� SCOTT �������ε� ��� �����ϴ�.

--DUAL�� �������̺�(�ӽ� ���̺�(dudummy_table))�μ� �����̳� ������� 
--Ȯ���ϴ� �뵵�� ���� ����Ѵ�.

--DUAL������ SELECT�� ������ �������� ǥ�õǸ�, �ش� ����� �÷����� ǥ���Ѵ�.
select length('�ѱ�'), lengthb('�ѱ�')
from dual;

--ex6_7 - substr : ���ڿ� �Ϻ� ����(���ڿ��� �ڸ���)
--Ÿ ���α׷��� ���� ���ڿ� �ε����� ���� 0������ �����ϳ�,
--ORACLE DB�� 1�� ���� �����Ѵ�.(�����Ұ�)
select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5)
from emp;

--ex6_8 
-- substr�� �ٸ� �Լ��� ���� ���
--����(-)�� ������ �������� ������ �Ѵ�. (��������-1, ����-2)
select job, substr(job, -length(job)), substr(job, -length(job), 2), substr(job, -3)
from emp;

--ex6_9 - INSTR : ���ڿ� ������ �� Ư�� ���� ��ġ ã��

--���� : INSTR - ([��� ���ڿ� ������(�ʼ�)],
--[��ġ�� ã������ �ι� ����(�ʼ�)]
--[��ġã�⸦ ������ ��� ���ڿ� ��ġ(����, �⺻�� 1)],
--[���� ��ġ���� ã������ ���ڰ� ���°������ ����(����, �⺻�� 1)]
--INSTR�� �̿Ͱ��� 4������ �Ķ���͸� ���� �Լ��̴�.

select instr('HELLO, ORACLE', 'L') as instr_1, --��ó�� ������ ��ġ, 1������ ����
instr('HELLO, ORACLE', 'L', 5) as instr_2, --5������ ã�� �����Ͽ� ��ó�� ������ ��ġ
instr('HELLO, ORACLE', 'L', 2, 2) as instr_3 --2������ ã�� �����Ͽ� 2��° ������ ��ġ
from dual;

--ex6_10 - ename�� S�� ������ ��ġ ��ȣ�� 1�̻��̹Ƿ� true�� �Ǿ� ���� �ȴ�.
select * from emp where instr(ename, 'S') > 0;

--ex6_11 - LIKE�����ڷ� S�� �����ϰ� ������ ���� ã��
select * from emp where ename like '%S%';

--ex6_12 - REPLACE : Ư�� ���ڸ� Ÿ ���ڷ� ��ü

--���� : REPLACE : [���ڿ� ������ �Ǵ� �÷���(�ʼ�)],
--[ã�� ����(�ʼ�)],
--[��ü�� ����(����)])
--���� ��ü�� ���ڰ� ������ ã�� ���ڷ� ������ ���ڵ��� ���� �ȴ�.

--DUAL���̺� ���� SELECT���� ����� ���� �������� �ǰ�,
--�÷��� ���� ǥ�õȴ�. 
select '010-1234-5678' as replace_before,
replace('010-1234-5678', '-', ' ') as replace_1, -- ~�� ' ' ���� ��ü
replace('010-1234-5678', '-') as replace_2 --��ü�� ���ڰ� ��� ã�� ���� - ����
from dual;

--ex6_13 - LPAD, RPAD : �������� �� ���� ä���

--���� : LPAD - ([���ڿ� ������(�÷�)(�ʼ�!)],
--[�������� �ڸ���(�ʼ�)],
--[������� ä�� ����(����)]

--���� : RPAD - ([���ڿ� ������(�÷�)(�ʼ�!)],
--[�������� �ڸ���(�ʼ�)],
--[������� ä�� ����(����)]

--�����Ϳ� �ڸ����� �����Ͽ� �ڸ��� ���� �����Ͱ� ������ �������� ä���.
--LPAD�� ������ RPAD�� �������� ä�� ���ڷ� ����
--(��, ä�﹮�ڰ� ���°�� �� �������� ä���.)

select 'Oracle', lpad('Oracle', 10, '#') as lpad_1, --�ڸ��� 10���� ���ڿ��� ä��� ������ �ڸ��� �������� #�� ä���.
rpad('Oracle', 10, '*') as rpad_1,--�ڸ��� 10���� ���ڿ��� ä��� ������ �ڸ��� ���������� *�� ä���.
lpad('Oracle', 10) as rpad_2, --ä�� ���ڰ� ������ �������� ä���.
rpad('Oracle', 10) as rpad_2 --ä�� ���ڰ� ������ �������� ä���.
from dual;

--ex6_14
select rpad('971225-', 14, '*') as rpad_imno,
rpad('010-1234-', 13, '*') as rpad_phone
from dual;

--ex6_15 - CONCAT : �� ���ڿ��� ��ġ��
--CONCAT(���ڿ�1(�÷�1), ���ڿ�2(�÷�2))�� �̷� ���·� �����ش�.
--CONCAT ��� ||�� ���(JAVA�� OR ǥ��, JAVA�� OR���� �ƴ�)
--select empno || ename �̷��� ����� CONCAT���� ���� ���ٰ� �Ѵ�.
select concat(empno, ename),
concat(empno, concat(' : ', ename)) --�Ķ���ͷ� �Լ� ��밡��(�Լ� ���ο����� �Լ� ��밡��)
from emp
where ename = 'FORD';

--ex6_16 - TRIM, LTRIM, RTRIM : Ư�� ���� �����
--���� : TRIM - ([�����ɼ�(����)],
--[������ ����(����)],
--FROM[���� ���ڿ� ������(�ʼ�)]
--���� ������ ������ ���ڰ� ������, ������ �����Ѵ�.
--���� �ɼ��� ����, 
--���� ������ LEADING,
--�������� TRAILING, 
--������ BOTH �� ����Ѵ�.

--TRIM(���ڿ�)�� ���� ������ �����Ѵ�.
--TRIM�� ���� ���� ������ �����Ѵ�.
--LTRIM([��� ���ڿ�(�ʼ�)], [������ ����(����)]
--RTRIM([��� ���ڿ�(�ʼ�)], [������ ����(����)]

select '[' || trim('__Oracle__') || ']' as trim,
'[' || trim(leading from ' __Oracle__ ') || ']'as trim_leading,
'[' || trim(trailing from ' __Oracle__ ') || ']'as trim_trailing,
'[' || trim(both from ' __Oracle__' ) || ']'as trim_both
from dual;

--ex6_17 - ���� �����͸� �����ϰ� ��ġ�� �����ϴ� �����Լ�
--ROUND : ������ ������ Ư�� ��ġ���� �ݿø� ���� ��ȯ�Ѵ�.
--���� : ROUND - ([����(�ʼ�)], [�ݿø� ��ġ(����)])
--�ݿø� ��ġ ������ ���ϸ� �Ҽ��� ù��° �ڸ����� �ݿø� �Ѵ�.

--TRUNC : ������ ������ Ư�� ��ġ�� ������ ���� ��ȯ�Ѵ�.
--���� : TRUNC([����(�ʼ�)],[���� ��ġ(����)])

--CEIL : ������ ���ڿ� ���� ������ ū ������ ��ȯ�Ѵ�.
--���� : CEIL(����(�ʼ�))

--FLOOR : ������ ���ڿ� ���� ����� ���� ������ ��ȯ�Ѵ�.
--���� : FLOOR(����(�ʼ�))

--MOD : ���ڸ� ���� ������ ���� ��ȯ�Ѵ�.
--���� : MOD(�и� ����, ���� ����)

--ex6_19 - ROUND
--��ġ�� ������ �Ҽ��� ù��°���� �ݿø��� ����
--0�� �Ҽ��� ù��°���� �ݿø� �Ѵ�.
--1�� �Ҽ��� 2��°���� �ݿø��� �Ѵ�. (�ݿø��� ����� ���� �ڸ�)
--2�� �Ҽ��� 3��° �ڸ����� �ݿø��� �Ѵ�.
-- -�� ���� �α����� ù��°�� ����� ù��°�� 0, �ι�° -1, ����° -2

select round(1234.5678) as round, --�Ҽ��� ù�ڸ� �ݿø� (0�� ��� ù�ڸ� ǥ��)
round(1234.5678, 0) as round_0, --�Ҽ��� ù�ڸ� �ݿø�
round(1234.5678, 1) as round_1, --�Ҽ��� ��°�ڸ� �ݿø�
round(1234.5678, 2) as round_2,
round(1234.5678, -1) as round_minus1, --��� �α��� -�� ǥ��
round(1234.5678, -2) as round_minus2
from dual;

--ex6_20 - TRUNC
select trunc(1234.5678) as trunc,
trunc(1234.5678, 0) as trunc_0,
trunc(1234.5678, 1) as trunc_1,
trunc(1234.5678, 2) as trunc_2,
trunc(1234.5678, -1) as trunc_minus1,
trunc(1234.5678, -2) as trunc_minus2
from dual;

--ex6_21 - CEIL, FLOOR
--CEIL�� ���ڰ����� ū ���� ����
--FLOOR�� ��� ���ڰ����� ���� �ִ� ����
select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
from dual;

--ex6_22 - MOD
--ex) mod(15, 6)�̶�� ���� ������ �ǹ̴� 15 / 6�� �ǹ��Ѵ�.
select mod(15, 6), mod(10, 2), mod(11, 2)
from dual;

--ex6_23 - SYSDATE �Լ��� ���� ���� �� �ð�ǥ�� �Լ�
--��¥�� ������ ������ �����ϴ�.
--��¥ - ��¥�� �����ϰ�,
--��¥ + ��¥�� �Ұ���,
--Oracle�� ��¥ ���������� DATE�� ó���Ѵ�.
select sysdate as now, --SYSDATE�Լ��� ���� ���� ��, ��, ���� ǥ���Ѵ�.
sysdate -1 as yesterday, --DATE�� ���� ������ �����ϴ�.
sysdate +1 as tomorrow
from dual;

--ex6_24 - ADD_MONTHS : �� ���� ���� ��¥
-- ADD_MONTHS([��¥������(�ʼ�), ])
select sysdate, add_months(sysdate, 3)
from dual;

--ex6_25
--�Ի����� 10��� ��� ����ϱ�
select empno, ename, hiredate,
add_months(hiredate, 120) as work10year --DATE�� ���� ������ ����
from emp;

--SYSDATE : ���� ��¥�� �ð�
--�ð����� DATE�� ǥ���Ϸ��� SQL DEVELOPER���� �����ؾ� �Ѵ�.
--SQL DEVELOPER���� �ð����� ǥ���Ϸ���
--���� �޴� ���� -> ȯ�漳�� -> �����ͺ��̽� -> NLS����
--��¥ ������ RR/MM/DD HH24:MI:SS�� �����ϸ�,
--��¥�� �ð����� ��� ��µȴ�.
select sysdate from dual;

--ex6_27 - MONTHS_BETWEEN : �� ��¥ ���� ������ ����
--MONTHS_BETWEEN(��¥1, ��¥2)
select empno, ename, hiredate, sysdate,
months_between(hiredate, sysdate) as months1, --������ �ִ� �Ǽ�
months_between(sysdate, hiredate) as months2, --��� �Ҽ����ִ� �Ǽ�
trunc(months_between(sysdate, hiredate)) as months3 -- ����� �ִ� ����
from emp;

--NEXT_DAY : ���ƿ��� ����

--NEXT_DAY (��¥������(�ʼ�), ���� ����(�ʼ�))��
--���ƿ��� ������ ��¥�� ��ȯ�Ѵ�.

--LAST_DAY : ���� ������ ��¥
--LAST_DAY(��¥ ������) - ��¥ �������� ���� ������ ���� ��ȯ

--ROUND, TRUNC  : ��¥ �ݿø�, ����

--ex6_28
select sysdate,
next_day(sysdate, '������'), --���ƿ��� ������ ��¥
last_day(sysdate) /* �� ���� ������ ��¥ */
from dual;

--ex6_31
--���ڿ� ���ڿ�(������)�� ���ϸ� ���ڰ��� �ȴ�.
--���ڿ� ������ ���ڿ��� ���ϸ� �ڵ� ����ȯ
--(AUTO CASTING)�� ����ȴ�.
--���ڿ� ���ڿ�(�������� �ƴѰ�)�� ���ϸ� ����
select empno, ename, empno + '500' --���� + ������ ���ڿ��� ���ڷ� ����Ǿ� ����ȴ�.
from emp
where ename = 'SMITH';

--ex6_32
--���� + �Ϲ� ���ڿ��� ���� ������ �ȵȴ�, ���� �߻�
select 'ABCD' + empno, empno
from emp
where ename = 'SMITH';

--ex6_33 - ��¥�� ������ ���ڿ� �������� ��ȯ
/* 
- TO_CHAR : ���� �Ǵ� ��¥ �����͸� ���� �����ͷ�
> TO_CHAR(��¥������, ��¹��ڿ� ����)
> TO_CHAR(���ڵ�����, ��� ���ڿ� ����)
> 9�� �b���� ���ڸ�(���ڸ� ��ä��, 0�� ���ڸ�)���� ä��,
>$�� $ǥ�ø� ���̰�, L�� ���� ȭ��ǥ��, .�� �Ҽ���ǥ��,
> ,�� õ���� ����

- TO_NUMBER : ���� �����͸� ���� �����ͷ�
> ������ ���ڿ��� �ڵ����� ���ڷ� ����ȯ �Ǿ� ����ȴ�.
> ����ȭ�� ������ ���ڿ��� ������ ���ڷ� ����ȯ�� ����� �ϴµ�
> �̷��� TO_NUMBER(���ڿ� ������(�ʼ�), �νĵ� ������(�ʼ�)) ��������
����Ѵ�.

- TO_DATE : ���� �����͸� ��¥ �����ͷ�
> TO_DATE(���ڿ� ������, �νĵ� ��¥(����) ����)
> ���ڿ��� ��¥�� ����� ������ ����
> �������� ����� ���ڿ��� DATE�� �����Ѵ�.
> DATE�� �� ������ �����ϴ�.
*/

select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
as ���糯¥�ð�
from dual;
--SYSDATE�� ���ڿ� 'YYYY/MM/DD HH24:MI:SS' ���·� ��ȯ�Ѵ�.

--ex6_34
select sysdate,
to_char(sysdate, 'MM') as MM, --MM�� 2�ڸ� ��
to_char(sysdate, 'MOM') as MOM, --MOM�� MONTH�� ���ڸ� �� (������ ����)
to_char(sysdate, 'MONTH') as MONTH,
to_char(sysdate, 'DD') as DD, --2�ڸ� ��¥
to_char(sysdate, 'DY') as DY, --���ڸ� ����(�ѱ�
to_char(sysdate, 'DAY') as DAY --���� ���� ���ϸ�
from dual;

--ex6_38
--���ڸ� ����ȭ�� ���ڿ��� ����
select sal, to_char(sal, '$999,999') as sal_$, --�޷� ǥ��, õ������, ���ڸ��� ��ä��
to_char(sal, 'L999,999') as sal_L, --L�� ��ȭǥ��
to_char(sal, '999,999.00') as sal_1, --�Ҽ���ǥ�� ���ڸ��� 0���� ä��
to_char(sal, '000,999,999.00') as sal_2, 
to_char(sal, '000999999.99') as sal_3,
to_char(sal, '999,999,00') as sal_4
from emp;

--ex6_41 : to_number
--������ ���ڿ��� �ƴ� ���ڿ�(���ڸ� ����ȭ�� ���ڿ��� ��ȯ)�� ���ڷ� ��ȯ
select to_number('1,300', '999,999') - to_number('1,500','999,999')
from dual;

--ex6_42 : to_date - ���ڿ��� �νĵ� ��¥ ���·� �����Ͽ� DATE�� ����
/* ������ �������� �� ���ڿ��� DATE�� ����
> DATE�� �ν��Ͽ� DATE ǥ�ù����� ��ȯ�Ѵ�.
*/
select to_date('2018-07-14', 'YYYY-MM-DD') as todate1,
to_date('20180714', 'YYYY-MM-DD') as todate2
from dual;

--ex6_43
--DATE�� DATE���� ũ�� �� ������ �����ϴ�. (���� ��¥�� ũ��)
select * from emp
where hiredate > to_date('1981/06/01', 'YYYY/MM/DD');

--ex6_45 - nvl, nvl2
/* 
- NVL : NULL�� �ƴϸ� �״��, NULL�̸� ������ ��
> NVL(NULL�˻� ������(�÷�), �˻����� NULL�Ͻ� ��ȯ�ϴ� ������)
> NVL�� NULL�� �ƴϸ� ������ ���� ��ȯ�Ѵ�.

- NVL2 : NULL�� �ƴҶ��� NULL�϶� ���� ������ ���� ��ȯ�Ѵ�.
> NVL2(NULL�˻絥����(�÷�),
�˻����� NULL�� �ƴҽ� ��ȯ�ϴ� ������, NULL�Ͻ� ��ȯ�ϴ� ������) 
>
*/
select empno, ename, sal, comm,
sal + comm,
nvl(comm, 0),
sal + nvl(comm, 0)
from emp;

--ex6_46 - NVL2
--NULL�϶��� NULL�� �ƴҶ��� ���� ������ ����
select empno, ename, comm,
nvl2(comm, 'O', 'X'),
nvl2(comm, sal * 12 + comm, sal * 12) as annsal
from emp;

--ex6_47 - DECODE
select empno, ename, job, sal,
    decode(job,
        'MANAGER', sal*1.1,
        'SALESMAN', sal*1.05,
        'ANALYST', sal,
        sal*1.03) as upsal
from emp;

--ex6_48 - CASE
--DECODE �Լ� ���
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
    ELSE SAL*1.03
END AS UPSAL --END �ڿ� ��Ī �ο�
FROM EMP;
--���ǿ� ���� ����� ���

--ex6_49
/* - ���ǿ� ���� �ƴ� �񱳿������ ���, �˻� ����� ���� 
   - �˻� ��� ������, �������� �� ����� ��� */
SELECT EMPNO, ENAME, COMM,
    CASE
        WHEN COMM IS NULL THEN '�ش���� ����'
        WHEN COMM = 0 THEN '�������'
        WHEN COMM > 0 THEN '���� : ' || COMM
    END AS COMM_TXT
FROM EMP;