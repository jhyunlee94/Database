1) 학생의 학점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW VIEW_STUDENT_INFO(
    SNO, SNAME, AVR
) AS (
        SELECT SNO, SNAME, AVR * 4.5 / 4.0
        FROM STUDENT
);

2) 각 과목별 평균 점수를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW VIEW_STUDENT_AVG_RESULT_INFO(
    CNO, CNAME, RESULT 
)AS (SELECT A.CNO, A.CNAME, AVG(RESULT) AS RESULT
    FROM COURSE A,
         SCORE B
    WHERE A.CNO = B.CNO
    GROUP BY A.CNO, A.CNAME
);

SELECT * FROM VIEW_STUDENT_AVG_RESULT_INFO;

3) 각 사원과 관리자의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW VIEW_EMP_ENAME_MGR_INFO(
    ENO, ENAME, MGR, MGRNAME
) AS (
    SELECT A.ENO, A.ENAME, A.MGR,B.ENAME
    FROM EMP A,
         EMP B
    WHERE B.ENO = A.MGR);
    
SELECT * FROM VIEW_EMP_ENAME_MGR_INFO;

4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW STUDENT_INFO(
    SNO, SNAME, CNAME, RESULT, GRADE
) AS (SELECT A.SNO, A.SNAME, B.CNAME, C.RESULT, D.GRADE
    FROM STUDENT A,
         COURSE B,
         SCORE C,
         SCGRADE D
    WHERE A.SNO = C.SNO
     AND B.CNO = C.CNO
     AND C.RESULT BETWEEN LOSCORE AND HISCORE
);

select * from student_info;

5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
CREATE OR REPLACE VIEW VIEW_PROFESSOR_STUDENT (
    PNAME, CNAME, SNO,SNAME
) AS (
        SELECT A.PNAME, B.CNAME, C.SNO, C.SNAME
            FROM PROFESSOR A,
                 COURSE B,
                 STUDENT C,
                 SCORE D
            WHERE B.PNO= A.PNO
            AND C.SNO = D.SNO
            AND B.CNO = D.CNO
            AND SECTION = '물리'
);
SELECT * FROM VIEW_PROFESSOR_STUDENT;