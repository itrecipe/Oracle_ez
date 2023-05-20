--TIP : Oracle_SQL�� ��ҹ��� ���� ���Ѵ�

--ex4_1 - emp ���̺��� ������ ��ȸ
desc emp;

--ex4_2 - dept ���̺��� ������ ��ȸ
DESC DEPT;

--ex4_3 - salgrade ���̺��� ������ ��ȸ
desc salgrade;

--ex4_4 - emp���̺��� ��ü ��ȸ
select * from emp;

--ex4_5 - select�� �ڿ� ��ȸ�� (�κ�) �÷��� ��� ��ȸ�ϱ�
select empno, ename, deptno from emp;

--ex4_6 - distinct�� �� �ߺ� ����(���� 1���� ���)
select distinct deptno from emp;

--ex4_7 - distinct�� �� �ߺ�����(���� �������� ���)
select distinct job, deptno from emp;

--ex4_8 - all�� �ߺ��Ǵ� �� ���� ���� �״�� ����ϱ�
select all job, deptno from emp;

--ex4_9 - ����Ŀ� ��Ī�� �ο��ϱ�(��Ī �̻��)
select ename, sal, sal * 12 + comm, comm from emp;

--ex4_11 - ����Ŀ� ��Ī�� �ο��ϱ� (��Ī ���)
select ename, sal, sal * 12 + comm as annsal, comm from emp;

--ex4_12 - �޿� ����(���ϴ� ����)���� �����ϱ�
--sal�� �������� ��������(ASC)���� �����Ѵ�.
select * from emp order by sal;

--ex4_13 - �޿� �������� �����ϱ�
--sal�� �������� ��������(DESC)�� �Ѵ�.
select * from emp order by sal desc;

--ex4_14 - �ΰ� �÷��� �������� ����
select * from emp order by deptno asc, sal desc;
--Order by�� select������ ���� �� �� ����� �����ϸ� �����ϸ�,
--�ӵ� ������ ������ ����� �����Ѵ�.(�׳� �̷��� �ִٴ� ������ ����)
--select /* + index_desc(emp sal); */ <- �̷� ����� ����ϱ� �ǰ���
--(���������� ����� ����غ� ����)