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

--ex6_5
--LENGTH�Լ��� WHERE������ ���
select ename, length(ename) 
from emp
where length(ename) >= 5;

--ex6_6
--length�� ���ڼ��� ��ȯ, lengthb�� ����Ʈ���� ��ȯ
--�ѱ��� 1���ڴ� 2����Ʈ
--DUAL ���̺��� SYS�� ���� �ִ� ���̺�μ� SCOTT �������ε� ��� �����ϴ�.

--DUAL�� �������̺�(�ӽ� ���̺�(dudummy_table))�μ� �����̳� ������� 
--Ȯ���ϴ� �뵵�� ���� ����Ѵ�.
select length('�ѱ�'), lengthb('�ѱ�')
from dual;