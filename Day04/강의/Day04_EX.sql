--서브쿼리를 이용한 INSERT INTO
--테스트 테이블 생성
CREATE TABLE EMP2(
    ENO VARCHAR2(10),
    ENAME VARCHAR2(20)
);

SELECT * FROM EMP2;

--여러개 행 입력
INSERT INTO EMP2 (
    ENO,
    ENAME
)
SELECT ENO
     , ENAME
    FROM EMP;

COMMIT;

--ENO, ENAME, SAL 정보를 갖는 EMP3 테이블을 생성하고
--EMP 테이블의 ENO, ENAME 그리고 10프로 인상된 SAL을 저장
DROP TABLE EMP3;

CREATE TABLE EMP3 (
    ENO VARCHAR2(10),
    ENAME VARCHAR2(20),
    SAL NUMBER
);

INSERT INTO EMP3 (
    ENO,
    ENAME,
    SAL
)
SELECT ENO
     , ENAME
     , NVL(SAL, 0) * 1.1
    FROM EMP;

SELECT * FROM EMP3;

--서브쿼리를 이용한 UPDATE 구문
SELECT * FROM EMP2;

--ENO = 9999인 데이터의
--ENO을 김연아의 ENO으로
--ENAME을 ENO이 0001인 ENAME으로 변경
UPDATE EMP2
    SET ENO = (SELECT ENO
                  FROM EMP
                  WHERE ENAME = '김연아'),
        ENAME = (SELECT ENAME
                    FROM EMP
                    WHERE ENO = '0001')
    WHERE ENO = '9999';
    
--EMP3 ENO = 9999인 데이터의
--ENO을 아이유의 ENO
--ENAME ENO 3004인 ENAME
--SAL은 제갈민의 SAL로 변경
UPDATE EMP3
    SET ENO = (SELECT ENO
                  FROM EMP
                  WHERE ENAME = '아이유'),
        ENAME = (SELECT ENAME
                    FROM EMP
                    WHERE ENO = '3004'),
        SAL = (SELECT SAL
                    FROM EMP
                    WHERE ENAME = '제갈민')
    WHERE ENO = '9999';
    
SELECT * FROM EMP3;

--트랜잭션과 락(LOCK)
DELETE FROM DEPT;

SELECT * FROM DEPT;

SELECT * FROM EMP;

UPDATE DEPT
    SET DNO = '99'
    WHERE DNO = '10';
    
ROLLBACK;

--테이블 생성과 데이터 타입
--BOARD 테이블 생성
--NO NUMBER
--NAME VARCHAR2(50)
--SUB VARCAHR2(100)
--CONTENT VARCHAR2(4000)
--HDATE DATE DEFAULT SYSDATE
CREATE TABLE BOARD(
    NO NUMBER,
    NAME VARCHAR2(50),
    SUB VARCHAR2(100),
    CONTENT VARCHAR2(4000),
    HDATE DATE DEFAULT SYSDATE
);

--현재 접속한 유저의 테이블 확인
SELECT * FROM USER_TABLES;

SELECT * FROM USER_TABLES
WHERE TABLE_NAME = 'BOARD';

DESC BOARD;

--NO만 입력해도
--HDATE의 DEFAULT 값을 SYSDATE로 정해줘서
--HDATE도 데이터가 입력됨
INSERT INTO BOARD (
    NO
) VALUES (
    1
);

SELECT * FROM BOARD;

--CHAR와 VARCHAR2 차이
CREATE TABLE TEST(
    NAME1 CHAR(4),
    NAME2 VARCHAR2(4)
);

INSERT INTO TEST VALUES (
    'AA',
    'AA'
);

COMMIT;

SELECT * FROM TEST;

SELECT LENGTHB(NAME1)
     , LENGTHB(NAME2)
    FROM TEST;
    
SELECT * FROM EMP;

--PK(Primary Key)
DROP TABLE EMP;

CREATE TABLE EMP(
    ENO VARCHAR2(4) PRIMARY KEY,
    ENAME VARCHAR2(20),
    JOB VARCHAR2(20),
    MGR VARCHAR2(4),
    SAL NUMBER,
    COMM NUMBER,
    HDATE DATE
);

DESC EMP;

INSERT INTO EMP (
    ENO,
    ENAME
) VALUES (
    '0002',
    '고기천'
);

SELECT * FROM EMP;
SELECT * FROM DEPT;

--PK, FK
DROP TABLE DEPT;
DROP TABLE EMP;

CREATE TABLE DEPT (
    DNO VARCHAR2(2),
    DNAME VARCHAR2(20),
    LOC VARCHAR2(20),
    DIRECTOR VARCHAR2(4),
    CONSTRAINT DEPT_DNO_PK/*PK이름 지정*/ PRIMARY KEY(DNO)
);

DROP TABLE EMP;

CREATE TABLE EMP (
    eno varchar2(4),
    ename varchar2(20),
    job varchar2(20),
    mgr varchar2(4),
    hdate date,
    sal number(5),
    comm number(4),
    dno varchar2(2),
    CONSTRAINT EMP_ENO_PK PRIMARY KEY(ENO),
    CONSTRAINT EMP_MGR_FK FOREIGN KEY(MGR) REFERENCES EMP(ENO),
    CONSTRAINT EMP_DNO_FK FOREIGN KEY(DNO) REFERENCES DEPT(DNO)
);

--제약조건 조회
SELECT A.TABLE_NAME
     , A.CONSTRAINT_NAME
     , A.CONSTRAINT_TYPE
     , B.COLUMN_NAME
    FROM USER_CONSTRAINTS A
       , USER_CONS_COLUMNS B
    WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
      AND A.TABLE_NAME IN ('DEPT', 'EMP')
    ORDER BY A.TABLE_NAME;
    
--테이블 종속관계 확인
SELECT A.TABLE_NAME AS 상위테이블
     , A.CONSTRAINT_NAME AS 상위제약조건
     , B.TABLE_NAME AS 하위테이블
     , B.CONSTRAINT_NAME AS 참조제약조건
    FROM USER_CONSTRAINTS A
       , USER_CONSTRAINTS B
    WHERE B.R_CONSTRAINT_NAME = A.CONSTRAINT_NAME
      AND A.TABLE_NAME IN ('DEPT', 'EMP')
    ORDER BY A.TABLE_NAME;

--제약조건 확인
INSERT INTO DEPT (
    DNO,
    DNAME,
    LOC
) VALUES (
    '10',
    '지원',
    '부산'
);

COMMIT;

INSERT INTO EMP (
    ENO,
    ENAME,
    DNO
) VALUES (
    '9998',
    '조병조',
    '20'
);

DROP TABLE BOARD;
--BOARD 테이블 생성
--NO NUMBER PK
--NAME VARCHAR2(50)
--SUB VARCHAR2(200)
--B_CONTENT 테이블 생성
--NO NUMBER PK FK
--CONTENT VARCHAR2(1000)
CREATE TABLE BOARD (
    NO NUMBER,
    NAME VARCHAR2(50),
    SUB VARCHAR2(200),
    CONSTRAINT BOARD_NO_PK PRIMARY KEY(NO)
);

CREATE TABLE B_CONTENT (
    NO NUMBER,
    CONTENT VARCHAR2(1000),
    CONSTRAINT B_CONTENT_NO_FK FOREIGN KEY(NO)
                                REFERENCES BOARD(NO)
);

INSERT INTO BOARD (
    NO
) VALUES (
    1
);

INSERT INTO B_CONTENT (
    NO,
    CONTENT
) VALUES (
    1,
    'DDD'
);

--다중 PK
--B_FILE
--NO NUMBER FK PK
--FILE_NO NUMBER PK
--FILE_NAME VARCHAR2(100)
DROP TABLE B_FILE;

CREATE TABLE B_FILE (
    NO NUMBER,
    FILE_NO NUMBER,
    FILE_NAME VARCHAR2(100),
    CONSTRAINT B_FILE_PK PRIMARY KEY(NO, FILE_NO),
    CONSTRAINT B_FILE_NO_FK FOREIGN KEY(NO) REFERENCES BOARD(NO)
);

INSERT INTO BOARD (
    NO
) VALUES (
    10
);

SELECT * FROM BOARD;

/*NO   FILE_NO
   1      1
   1      2
   1      3
   1      4
   2      1
   2      2
   2      3
*/
INSERT INTO B_FILE (
    NO,
    FILE_NO
) VALUES (
    3,
    2
);

SELECT * FROM B_FILE;

--UK, NOT NULL, CHECK
--EMP4
-- ENO VARCHAR2(4) PK
-- ENAME VARCHAR2(20) NOT NULL
-- GNO VARCHAR2(13) UK
-- SAL NUMBER CHECK 1000 <= SAL <= 5000
CREATE TABLE EMP4 (
    ENO VARCHAR2(4),
    ENAME VARCHAR2(20) NOT NULL,
    GNO VARCHAR2(13),
    SAL NUMBER,
    CONSTRAINT EMP4_ENO_PK PRIMARY KEY(ENO),
    CONSTRAINT EMP4_GNO_UK UNIQUE(GNO),
    CONSTRAINT EMP4_SAL_CK CHECK(SAL BETWEEN 1000 AND 5000)
);

INSERT INTO EMP4 (
    ENO,
    ENAME,
    GNO,
    SAL
) VALUES (
    '0002',
    '조병조',
    NULL,
    900
);

--제약조건 관리
CREATE TABLE CLASS (
    CNO VARCHAR2(2),
    CNAME VARCHAR2(50)
);

CREATE TABLE ST (
    SNO VARCHAR2(2),
    SNAME VARCHAR2(50),
    CNO VARCHAR2(2)
);

--CLASS 테이블에 PK추가
ALTER TABLE CLASS
    ADD CONSTRAINT CLASS_CNO_PK PRIMARY KEY(CNO);

--CLASS 테이블에 UK추가
ALTER TABLE CLASS
    ADD CONSTRAINT CLASS_CNAME_UK UNIQUE(CNAME);
    
--ST 테이블에 PK추가
ALTER TABLE ST
    ADD CONSTRAINT ST_SNO_PK PRIMARY KEY(SNO);

--CLASS 데이터 추가
INSERT INTO CLASS VALUES (
    '01',
    '자바반'
);
INSERT INTO CLASS VALUES (
    '02',
    'AI반'
);

--ST 데이터 추가
INSERT INTO ST VALUES (
    '01',
    '고기천',
    '01'
);
INSERT INTO ST VALUES (
    '02',
    '조병조',
    '02'
);
INSERT INTO ST VALUES (
    '03',
    '홍길동',
    '03'
);

UPDATE ST
    SET CNO = '02'
    WHERE CNO = '03';

--ST 테이블에 FK 추가
ALTER TABLE ST
    ADD CONSTRAINT ST_CNO_FK FOREIGN KEY(CNO) REFERENCES CLASS(CNO);
    
--ST 테이블 PK 삭제
ALTER TABLE ST
    DROP CONSTRAINT ST_SNO_PK;
    
--CLASS 테이블 PK 삭제(CNO)
ALTER TABLE CLASS
    DROP CONSTRAINT CLASS_CNO_PK CASCADE;
    
--컬럼의 추가, 삭제, 수정
DROP TABLE TEST;

CREATE TABLE TSET (
    NO NUMBER
);

--컬럼추가
ALTER TABLE TEST
    ADD NAME VARCHAR2(20);
    
DESC TEST;

--컬럼 데이터타입 변경
ALTER TABLE TEST
    MODIFY NAME CHAR(20);

--컬럼명 변경
ALTER TABLE TEST
    RENAME COLUMN NAME TO TNAME;
    
--컬럼 삭제
ALTER TABLE TEST
    DROP COLUMN TNAME;
    
--서브쿼리를 이용한 테이블 생성
--부서정보와 사원정보를 합친 E_DEPT 테이블을 생성한다.
CREATE TABLE E_DEPT
AS (
        SELECT A.ENO
             , A.ENAME
             , A.DNO
             , B.DNAME
            FROM EMP A
               , DEPT B
            WHERE A.DNO = B.DNO
);

SELECT * FROM E_DEPT;
DROP TABLE E_DEPT;

--부서번호, 부서명, 부서별 평균급여를 저장하는 D_SAL 테이블생성
CREATE TABLE D_SAL
AS (
        SELECT A.DNO
             , B.DNAME
             , AVG(A.SAL) AS SAL
            FROM EMP A
               , DEPT B
            WHERE A.DNO = B.DNO
            GROUP BY A.DNO, B.DNAME
    );

SELECT * FROM D_SAL;