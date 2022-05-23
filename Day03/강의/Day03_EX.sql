--문자 함수
SELECT * FROM DEPT;

SELECT A.DNO
     , LOWER(A.DNAME)
    FROM DEPT A;

--소문자로 erp 부서가 있는 지역을 출력
SELECT A.DNO
     , LOWER(A.DNAME)
     , A.LOC
    FROM DEPT A
    WHERE LOWER(A.DNAME) = 'erp';
    
--DUAL 테이블의 사용
--SYSDATE : 현재 시스템의 날짜
SELECT SYSDATE
    FROM DUAL;
    
SELECT CONCAT('고', '기천')
    FROM DUAL;
    
--문자열 연산 함수
--CONCAT
--CONCAT 함수를 이용하여 부서명과 지역을 하나의 컬럼으로 출력
--CONCAT은 인자를 두 개까지만 설정 가능하기 때문에 ||(문자열 병합 연산자)보다 활용도가 떨어짐
SELECT CONCAT(DNAME, LOC)
    FROM DEPT;
    
SELECT CONCAT(DNAME, ' ' || LOC)
    FROM DEPT;
    
--LENGTH, LENGTHB
--부서명, 부서명의 문자열 길이, 부서명의 문자열 바이트 크기 출력
SELECT DNAME
     , LENGTH(DNAME)
     , LENGTHB(DNAME)
    FROM DEPT;
    
SELECT ENAME
     , LENGTHB(ENAME)
    FROM EMP;

--현재 오라클에서 사용중인 문자셋
--AL32UTF8 : 한글 3바이트씩 계산
SELECT *
    FROM NLS_DATABASE_PARAMETERS
    WHERE PARAMETER = 'NLS_CHARACTERSET'
       OR PARAMETER = 'NLS_NCHAR_CHARACTERSET';

--SUBSTR
SELECT ENAME
     , SUBSTR(ENAME, 2) --두번째 글자부터 출력
     , SUBSTR(ENAME, -2) --뒤에서 두번째 글자부터 출력
     , SUBSTR(ENAME, 1, 2) --첫번째 글자부터 2개 글자 출력
     , SUBSTR(ENAME, -2, 2) --뒤에서 두번째 글자부터 2개 글자 출력
    FROM EMP;

--INSTR
SELECT INSTR('DATABASE', 'A') --첫번째 A의 위치 반환
     , INSTR('DATABASE', 'A', 3) --세번째 글자(T)이후에 첫번째 A의 위치 반환
     , INSTR('DATABASE', 'A', 1, 3) --첫번째 글자(D) 이후에 세번째 A의 위치 반환
    FROM DUAL;

--TRIM
SELECT TRIM('조' FROM '조병조') --앞뒤의 조 제거
     , TRIM(LEADING '조' FROM '조병조') --앞의 조 제거(접두어 제거)
     , TRIM(TRAILING '조' FROM '조병조') --뒤의 조 제거(접미어 제거)
     , TRIM(' 조병조 ') --공백 제거
    FROM DUAL;
    
--LPAD, RPAD
--LPAD, RPAD : 한글 2바이트로 인식
SELECT RPAD(ENAME, 10, '*') --사원명 뒤에 *을 10자리까지 붙여서 출력
     , LPAD(SAL, 10, '*') --연봉 앞에 *을 10자리까지 붙여서 출력
    FROM EMP;
    
--SUBSTR과 LENGTH 함수를 사용해서 사원명의 마지막 글자 제거 후 출력
SELECT SUBSTR(ENAME, 1, LENGTH(ENAME) - 1)
    FROM EMP;
    
--문자 치환 함수
--TRANSLATE, REPLACE
SELECT TRANSLATE('World of Warcraft', 'Wo', '--') --문자단위로 치환되기 때문에 모든 W, o가 치환
     , REPLACE('World of Warcraft', 'Wo', '--') --문자열 단위로 치환되기 때문에 Wo가 붙어있는 문자열만 치환
    FROM DUAL;
    
--숫자 함수
--ROUND
SELECT ROUND(12.3456, 3) --소수점 3자리까지 반올림하여 반환
    FROM DUAL;

--TRUNC
SELECT TRUNC(12.3456, 3) --소수점 3자리미만 버림하여 반환
    FROM DUAL;
    
--MOD
SELECT MOD(10, 4) --10을 4로 나눈 나머지 값 반환
    FROM DUAL;
    
--POWER
SELECT POWER(3, 3) --3의 3승 값 반환
    FROM DUAL;
    
--CEIL
SELECT CEIL(2.59) --2.59 보다 큰 제일 작은 정수 3 반환
    FROM DUAL;
    
--FLOOR
SELECT FLOOR(2.59) --2.59 보다 작은 제일 큰 정수 2 반환
    FROM DUAL;
    
--ABS
SELECT ABS(-10) -- -10의 절대 값 10 반환
    FROM DUAL;
    
--SQRT
SELECT SQRT(9) -- 9의 제곱근 값 3 반환
    FROM DUAL;

--SIGN
SELECT SIGN(-10) -- 피연산자가 -10이기때문에 -1 반환
    FROM DUAL;
    
--날짜 형식 변경
SELECT SYSDATE FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

--날짜 연산
SELECT SYSDATE
     , HDATE
     , TRUNC(SYSDATE) - TRUNC(HDATE) + 1 AS 근무일 --TRUNC(날짜) : 시간부터 짜른 날짜(년/월/일) 반환
     , HDATE + 100 AS "100일"
     , HDATE + 365 AS "1년"
    FROM EMP;
    
--날짜 함수
--ROUND
SELECT ROUND(SYSDATE, 'MM')
    FROM DUAL;
    
--TRUNC
--날짜 형식 미지정시 년/월/일 반환 시분초 0으로 초기화된 상태
SELECT TRUNC(SYSDATE)
    FROM DUAL;

--날짜에서 년도만(YYYY)의 형태로 반환 월, 일 1로 초기화, 시분초는 0으로 초기화
SELECT TRUNC(SYSDATE, 'YYYY')
    FROM DUAL;
    
SELECT TRUNC(SYSDATE, 'MM')
    FROM DUAL;
    
--MONTHS_BETWEEN
SELECT MONTHS_BETWEEN('2022/01/01', '2022/05/01')
    FROM DUAL;
    
--ADD_MONTHS
SELECT ADD_MONTHS('2022/05/01', 23)
    FROM DUAL;
    
--NEXT_DAY
SELECT NEXT_DAY('2022/05/23', '일요일')
    FROM DUAL;
    
--LAST_DAY
SELECT LAST_DAY('2021/02/01')
    FROM DUAL;
    
--사원들의 입사일과 입사 후 100일 날짜, ADD_MONTHS함수를 사용해서 10년뒤 날짜 출력
SELECT HDATE
     , HDATE + 100
     , ADD_MONTHS(HDATE, 120)
    FROM EMP;
    
--변환 함수
--숫자를 문자열로 치환 TO_CHAR
SELECT TO_CHAR(1000000000, '999,999,999') -- 9자리 숫자까지 출력하되 3자리마다 쉼표 표출
    FROM DUAL;
    
SELECT TO_CHAR(1000000, '099,999,999') -- 9자리 숫자까지 출력하되 3자리마다 쉼표 표출하고 앞 자리에 0붙여서 출력
    FROM DUAL;
    
SELECT TO_CHAR(10000000, '999,999,999,999,999')
    FROM DUAL;
    
--날짜 형식 변환
--TO_CHAR의 날짜형식 지정
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY/MM/DD AM HH:MI:SS') --오전/오후 선택시 AM이나 PM 한가지만 지정해도 됨
     , TO_CHAR(SYSDATE, '"오늘은 "YYYY"년 "MM"월 "DD"일 입니다."') -- 형식안 문자열 추가시 ""사용
    FROM DUAL;

--TO_DATE의 날짜형식 지정
SELECT TO_DATE('20211231124521', 'YYYY/MM/DD HH24:MI:SS')
    FROM DUAL;
    
--TO_DATE 함수를 사용하여 입사일 '19920201'보다 빠른 사원번호, 사원이름, 입사일 조회
SELECT ENO
     , ENAME
     , HDATE
    FROM EMP
    WHERE HDATE < TO_DATE('19920201', 'YYYY/MM/DD');
    
--그룹 함수
--학년 별 평균 평점 조회
SELECT SYEAR
     , AVG(AVR)
    FROM STUDENT
    GROUP BY SYEAR;
    
--학과별 학년 별 평균 평점 조회
SELECT MAJOR
     , SYEAR
     , AVG(AVR)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    ORDER BY MAJOR, SYEAR;
    
--부서별 최저 연봉 조회(MIN 함수 이용)
SELECT DNO
     , MIN(SAL)
    FROM EMP
    GROUP BY DNO;
    
--부서별 최저 연봉 조회 부서이름추가
SELECT A.DNO
     , B.DNAME
     , MIN(A.SAL)
    FROM EMP A
       , DEPT B
    WHERE A.DNO = B.DNO
    GROUP BY A.DNO, B.DNAME
    ORDER BY A.DNO;
    
--부서별 최저 연봉 조회 부서이름추가, 해당 연봉을 받는 사원의 번호, 이름 출력
SELECT C.ENO
     , C.ENAME
     , D.SAL
     , D.DNO
     , D.DNAME
    FROM EMP C
       , (
            SELECT A.DNO
                 , B.DNAME
                 , MIN(A.SAL) AS SAL
                FROM EMP A
                   , DEPT B
                WHERE A.DNO = B.DNO
                GROUP BY A.DNO, B.DNAME
          ) D
    WHERE C.SAL = D.SAL
    ORDER BY DNO, ENO;
    
--HAVING 구문
--평균 연봉이 3000이하인 부서 조회
SELECT DNO
     , AVG(SAL)
    FROM EMP
    GROUP BY DNO
    HAVING AVG(SAL) < 3000;
    
--부서별 인원수 조회(업무가 개발인 사원 제외)
SELECT DNO
     , COUNT(*)
    FROM EMP
    WHERE JOB != '개발'
    GROUP BY DNO;
    
--부서 중 평균연봉이 가장 높은 부서의 번호와 평균 연봉 조회
--평균 연봉이 최고
SELECT MAX(AVG(SAL))
    FROM EMP
    GROUP BY DNO;
    
SELECT DNO
     , AVG(SAL)
    FROM EMP
    GROUP BY DNO
    HAVING AVG(SAL) = (
                            SELECT MAX(AVG(SAL))
                                FROM EMP
                                GROUP BY DNO
                       );
                       
--INSERT INTO
INSERT INTO EMP (
    ENO,
    ENAME
) VALUES (
    '9999',
    '고기천',
    'AAAA'
);

--UPDATE
--화충교수를 정교수로 수정
UPDATE PROFESSOR
    SET ORDERS = '부교수',
        SECTION = '물리'
    WHERE PNAME = '화충';
    
COMMIT;

SELECT * FROM PROFESSOR
WHERE PNAME = '화충';

--DELETE
DELETE FROM DEPT
WHERE DNO = '50';

SELECT * FROM DEPT
ORDER BY DNO;

COMMIT;
ROLLBACK;

--실수로 지운 데이터 복구 쿼리
--타임스탬프 이용
--최대 3시간(180분)
 SELECT * 
   FROM DEPT AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '10' MINUTE)    
  WHERE DNO = '50';
  
INSERT INTO DEPT VALUES (
    '50',
    'POS',
    '강릉',
    NULL
);

COMMIT;

SELECT * FROM DEPT
ORDER BY DNO;

--DNO이 01인 부서의 연봉을 10%인상된 값으로 수정
SELECT SAL FROM EMP
WHERE DNO = '10';

UPDATE EMP
    SET SAL = SAL * 1.1
    WHERE DNO = '10';

COMMIT;