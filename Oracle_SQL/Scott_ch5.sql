--ex5_1
--where절 없이 조회하면 모든 행을 출력한다.
select * from emp;

--ex5_2
--where절에 deptno가 30인 경우만 출력
select * from emp where deptno = 30;
--타 언어에선 =은 대입 연산자였으나, DB(Oracle)에선 동등비교 연산자이다.
--(예를 들어 JAVA에 ==와 같다)

--ex5_3
--다수 조건식을 사용하는 AND, OR연산자는 JAVA의 &&, ||와 사용법이 같다.
select * from emp where deptno = 30 and job = 'SALESMAN';

--ex5_4 - OR연산자 사용
select * from emp where deptno=30 or job = 'CLERK';
--sql명령어나 컬럼명, 테이블명 등은 (대, 소문자)를 안가리지만,
--컬럼 값이나 데이터 값은 (대, 소문자)를 구분한다.
--문자열(varchar2)은 ""나 " 모두 사용가능 하지만,
--''(작은따옴표)를 주로 사용한다.(JS와 동일함)

--ex5_5 - 산술 연산자
select * from emp where sal * 12 = 36000;

--ex5_6 - 비교 연산자
select * from emp where sal >= 3000;

--ex5_7 - 문자 하나를 기준으로 비교
--'F'이거나 첫글자가 G부터 시작 되는 문자열
select * from emp where ename >= 'F';

--ex5_8 - 문자 여러개를 기준으로 비교
--끝자리 Z포함 앞에 있는 이름들을 선택하여 비교
select * from emp where ename <= 'FORZ';

--ex5_9 - !=은 다름을 평가하는 연산자(3000이 아닌 값을 조회한다.)
select * from emp where sal != 3000;

--ex5_10 - != (not)을 <> (not)으로도 사용 가능
select * from emp where sal <> 3000;

--ex5_11 - != (not)을 ^= (not)으로도 사용가능
select * from emp where sal ^= 3000;

--ex5_12 - NOT : 논리 부정 연산자 (3000이 아닌것만 출력)
select * from emp where not sal = 3000;

--ex5_13 - 여러개의 OR 연산자로 조건식을 연결
-- OR나 AND연산은 결합하는 조건식의 개수 제한이 없다.
select * from emp 
where job = 'MANAGER' 
or job = 'SALESMAN'
or job = 'CLERK';

--ex5_14 - IN연산자는 IN('값1', '값2', '값3')처럼 사용한다.
--비교대상 컬럼 값이 이중 하나라도 맞으면 true,
--값 작성시 문자열은 ''안에 적어줘야 하며 꼭  대,소문자를 구분해야 한다.
select * from emp where job in ('MANAGER', 'SALESMAN', 'CLERK');

--ex5_15 - 등가비교 연산자와 AND연산자를 사용
--등가비교 연산자가 논리연산보다 우선순위가 높다.
select * from emp
where job != 'MANAGER'
and job <> 'SALESMAN'
and job ^= 'CLERK';

--ex5_16 - IN연산 결과를 논리 부정하는 NOT연산자를 사용
--결과는 ex5_15랑 동일하다.
select * from emp
where job 
not in('MANAGER', 'SALESMAN', 'CLERK');

--ex5_17 - AND연산으로 범위를 지정
select * from emp 
where sal >= 2000 
and sal <= 3000;

--ex5_18 - BETWEEN 최소 AND 최대 연산자를 사용한다.
--최소, 최대 (값) 포함
select * from emp where sal between 2000 and 3000;

--ex5_19 - 논리부정 NOT을 BETWEEN AND와 같이 사용
--BETWEEN AND false일시만 true(범위에 없을때만)
select * from emp 
where sal 
not between 2000 and 3000;

--ex5_20 - LIKE 연산자와 와일드 카드(문자열 포함 여부 연산)
select * from emp where ename like 'S%';

--ex5_21 - LIKE문 응용 : _는 글자하나 %는 길이에 상관없는 문자열
--앞에 문자가 오고 다음이 L이며 뒤에는 어느 문자열이 와도 상관없다.
select * from emp where ename like '_L%';

--ex5_22 - 어떤 문자열이 와도 상관없고 (없어도 됨)AM 어떤 문자열(없어도 됨)
--AM을 포함하는지에 대한 여부, LIKE문은 포함이 되어 있으면 true
select * from emp where ename like '%AM%';

--ex5_23 - NOT과 LIKE연산을 결합
select * from emp
where ename
not like '%AM%';

--ex5_24 - 연산(*, + 연산시와  NULL값 사용시에는 NULL)
--AND와 OR연산만 NULL이 있어도 연산을 수행한다 (true/false)
--별칭 ANNSAL을 사용(sal * 12 + comm의 별칭)
select ename, sal, sal * 12 + comm as annsal, comm from emp;

--ex5_25 - 조건식에서 동등비교로 NULL과 비교하면 결과가 안나온다.
select * from emp where comm = NULL;

--ex5_26 - NULLl과 비교할시 IS NULL연산자를 사용한다.
select * from emp where comm is null;

--ex5_27 - null이 아닌값을 비교할때는 is not null을 사용한다.
select * from emp where mgr is not null;

--ex5_28 - sal > null은 결과가 null이나 comm is null은 값에 따라 true/false가 출력
--AND는 NULL이 포함된 연산일때 false를 반환한다.
select * from emp where sal > null and comm is null;

--ex5_29 - NULL과 comm is null의 연산값에 따라, true이면 OR연산은
--true/flase이면 false가 된다.
select * from emp where sal > null or comm is null;

--ex5_30 - 집합 연산자
--두개의 select문의 결과를 합치는 합집합이며, 중복된 행은 하나만 남긴다.
--단, 두개의 select결과의 컬럼 개수와 데이터형이 순서대로 일치해야 한다.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 20;

--ex5_31
--두개의 select문의 결과를 합치는 합집합이며, 중복된 행은 하나만 남긴다.
--단, 두개의 select결과의 컬럼 개수와 데이터형이 순서대로 일치해야 한다.
--해당 쿼리에서는 컬럼 개수가 달라서 오류가 발생한다
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select empno, ename, sal
from emp
where deptno = 20;

--ex5_32
--두개의 select문의 결과를 합치는 합집합이며, 중복된 행은 하나만 남긴다.
--단, 두개의 select결과의 컬럼 개수와 데이터형이 순서대로 일치해야 한다.
--해당 쿼리에서는 컬럼의 데이터형이 불일치하므로 오류가 발생한다.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select ename, empno, deptno, sal
from emp
where deptno = 20;

--ex5_33
--두개의 select문의 결과를 합치는 합집합이며, 중복된 행은 하나만 남긴다.
--단, 두개의 select결과의 컬럼 개수와 데이터형이 순서대로 일치해야 한다.
--해당 쿼리에서는 컬럼명이 달라도 데이터형이 순서대로 일치하면 연산 가능하다.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select sal, job, deptno, sal --sal이 두번 들어가도 상관은 없다.
from emp
where deptno = 20;

--ex5_34
--두개의 select문의 결과를 합치는 합집합이며, 중복된 행은 하나만 남긴다.
--단, 두개의 select결과의 컬럼 개수와 데이터형이 순서대로 일치해야 한다.
--조건이 일치하는 경우, 중복은 제거되며 1개의 select문만 출력된다.
select empno, ename, sal, deptno 
from emp 
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 10;

--ex5_36
--두개의 select문의 차집합을 구하는 MINUS연산자
--앞의 select 결과에서 뒤의 select의 결과를 빼준 결과값이다.
--단, 두개의 select결과의 컬럼 개수와 데이터형이 순서대로 일치해야 한다.
select empno, ename, sal, deptno
from emp
minus
select empno, ename, sal, deptno
from emp
where deptno = 10;

--ex5_37
--두개의 select문의 교집합을 구하는 INTERSECT 연산자
--두개의 select 결과에서 공통된 행만 출력한다.
--단, 두개의 select결과의 컬럼 개수와 데이터형이 순서대로 일치해야 한다.
select empno, ename, sal, deptno
from emp
intersect
select empno, ename, sal, deptno
from emp
where deptno = 10;