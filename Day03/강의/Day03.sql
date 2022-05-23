1. 단일 행 함수
    - 오라클에서는 SQL 쿼리문을 효율적으로 만드는 데 도움이 되기위한
      함수들을 제공한다.
    - 단일 행 함수의 종류
      문자 함수
      숫자 함수
      날짜 함수
      변환 함수
      일반 함수
    - 단일 행 함수는 SELECT, WHERE, HAVING 구문 어디든 사용가능
    - 단일 행 함수의 결과 값은 입력 값마다 하나씩 반환
2. 문자 함수 
    - LOWER : 문자열을 영문자 소문자로 반환
    - UPPER : 문자열을 영문자 대문자로 반환
    - INITCAP : 문자열의 첫 글자만 대문자로 나머지는 소문자로 반환
    - 함수명(컬럼명)
3. 문자 연산 함수
    - CONCAT : 문자열 병합하여 반환
               CONCAT(문자열1, 문자열2)
    - SUBSTR : 문자열 잘라서 반환
               SUBSTR(문자열, 시작위치, 출력문자 개수)
    - LENGTH : 문자열의 길이 반환
               LENGTH(문자열)
    - LENGTHB : 문자열의 바이트 크기 반환
                LENGTHB(문자열)
    - INSTR : 지정된 문자의 위치 반환
              INSTR(문자열, 지정문자)
    - TRIM : 접두어나 접미사 잘라서 반환
             TRIM(leading | trailing | both FROM 문자열)
             TRIM(문자열) : 공백 제거
    - LPAD : 지정된 문자열의 길이만큼 빈부분을 앞에서부터 문자채워서 반환
             LPAD(문자열, 길이, 채울문자)
             ex) LPAD('20000', 10, '*') -> *****20000
    - RPAD : 지정된 문자열의 길이만큼 빈부분을 뒤에서부터 문자채워서 반환
             RPAD(문자열, 길이, 채울문자)
             ex) RPAD('20000', 10, '*') -> 20000*****
6. DUAL 테이블
    - 오라클에서 제공하는 기본 테이블
    - 현재날짜, 간단한 연산의 결과값을 출력할 때 사용
    - DUAL 테이블의 소유는 SYS계정이지만 모든 USER에서 사용 가능
7. 문자 치환 함수
    - TRANSLATE : 문자단위로 치환된 값 반환
                  TRANSLATE(문자열, 치환될 문자, 치환할 문자)
                  ex) TRANSLATE('ORACLE', 'A', '#') -> 'OR#CLE'
    - REPLACE : 문자열 단위로 치환된 값 반환
                REPLACE(문자열, 치환될 문자열, 치환할 문자열)
                ex) REPLACE('ORACLE', 'OR', '##') -> '##ALCE'
8. 숫자 함수
    - ROUND : 반올림 값 반환
              ROUND(m, n) : n자리까지 반올림
    - TRUNC : 버림 값 반환
              TRUNC(m, n) : n자리 미만 버림
    - MOD : 나머지 값 반환
            MOD(m, n) : m을 n으로 나눈 나머지 값
    - POWER : 승 계산 값 반환
              POWER(m, n) : m의 n승 값
    - CEIL : 피연산자보다 큰 제일 작은 정수 반환
             CEIL(m) : m보다 큰 제일 작은 정수 반환
    - FLOOR : 피연산자보다 작은 제일 큰 정수 반환
              FLOOR(m) : m보다 작은 제일 큰 정수 반환
    - ABS : 절대 값 반환
            ABS(m) : m의 절대 값
    - SQRT : 제곱근 값 반환
             SQRT(m) : m의 제곱근 값
    - SIGN : 피연산자 음수면 -1, 양수면 1, 0이면 0 반환
             SIGN(m) : m의 부호에 따라 -1, 0, 1 값중 하나 반환
9. 날짜 데이터 연산
    - 오라클에서 DATE(날짜형식) 타입은 6바이트로 계산
    - DATE(날짜형식) 타입은 'YYYY/MM/DD HH24:MI:SS'까지의 형식 갖고있음
    - 날짜의 출력형식 변경
      ALTER SESSION SET NLS_DATE_FORMAT = '출력할 날짜 형식 지정'
      ALTER SESSION : 현재 오라클에 연결된 세션 정보 변경
      NLS_DATE_FORMAT : 날짜 출력 형식
10. 날짜 연산
    - 날짜 + 숫자 : 숫자 일 이후의 날짜 반환
                    ex) SYSDATE + 100 : 100일 이후의 날짜
    - 날짜 - 숫자 : 숫자 일 이전의 날짜 반환