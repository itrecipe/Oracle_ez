--ex5_1
--where�� ���� ��ȸ�ϸ� ��� ���� ����Ѵ�.
select * from emp;

--ex5_2
--where���� deptno�� 30�� ��츸 ���
select * from emp where deptno = 30;
--Ÿ ���� =�� ���� �����ڿ�����, DB(Oracle)���� ����� �������̴�.
--(���� ��� JAVA�� ==�� ����)

--ex5_3
--�ټ� ���ǽ��� ����ϴ� AND, OR�����ڴ� JAVA�� &&, ||�� ������ ����.
select * from emp where deptno = 30 and job = 'SALESMAN';

--ex5_4 - OR������ ���
select * from emp where deptno=30 or job = 'CLERK';
--sql��ɾ �÷���, ���̺�� ���� (��, �ҹ���)�� �Ȱ�������,
--�÷� ���̳� ������ ���� (��, �ҹ���)�� �����Ѵ�.
--���ڿ�(varchar2)�� ""�� " ��� ��밡�� ������,
--''(��������ǥ)�� �ַ� ����Ѵ�.(JS�� ������)

--ex5_5 - ��� ������
select * from emp where sal * 12 = 36000;

--ex5_6 - �� ������
select * from emp where sal >= 3000;

--ex5_7 - ���� �ϳ��� �������� ��
--'F'�̰ų� ù���ڰ� G���� ���� �Ǵ� ���ڿ�
select * from emp where ename >= 'F';

--ex5_8 - ���� �������� �������� ��
--���ڸ� Z���� �տ� �ִ� �̸����� �����Ͽ� ��
select * from emp where ename <= 'FORZ';

--ex5_9 - !=�� �ٸ��� ���ϴ� ������(3000�� �ƴ� ���� ��ȸ�Ѵ�.)
select * from emp where sal != 3000;

--ex5_10 - != (not)�� <> (not)���ε� ��� ����
select * from emp where sal <> 3000;

--ex5_11 - != (not)�� ^= (not)���ε� ��밡��
select * from emp where sal ^= 3000;

--ex5_12 - NOT : �� ���� ������ (3000�� �ƴѰ͸� ���)
select * from emp where not sal = 3000;

--ex5_13 - �������� OR �����ڷ� ���ǽ��� ����
-- OR�� AND������ �����ϴ� ���ǽ��� ���� ������ ����.
select * from emp 
where job = 'MANAGER' 
or job = 'SALESMAN'
or job = 'CLERK';

--ex5_14 - IN�����ڴ� IN('��1', '��2', '��3')ó�� ����Ѵ�.
--�񱳴�� �÷� ���� ���� �ϳ��� ������ true,
--�� �ۼ��� ���ڿ��� ''�ȿ� ������� �ϸ� ��  ��,�ҹ��ڸ� �����ؾ� �Ѵ�.
select * from emp where job in ('MANAGER', 'SALESMAN', 'CLERK');

--ex5_15 - ��� �����ڿ� AND�����ڸ� ���
--��� �����ڰ� �����꺸�� �켱������ ����.
select * from emp
where job != 'MANAGER'
and job <> 'SALESMAN'
and job ^= 'CLERK';

--ex5_16 - IN���� ����� �� �����ϴ� NOT�����ڸ� ���
--����� ex5_15�� �����ϴ�.
select * from emp
where job 
not in('MANAGER', 'SALESMAN', 'CLERK');

--ex5_17 - AND�������� ������ ����
select * from emp 
where sal >= 2000 
and sal <= 3000;

--ex5_18 - BETWEEN �ּ� AND �ִ� �����ڸ� ����Ѵ�.
--�ּ�, �ִ� (��) ����
select * from emp where sal between 2000 and 3000;

--ex5_19 - ������ NOT�� BETWEEN AND�� ���� ���
--BETWEEN AND false�Ͻø� true(������ ��������)
select * from emp 
where sal 
not between 2000 and 3000;

--ex5_20 - LIKE �����ڿ� ���ϵ� ī��(���ڿ� ���� ���� ����)
select * from emp where ename like 'S%';

--ex5_21 - LIKE�� ���� : _�� �����ϳ� %�� ���̿� ������� ���ڿ�
--�տ� ���ڰ� ���� ������ L�̸� �ڿ��� ��� ���ڿ��� �͵� �������.
select * from emp where ename like '_L%';

--ex5_22 - � ���ڿ��� �͵� ������� (��� ��)AM � ���ڿ�(��� ��)
--AM�� �����ϴ����� ���� ����, LIKE���� ������ �Ǿ� ������ true
select * from emp where ename like '%AM%';

--ex5_23 - NOT�� LIKE������ ����
select * from emp
where ename
not like '%AM%';

--ex5_24 - ����(*, + ����ÿ�  NULL�� ���ÿ��� NULL)
--AND�� OR���길 NULL�� �־ ������ �����Ѵ� (true/false)
--��Ī ANNSAL�� ���(sal * 12 + comm�� ��Ī)
select ename, sal, sal * 12 + comm as annsal, comm from emp;

--ex5_25 - ���ǽĿ��� ����񱳷� NULL�� ���ϸ� ����� �ȳ��´�.
select * from emp where comm = NULL;

--ex5_26 - NULLl�� ���ҽ� IS NULL�����ڸ� ����Ѵ�.
select * from emp where comm is null;

--ex5_27 - null�� �ƴѰ��� ���Ҷ��� is not null�� ����Ѵ�.
select * from emp where mgr is not null;

--ex5_28 - sal > null�� ����� null�̳� comm is null�� ���� ���� true/false�� ���
--AND�� NULL�� ���Ե� �����϶� false�� ��ȯ�Ѵ�.
select * from emp where sal > null and comm is null;

--ex5_29 - NULL�� comm is null�� ���갪�� ����, true�̸� OR������
--true/flase�̸� false�� �ȴ�.
select * from emp where sal > null or comm is null;

--ex5_30 - ���� ������
--�ΰ��� select���� ����� ��ġ�� �������̸�, �ߺ��� ���� �ϳ��� �����.
--��, �ΰ��� select����� �÷� ������ ���������� ������� ��ġ�ؾ� �Ѵ�.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 20;

--ex5_31
--�ΰ��� select���� ����� ��ġ�� �������̸�, �ߺ��� ���� �ϳ��� �����.
--��, �ΰ��� select����� �÷� ������ ���������� ������� ��ġ�ؾ� �Ѵ�.
--�ش� ���������� �÷� ������ �޶� ������ �߻��Ѵ�
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select empno, ename, sal
from emp
where deptno = 20;

--ex5_32
--�ΰ��� select���� ����� ��ġ�� �������̸�, �ߺ��� ���� �ϳ��� �����.
--��, �ΰ��� select����� �÷� ������ ���������� ������� ��ġ�ؾ� �Ѵ�.
--�ش� ���������� �÷��� ���������� ����ġ�ϹǷ� ������ �߻��Ѵ�.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select ename, empno, deptno, sal
from emp
where deptno = 20;

--ex5_33
--�ΰ��� select���� ����� ��ġ�� �������̸�, �ߺ��� ���� �ϳ��� �����.
--��, �ΰ��� select����� �÷� ������ ���������� ������� ��ġ�ؾ� �Ѵ�.
--�ش� ���������� �÷����� �޶� ���������� ������� ��ġ�ϸ� ���� �����ϴ�.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select sal, job, deptno, sal --sal�� �ι� ���� ����� ����.
from emp
where deptno = 20;

--ex5_34
--�ΰ��� select���� ����� ��ġ�� �������̸�, �ߺ��� ���� �ϳ��� �����.
--��, �ΰ��� select����� �÷� ������ ���������� ������� ��ġ�ؾ� �Ѵ�.
--������ ��ġ�ϴ� ���, �ߺ��� ���ŵǸ� 1���� select���� ��µȴ�.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 10;

--ex5_36
--�ΰ��� select���� �������� ���ϴ� MINUS������
--���� select ������� ���� select�� ����� ���� ������̴�.
--��, �ΰ��� select����� �÷� ������ ���������� ������� ��ġ�ؾ� �Ѵ�.
select empno, ename, sal, deptno
from emp
minus
select empno, ename, sal, deptno
from emp
where deptno = 10;

--ex5_37
--�ΰ��� select���� �������� ���ϴ� INTERSECT ������
--�ΰ��� select ������� ����� �ุ ����Ѵ�.
--��, �ΰ��� select����� �÷� ������ ���������� ������� ��ġ�ؾ� �Ѵ�.
select empno, ename, sal, deptno
from emp
intersect
select empno, ename, sal, deptno
from emp
where deptno = 10;