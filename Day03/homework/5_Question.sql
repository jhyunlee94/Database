1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT MAJOR, AVG(AVR)
    FROM STUDENT
    WHERE MAJOR != '화학'
    GROUP BY MAJOR;

2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT MAJOR, AVG(AVR)
    FROM STUDENT
    WHERE MAJOR != '화학'
    GROUP BY MAJOR
    HAVING AVG(AVR) > 2.0;

3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT SNO, AVG(RESULT)
    FROM SCORE
    GROUP BY SNO
    HAVING AVG(RESULT) >= 60;

4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
    
SELECT P.PNAME , C.CNAME, C.ST_NUM
    FROM PROFESSOR P,
         COURSE C
    WHERE P.PNO = C.PNO
      AND C.ST_NUM >= 3;


5) 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요
SELECT CNAME, PNAME, RESULT
    FROM PROFESSOR P, SCORE S, COURSE C
    WHERE P.PNO = C.PNO
      AND C.CNO = S.CNO
    GROUP BY CNAME, PNAME,RESULT
    HAVING RESULT > 
                    (SELECT MAX(RESULT)
                        FROM COURSE C, SCORE S
                        WHERE C.CNO = S.CNO
                        AND CNAME='핵화학');

SELECT CNAME, PNAME, RESULT
    FROM PROFESSOR P, SCORE S, COURSE C
    WHERE P.PNO = C.PNO
      AND C.CNO = S.CNO
    GROUP BY CNAME, PNAME,RESULT
    HAVING RESULT > 
                    (SELECT AVG(RESULT)
                        FROM COURSE C, SCORE S
                        WHERE C.CNO = S.CNO
                        AND CNAME='핵화학');
--5번 질문,,

6) 근무 중인 직원이 4명 이상인 부서를 검색하세요
SELECT COUNT(E.DNO), E.DNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE E.DNO = D.DNO
    GROUP BY E.DNO, D.DNAME
    HAVING COUNT(E.DNO) >= 4;

7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT AVG(SAL), JOB
    FROM EMP
    GROUP BY JOB
    HAVING AVG(SAL) >= 3000;

SELECT JOB,ROUND(AVG(SAL))
    FROM EMP
    GROUP BY JOB
    HAVING AVG(SAL) >= 3000;

8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT MAJOR, SYEAR, COUNT(SNO)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    HAVING COUNT(SNO) >= 5;
