--ex6_1
--UPPER(문자열)은 전부 대문자로 변환,
--LOWER(문자열)은 전부 소문자로 변환,
--INITCAP(문자열)은 첫글자만 대문자로 변환
--select절의 항목은 컬럼명, 연산식, 함수도 온다.
select ename,
upper(ename),
lower(ename), 
initcap(ename)
from emp;

--ex6_2
--where절에서 문자변환 함수를 사용하여 대,소문자 비교가 어려움을 해결
--매개변수는 컬럼명 또는 문자열 값을(직접) 넣어줄 수 있다.
select * from emp 
where upper(ename) = upper('scott');

--ex6_3
--LIKE 연산자에서 UPPER등을 사용하는 방법
select * from emp
where upper(ename) like upper('%scott%');

--ex6_4
--length함수는 문자열에서 문자 개수를 반환한다.
select ename, length(ename) from emp;

--ex6_5
--LENGTH함수를 WHERE절에서 사용
select ename, length(ename) 
from emp
where length(ename) >= 5;

--ex6_6
--length는 문자수를 반환, lengthb는 바이트수를 반환
--한글은 1문자당 2바이트
--DUAL 테이블은 SYS가 갖고 있는 테이블로서 SCOTT 계정으로도 사용 가능하다.

--DUAL은 가상테이블(임시 테이블(dudummy_table))로서 연산이나 결과값을 
--확인하는 용도로 많이 사용한다.
select length('한글'), lengthb('한글')
from dual;