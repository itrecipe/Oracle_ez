--TIP : Oracle_SQL은 대소문자 구분 안한다

--ex4_1 - emp 테이블의 구조를 조회
desc emp;

--ex4_2 - dept 테이블의 구조를 조회
DESC DEPT;

--ex4_3 - salgrade 테이블의 구조를 조회
desc salgrade;

--ex4_4 - emp테이블의 전체 조회
select * from emp;

--ex4_5 - select문 뒤에 조회할 (부분) 컬럼만 적어서 조회하기
select empno, ename, deptno from emp;

--ex4_6 - distinct로 열 중복 제거(열이 1개일 경우)
select distinct deptno from emp;

--ex4_7 - distinct로 열 중복제거(열이 여러개인 경우)
select distinct job, deptno from emp;

--ex4_8 - all로 중복되는 열 제거 없이 그대로 출력하기
select all job, deptno from emp;

--ex4_9 - 연산식에 별칭을 부여하기(별칭 미사용)
select ename, sal, sal * 12 + comm, comm from emp;

--ex4_11 - 연산식에 별칭을 부여하기 (별칭 사용)
select ename, sal, sal * 12 + comm as annsal, comm from emp;

--ex4_12 - 급여 기준(원하는 기준)으로 정렬하기
--sal을 기준으로 오름차순(ASC)으로 정렬한다.
select * from emp order by sal;

--ex4_13 - 급여 기준으로 정렬하기
--sal을 기준으로 내림차순(DESC)를 한다.
select * from emp order by sal desc;

--ex4_14 - 두개 컬럼을 기준으로 정렬
select * from emp order by deptno asc, sal desc;
--Order by는 select문으로 선택 후 이 결과를 정렬하며 가능하면,
--속도 문제가 있으니 사용을 자제한다.(그냥 이런게 있다는 정도만 알자)
--select /* + index_desc(emp sal); */ <- 이런 방식을 사용하길 권고함
--(스프링에서 제대로 사용해볼 예정)