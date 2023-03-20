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

--ex6_5 - LENGTH함수를 WHERE절에서 사용
select ename, length(ename) 
from emp
where length(ename) >= 5;

--ex6_6
--length는 문자수를 반환, lengthb는 바이트수를 반환
--한글은 1문자당 2바이트
--DUAL 테이블은 SYS가 갖고 있는 테이블로서 SCOTT 계정으로도 사용 가능하다.

--DUAL은 가상테이블(임시 테이블(dudummy_table))로서 연산이나 결과값을 
--확인하는 용도로 많이 사용한다.

--DUAL에서는 SELECT의 문장이 제목으로 표시되며, 해당 결과는 컬럼으로 표시한다.
select length('한글'), lengthb('한글')
from dual;

--ex6_7 - substr : 문자열 일부 추출(문자열을 자른다)
--타 프로그래밍 언어에선 문자열 인덱스가 보통 0번부터 시작하나,
--ORACLE DB는 1번 부터 시작한다.(주의할것)
select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5)
from emp;

--ex6_8 
-- substr과 다른 함수와 같이 사용
--음수(-)가 붙으면 역순으로 연산을 한다. (마지막이-1, 앞이-2)
select job, substr(job, -length(job)), substr(job, -length(job), 2), substr(job, -3)
from emp;

--ex6_9 - INSTR : 문자열 데이터 내 특정 문자 위치 찾기

--사용법 : INSTR - ([대상 문자열 데이터(필수)],
--[위치를 찾으려는 부문 문자(필수)]
--[위치찾기를 시작할 대상 문자열 위치(선택, 기본은 1)],
--[시작 위치에서 찾으려는 문자가 몇번째인지를 지정(선택, 기본은 1)]
--INSTR은 이와같이 4가지의 파라미터를 갖는 함수이다.

select instr('HELLO, ORACLE', 'L') as instr_1, --맨처음 나오는 위치, 1번부터 시작
instr('HELLO, ORACLE', 'L', 5) as instr_2, --5번부터 찾기 시작하여 맨처음 나오는 위치
instr('HELLO, ORACLE', 'L', 2, 2) as instr_3 --2번부터 찾기 시작하여 2번째 나오는 위치
from dual;

--ex6_10 - ename에 S가 있으면 위치 번호가 1이상이므로 true가 되어 선택 된다.
select * from emp where instr(ename, 'S') > 0;

--ex6_11 - LIKE연산자로 S로 시작하고 끝나는 문자 찾기
select * from emp where ename like '%S%';

--ex6_12 - REPLACE : 특정 문자를 타 문자로 대체

--사용법 : REPLACE : [문자열 데이터 또는 컬럼명(필수)],
--[찾는 문자(필수)],
--[대체할 문자(선택)])
--만일 대체할 문자가 없으면 찾는 문자로 지정한 문자들은 삭제 된다.

--DUAL테이블 사용시 SELECT에서 사용한 값이 제목줄이 되고,
--컬럼엔 값이 표시된다. 
select '010-1234-5678' as replace_before,
replace('010-1234-5678', '-', ' ') as replace_1, -- ~을 ' ' 으로 대체
replace('010-1234-5678', '-') as replace_2 --대체할 문자가 없어서 찾는 문자 - 삭제
from dual;

--ex6_13 - LPAD, RPAD : 데이터의 빈 공간 채우기

--사용법 : LPAD - ([문자열 데이터(컬럼)(필수!)],
--[데이터의 자릿수(필수)],
--[빈공간에 채울 문자(선택)]

--사용법 : RPAD - ([문자열 데이터(컬럼)(필수!)],
--[데이터의 자릿수(필수)],
--[빈공간에 채울 문자(선택)]

--데이터와 자릿수를 지정하여 자릿수 보다 데이터가 적으면 나머지를 채운다.
--LPAD는 왼쪽을 RPAD는 오른쪽을 채울 문자로 지정
--(단, 채울문자가 없는경우 빈 공간으로 채운다.)

select 'Oracle', lpad('Oracle', 10, '#') as lpad_1, --자릿수 10개에 문자열을 채우고 나머지 자리는 왼쪽으로 #을 채운다.
rpad('Oracle', 10, '*') as rpad_1,--자릿수 10개에 문자열을 채우고 나머지 자리는 오른쪽으로 *을 채운다.
lpad('Oracle', 10) as rpad_2, --채울 문자가 없을시 공백으로 채운다.
rpad('Oracle', 10) as rpad_2 --채울 문자가 없을시 공백으로 채운다.
from dual;

--ex6_14
select rpad('971225-', 14, '*') as rpad_imno,
rpad('010-1234-', 13, '*') as rpad_phone
from dual;

--ex6_15 - CONCAT : 두 문자열을 합치기
--CONCAT(문자열1(컬럼1), 문자열2(컬럼2))은 이런 형태로 합쳐준다.
--CONCAT 대신 ||를 사용(JAVA의 OR 표시, JAVA의 OR조건 아님)
--select empno || ename 이러한 방식을 CONCAT보다 많이 쓴다고 한다.
select concat(empno, ename),
concat(empno, concat(' : ', ename)) --파라미터로 함수 사용가능(함수 내부에서도 함수 사용가능)
from emp
where ename = 'FORD';

--ex6_16 - TRIM, LTRIM, RTRIM : 특정 문자 지우기
--사용법 : TRIM - ([삭제옵션(선택)],
--[삭제할 문자(선택)],
--FROM[원본 문자열 데이터(필수)]
--선택 사항인 삭제할 문자가 없으면, 공백을 제거한다.
--삭제 옵션은 왼쪽, 
--글자 지우기는 LEADING,
--오른쪽은 TRAILING, 
--양쪽은 BOTH 를 사용한다.

--TRIM(문자열)은 양쪽 공백을 제거한다.
--TRIM만 사용시 양쪽 공백을 제거한다.
--LTRIM([대상 문자열(필수)], [삭제할 문자(선택)]
--RTRIM([대상 문자열(필수)], [삭제할 문자(선택)]

select '[' || trim('__Oracle__') || ']' as trim,
'[' || trim(leading from ' __Oracle__ ') || ']'as trim_leading,
'[' || trim(trailing from ' __Oracle__ ') || ']'as trim_trailing,
'[' || trim(both from ' __Oracle__' ) || ']'as trim_both
from dual;

--ex6_17 - 숫자 데이터를 연산하고 수치를 조정하는 숫자함수
--ROUND : 지정된 숫자의 특정 위치에서 반올림 값을 반환한다.
--사용법 : ROUND - ([숫자(필수)], [반올림 위치(선택)])
--반올림 위치 지정을 안하면 소수점 첫번째 자리에서 반올림 한다.

--TRUNC : 지정된 숫자의 특정 위치에 버림한 값을 반환한다.
--사용법 : TRUNC([숫자(필수)],[버림 위치(선택)])

--CEIL : 지정된 숫자와 가장 가까은 큰 정수를 반환한다.
--사용법 : CEIL(숫자(필수))

--FLOOR : 지정된 숫자와 가장 가까운 작은 정수를 반환한다.
--사용법 : FLOOR(숫자(필수))

--MOD : 숫자를 나눈 나머지 값을 반환한다.
--사용법 : MOD(분모 숫자, 분자 숫자)

--ex6_19 - ROUND
--위치가 없으면 소수점 첫번째에서 반올림을 수행
--0은 소수점 첫번째에서 반올림 한다.
--1은 소수점 2번째에서 반올림을 한다. (반올림된 결과가 보일 자리)
--2는 소수점 3번째 자리에서 반올림을 한다.
-- -는 정수 부근으로 첫번째는 양수부 첫번째가 0, 두번째 -1, 세번째 -2

select round(1234.5678) as round, --소수점 첫자리 반올림 (0은 양수 첫자리 표시)
round(1234.5678, 0) as round_0, --소수점 첫자리 반올림
round(1234.5678, 1) as round_1, --소수점 둘째자리 반올림
round(1234.5678, 2) as round_2,
round(1234.5678, -1) as round_minus1, --양수 부근은 -로 표시
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
--CEIL은 숫자값보다 큰 최저 정수
--FLOOR은 대상 숫자값보다 작은 최대 정수
select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
from dual;

--ex6_22 - MOD
--ex) mod(15, 6)이라고 적은 문장의 의미는 15 / 6을 의미한다.
select mod(15, 6), mod(10, 2), mod(11, 2)
from dual;

--ex6_23 - SYSDATE 함수는 현재 일자 및 시간표시 함수
--날짜와 숫자의 연산은 가능하다.
--날짜 - 날짜도 가능하고,
--날짜 + 날짜는 불가능,
--Oracle의 날짜 데이터형은 DATE로 처리한다.
select sysdate as now, --SYSDATE함수는 현재 일자 년, 월, 일을 표시한다.
sysdate -1 as yesterday, --DATE와 숫자 연산은 가능하다.
sysdate +1 as tomorrow
from dual;

--ex6_24 - ADD_MONTHS : 몇 개월 이후 날짜
-- ADD_MONTHS([날짜데이터(필수), ])
select sysdate, add_months(sysdate, 3)
from dual;

--ex6_25
--입사한지 10년된 사람 출력하기
select empno, ename, hiredate,
add_months(hiredate, 120) as work10year --DATE와 숫자 연산은 가능
from emp;

--SYSDATE : 현재 날짜와 시간
--시간까지 DATE로 표시하려면 SQL DEVELOPER에서 설정해야 한다.
--SQL DEVELOPER에서 시간까지 표시하려면
--도구 메뉴 선택 -> 환경설정 -> 데이터베이스 -> NLS선택
--날짜 형식을 RR/MM/DD HH24:MI:SS로 변경하면,
--날짜와 시간까지 모두 출력된다.
select sysdate from dual;

--ex6_27 - MONTHS_BETWEEN : 두 날짜 간의 개월수 차이
--MONTHS_BETWEEN(날짜1, 날짜2)
select empno, ename, hiredate, sysdate,
months_between(hiredate, sysdate) as months1, --음수만 있는 실수
months_between(sysdate, hiredate) as months2, --양수 소수점있는 실수
trunc(months_between(sysdate, hiredate)) as months3 -- 양수만 있는 정수
from emp;

--NEXT_DAY : 돌아오는 요일

--NEXT_DAY (날짜데이터(필수), 요일 문자(필수))는
--돌아오는 요일의 날짜를 반환한다.

--LAST_DAY : 달의 마지막 날짜
--LAST_DAY(날짜 데이터) - 날짜 데이터의 달의 마지막 날을 반환

--ROUND, TRUNC  : 날짜 반올림, 버림

--ex6_28
select sysdate,
next_day(sysdate, '월요일'), --돌아오는 월요일 날짜
last_day(sysdate) /* 이 달의 마지막 날짜 */
from dual;

--ex6_31
--숫자에 문자열(숫자형)을 더하면 숫자값이 된다.
--숫자에 숫자형 문자열을 더하면 자동 형변환
--(AUTO CASTING)이 수행된다.
--숫자에 문자열(숫자형이 아닌것)을 더하면 에러
select empno, ename, empno + '500' --숫자 + 숫자형 문자열은 숫자로 변경되어 연산된다.
from emp
where ename = 'SMITH';

--ex6_32
--숫자 + 일반 문자열은 연산 수행이 안된다, 에러 발생
select 'ABCD' + empno, empno
from emp
where ename = 'SMITH';

--ex6_33 - 날짜를 지정한 문자열 형식으로 변환
/* 
- TO_CHAR : 숫자 또는 날짜 데이터를 문자 데이터로
> TO_CHAR(날짜데이터, 출력문자열 형식)
> TO_CHAR(숫자데이터, 출력 문자열 형식)
> 9는 쉇자의 한자리(빈자리 안채움, 0은 빈자리)으로 채움,
>$는 $표시를 붙이고, L은 지역 화폐표시, .는 소수점표시,
> ,는 천단위 구분

- TO_NUMBER : 문자 데이터를 숫자 데이터로
> 숫자형 문자열은 자동으로 숫자로 형변환 되어 연산된다.
> 형식화된 숫자형 문자열은 강제로 숫자로 형변환을 해줘야 하는데
> 이럴땐 TO_NUMBER(문자열 데이터(필수), 인식될 숫자형(필수)) 형식으로
사용한다.

- TO_DATE : 문자 데이터를 날짜 데이터로
> TO_DATE(문자열 데이터, 인식될 날짜(포맷) 형태)
> 문자열을 날짜로 변경시 변경할 포맷
> 포멧으로 변경된 문자열을 DATE로 변경한다.
> DATE간 비교 연산은 가능하다.
*/

select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
as 현재날짜시간
from dual;
--SYSDATE를 문자열 'YYYY/MM/DD HH24:MI:SS' 형태로 변환한다.

--ex6_34
select sysdate,
to_char(sysdate, 'MM') as MM, --MM은 2자리 일
to_char(sysdate, 'MOM') as MOM, --MOM과 MONTH는 한자리 일 (월문자 포함)
to_char(sysdate, 'MONTH') as MONTH,
to_char(sysdate, 'DD') as DD, --2자리 날짜
to_char(sysdate, 'DY') as DY, --한자리 요일(한글
to_char(sysdate, 'DAY') as DAY --요일 붙은 요일명
from dual;

--ex6_38
--숫자를 형식화된 문자열로 변경
select sal, to_char(sal, '$999,999') as sal_$, --달러 표시, 천원단위, 빈자리는 안채움
to_char(sal, 'L999,999') as sal_L, --L은 원화표시
to_char(sal, '999,999.00') as sal_1, --소수점표시 빈자리는 0으로 채움
to_char(sal, '000,999,999.00') as sal_2, 
to_char(sal, '000999999.99') as sal_3,
to_char(sal, '999,999,00') as sal_4
from emp;

--ex6_41 : to_number
--숫자형 문자열이 아닌 문자열(숫자를 형식화된 문자열로 변환)을 숫자로 변환
select to_number('1,300', '999,999') - to_number('1,500','999,999')
from dual;

--ex6_42 : to_date - 문자열을 인식될 날짜 형태로 변경하여 DATE로 변경
/* 지정된 형식으로 된 문자열을 DATE로 변경
> DATE는 인식하여 DATE 표시법으로 반환한다.
*/
select to_date('2018-07-14', 'YYYY-MM-DD') as todate1,
to_date('20180714', 'YYYY-MM-DD') as todate2
from dual;

--ex6_43
--DATE와 DATE간의 크기 비교 연산은 가능하다. (늦은 날짜가 크다)
select * from emp
where hiredate > to_date('1981/06/01', 'YYYY/MM/DD');

--ex6_45 - nvl, nvl2
/* 
- NVL : NULL이 아니면 그대로, NULL이면 지정한 값
> NVL(NULL검사 데이터(컬럼), 검사결과가 NULL일시 반환하는 데이터)
> NVL이 NULL이 아니면 원래의 값을 반환한다.

- NVL2 : NULL이 아닐때와 NULL일때 각각 지정한 값을 반환한다.
> NVL2(NULL검사데이터(컬럼),
검사결과가 NULL이 아닐시 반환하는 데이터, NULL일시 반환하는 데이터) 
>
*/
select empno, ename, sal, comm,
sal + comm,
nvl(comm, 0),
sal + nvl(comm, 0)
from emp;

--ex6_46 - NVL2
--NULL일때와 NULL이 아닐때의 값을 별도로 지정
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
--DECODE 함수 방식
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
    ELSE SAL*1.03
END AS UPSAL --END 뒤에 별칭 부여
FROM EMP;
--조건에 값을 사용한 경우

--ex6_49
/* - 조건에 값이 아닌 비교연산식을 사용, 검사 대상값이 없음 
   - 검사 대상 미지정, 기존값을 비교 연산시 사용 */
SELECT EMPNO, ENAME, COMM,
    CASE
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '수당없음'
        WHEN COMM > 0 THEN '수당 : ' || COMM
    END AS COMM_TXT
FROM EMP;