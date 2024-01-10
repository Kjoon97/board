CREATE TABLE KJH_BOARD (
  ID NUMBER PRIMARY KEY,
  TITLE VARCHAR2(100) NOT NULL,
  PASSWD VARCHAR2(500) NOT NULL,
  SALT VARCHAR2(500) NOT NULL,
  CONTENT CLOB,
  USERID VARCHAR2(30),
  VIEWCOUNT NUMBER DEFAULT 0,
  REGDATE DATE,
  UPDATEDATE DATE,
  DELETEDATE DATE,
  IS_DELETED NUMBER DEFAULT 0 CHECK (IS_DELETED IN (0, 1))
);

COMMENT ON COLUMN KJH_BOARD.ID IS 'id';
COMMENT ON COLUMN KJH_BOARD.TITLE IS '제목';
COMMENT ON COLUMN KJH_BOARD.PASSWD IS '비밀 번호';
COMMENT ON COLUMN KJH_BOARD.SALT IS 'salt 값';
COMMENT ON COLUMN KJH_BOARD.CONTENT IS '내용';
COMMENT ON COLUMN KJH_BOARD.USERID IS '등록자 계정';
COMMENT ON COLUMN KJH_BOARD.VIEWCOUNT IS '조회 수';
COMMENT ON COLUMN KJH_BOARD.REGDATE IS '등록 날짜';
COMMENT ON COLUMN KJH_BOARD.UPDATEDATE IS '수정 날짜';
COMMENT ON COLUMN KJH_BOARD.DELETEDATE IS '삭제 예정 날짜';
COMMENT ON COLUMN KJH_BOARD.IS_DELETED IS '삭제 여부';

SELECT *
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'KJH_BOARD';
 
 
------------------------시퀀스 --------------------------
DROP SEQUENCE SEQ_BOARD;

CREATE SEQUENCE SEQ_BOARD
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

SELECT * FROM ALL_SEQUENCES 
WHERE SEQUENCE_NAME = 'SEQ_BOARD';

---------------------------------------------------------------

DROP TABLE KJH_BOARD;

DESC KJH_BOARD;


UPDATE KJH_BOARD 
SET VIEWCOUNT = VIEWCOUNT + 1 WHERE ID = 35;


SELECT * FROM ALL_TRIGGERS 
WHERE TRIGGER_NAME = 'BOARD_TRIGGER';


SELECT * FROM USER_TRIGGERS 
WHERE TRIGGER_NAME = 'BOARD_TRIGGER';


INSERT INTO KJH_BOARD (ID, TITLE, CONTENT, USERID, UPDATEDATE, REGDATE)
VALUES (SEQ_BOARD.NEXTVAL, 'Sample Title', 'This is a sample content.', 'John Doe', SYSDATE, SYSDATE);

SELECT * FROM USER_TAB_PRIVS WHERE PRIVILEGE = 'TRIGGER';


DELETE FROM KJH_BOARD 
WHERE TO_CHAR(UPDATEDATE, 'YYYY-MM-DD') = '2023-11-14';





UPDATE KJH_BOARD 
SET TITLE = 10, CONTENT = 10, WRITER = 10, REGDATE = SYSDATE WHERE ID = 22;



SELECT * FROM KJH_Board      
ORDER BY id ASC
ALTER TABLE KJH_BOARD MODIFY TITLE VARCHAR2(200);


SELECT * FROM KJH_BOARD 
WHERE TO_CHAR(UPDATEDATE, 'YYYY-MM-DD') = '2023-11-14';



SELECT ROWNUM, ID, TITLE, CONTENT, PASSWD, SALT, USERID, VIEWCOUNT, REGDATE, UPDATEDATE, DELETEDATE, IS_DELETED 
FROM KJH_BOARD 
ORDER BY REGDATE DESC;


UPDATE KJH_BOARD 
SET IS_DELETED = 1, UPDATEDATE = SYSDATE WHERE TO_CHAR(DELETEDATE, 'YYYY-MM-DD') = '2023-11-16';



------------------------------------패키지-------------------------------------------

---게시물 패키지 선언---
CREATE OR REPLACE PACKAGE BOARD_PACKAGE AS
  TYPE BoardCursor IS REF CURSOR;
  
  --게시물 조회 프로시저--
  PROCEDURE GET_BOARD(p_id IN NUMBER,p_result OUT BoardCursor);
  --게시물 삭제 프로시저--
  PROCEDURE DELETE_BOARD(input_date IN DATE);
  
END BOARD_PACKAGE;




---게시물 패키지 구현---
CREATE OR REPLACE PACKAGE BODY BOARD_PACKAGE AS

  ---게시물 조회 프로시저---
  PROCEDURE GET_BOARD(p_id IN NUMBER,p_result OUT BoardCursor) IS 
  BEGIN
    OPEN p_result FOR
     SELECT id, title, content, regDate, updateDate, deleteDate, viewCount
     FROM KJH_BOARD
     WHERE ID = p_id AND IS_DELETED = 0;
  END GET_BOARD;
  
  ---게시물 삭제 프로시저---
  PROCEDURE DELETE_BOARD IS
  BEGIN
    UPDATE KJH_BOARD
    SET IS_DELETED = 1, UPDATEDATE = SYSDATE
    WHERE TRUNC(DELETEDATE) = TRUNC(SYSDATE);
  END DELETE_BOARD;
  
END BOARD_PACKAGE;




--- 패키지 호출(게시물 조회)---
DECLARE
  v_board_cursor BOARD_PACKAGE.BoardCursor;
  v_board KJH_BOARD%ROWTYPE;
BEGIN
  BOARD_PACKAGE.GET_BOARD(20, v_board_cursor); 
  FETCH v_board_cursor INTO v_board;
  DBMS_OUTPUT.PUT_LINE('게시글 ID: ' || v_board.ID || ', 제목: ' || v_board.TITLE || ', 등록자: ' || v_board.USERID);
END;



--- 패키지 호출(게시물 삭제)---
DECLARE
  v_delete_date DATE := TRUNC(SYSDATE); 
BEGIN
  BOARD_PACKAGE.DELETE_BOARD(v_delete_date); 
  COMMIT; 
END;




-- DBMS_OUTPUT.PUT_LINE을 출력하기 위해 사용---
SET SERVEROUTPUT ON;




---패키지 삭제---
DROP PACKAGE BOARD_PACKAGE;


---패키지 조회---
SELECT * FROM ALL_OBJECTS 
WHERE OBJECT_TYPE = 'PACKAGE' AND OBJECT_NAME = 'BOARD_PACKAGE';




---스케줄 생성 권한 부여---
GRANT CREATE ANY JOB TO LTFREE;


---스케줄러 작업 생성(매일 오전 11시 실행)---
BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    JOB_NAME        => 'DELETE_BOARD_JOB',
    JOB_TYPE        => 'PLSQL_BLOCK',
    JOB_ACTION      => 'BEGIN BOARD_PACKAGE.DELETE_BOARD; END;',
    START_DATE      => SYSDATE,
    REPEAT_INTERVAL => 'FREQ=DAILY; BYHOUR=11; BYMINUTE=0; BYSECOND=0',
    ENABLED         => TRUE
  );
END;




---삭제 스케줄 조회---
SELECT JOB_NAME, JOB_TYPE, JOB_ACTION, ENABLED
FROM USER_SCHEDULER_JOBS
WHERE JOB_NAME = 'DELETE_BOARD_JOB';



SELECT * FROM KJH_BOARD order by updatedate;

TRUNCATE TABLE KJH_BOARD;
