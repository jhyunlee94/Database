1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.
SELECT ROWNUM,
       SNO,
       SNAME,
       AVR
    FROM (
            SELECT SNO, SNAME, AVR * 4.5 /4.0 AS AVR
                FROM STUDENT
                ORDER BY AVR DESC
        )
    WHERE ROWNUM <=3;

2) 기말고사 과목별 평균이 높은 3과목을 검색하세요.
SELECT ROWNUM,
        CNAME,
         AVR
    FROM (
            SELECT B.CNAME,  AVG(A.RESULT) AS AVR
            FROM SCORE A,
                 COURSE B
            WHERE A.CNO = B.CNO
            GROUP BY B.CNAME
            ORDER BY AVR DESC
        )
WHERE ROWNUM <=3;

3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)
SELECT ROWNUM,
       MAJOR,
       SYEAR,
       AVR
    FROM ( SELECT MAJOR, SYEAR, AVG(RESULT) AS AVR
        FROM STUDENT A, SCORE B
        WHERE A.SNO = B.SNO
        GROUP BY MAJOR, SYEAR
        ORDER BY AVR DESC
        )
    WHERE ROWNUM <=3;

4) 기말고사 성적이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT ROWNUM,
       PNAME, CNAME, AVR
    FROM (SELECT A.PNAME, B.CNAME, AVG(RESULT) AS AVR
        FROM PROFESSOR A, COURSE B, SCORE C
        WHERE A.PNO = B.PNO
        AND B.CNO = C.CNO
        GROUP BY A.PNAME, B.CNAME
        ORDER BY AVR DESC
    )
    WHERE ROWNUM <= 3;

5) 교수별로 현재 수강중인 학생의 수를 검색하세요.
SELECT A.PNAME, COUNT(DISTINCT C.SNO) AS AB
    FROM PROFESSOR A, COURSE B, STUDENT C, SCORE D
    WHERE A.PNO = B.PNO
    AND C.SNO = D.SNO
    AND B.CNO = D.CNO
    GROUP BY PNAME
    ORDER BY AB DESC;
    
SELECT COUNT(*) FROM STUDENT;

SELECT ROWNUM,
       PNAME,
       AB
    FROM ( SELECT A.PNAME, COUNT(DISTINCT C.SNO) AS AB
            FROM PROFESSOR A, COURSE B, STUDENT C, SCORE D
            WHERE A.PNO = B.PNO
            AND C.SNO = D.SNO
            AND B.CNO = D.CNO
            GROUP BY PNAME
            ORDER BY AB DESC
        );