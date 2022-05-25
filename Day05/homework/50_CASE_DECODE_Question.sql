1) 다음과 같이 다음 년도 인상 급여를 검색하세요. (CASE, DECODE 구문 두 가지로 모두 표현)
     급여          인상폭
   1000 이하   ->   15%
   1001~2000   ->   10%
   2001~3000   ->   5%
   3001~4000   ->   2%
   4000 초과   ->   동결

SELECT ENO,
        ENAME,
        JOB,
        CASE WHEN SAL < 1000 THEN SAL * 1.15
             WHEN SAL BETWEEN 1001 AND 2000 THEN SAL * 1.10
             WHEN SAL BETWEEN 2001 AND 3000 THEN SAL * 1.05
             WHEN SAL BETWEEN 3001 AND 4000 THEN SAL * 1.02
             WHEN SAL >4000 THEN SAL
        END AS SAL
    FROM EMP;

  
2) 학생들의 평균 학점을 검색하되 성이 사마인 학생의 평균 학점은 4.5점으로 환산하여 검색하세요.(DECODE 구문 이용)

SELECT SNAME,
        CASE WHEN SNAME LIKE '사마%' THEN AVR * 4.5 / 4.0
            ELSE AVR
        END AS AVR
    FROM STUDENT;