--1)student 테이블 구조를 검색해라
DESC STUDENT;

--2)course 테이블 구조를 검색해라
DESC COURSE;

--3)professor 테이블 구조를 검색해라
DESC PROFESSOR;

--4)score 테이블 구조를 검색해라
DESC SCORE;

--5) 모든 학생의 정보를 검색해라
SELECT * 
    FROM STUDENT;

--7) 모든 과목의 정보를 검색해라
SELECT * 
    FROM COURSE;

--8) 기말고사 시험점수를 검색해라
SELECT * 
    FROM SCORE;

--9) 학생들의 학과와 학년을 검색해라
SELECT SNO 학번,
       SNAME 이름,
       MAJOR 학과,
       SYEAR 학년 
    FROM STUDENT;

--10) 각 과목의 이름과 학점을 검색해라
SELECT CNAME 과목명,
       ST_NUM 학점
    FROM COURSE;

--11) 모든 교수의 직위를 검색해라
SELECT ORDERS 직위
    FROM PROFESSOR;