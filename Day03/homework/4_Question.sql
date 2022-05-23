1) 각 학과별 학생 수를 검색하세요
SELECT COUNT(MAJOR)
    FROM STUDENT
    GROUP BY MAJOR;

2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT SNAME, AVG(AVR*4.5/4.0)
    FROM STUDENT
    WHERE MAJOR = '화학'
      OR MAJOR = '생물'
    GROUP BY SNAME,AVR;

3) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT COUNT(ORDERS)
    FROM PROFESSOR
    WHERE (TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(HIREDATE, 'YYYY')+1) >= 10
    GROUP BY ORDERS;

4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT COUNT(CNAME), SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%';

SELECT CNAME, SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%'
    GROUP BY CNAME;

5) 과목명에 화학이 포함된 과목의 학점 총합을 검색하세요
SELECT COUNT(CNAME), SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%';

SELECT CNAME, SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%'
    GROUP BY CNAME;

6) 학과별 기말고사 평균을 성적순으로 검색하세요
SELECT MAJOR, AVG(AVR) 
    FROM STUDENT
    GROUP BY MAJOR
    ORDER BY AVG(AVR) DESC;

7) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
ELECT JOB ,ROUND(AVG(SAL),2)
    FROM EMP
    WHERE DNO = 30
    GROUP BY JOB;

8) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요
SELECT SYEAR, MAX(AVR)
    FROM STUDENT
    WHERE MAJOR = '물리'
    GROUP BY SYEAR;
