CREATE TABLE KJH_board (
  id NUMBER PRIMARY KEY,
  title VARCHAR2(100) NOT NULL,
  passwd VARCHAR2(500) NOT NULL,
  salt VARCHAR2(500) NOT NULL,
  content CLOB,
  userid VARCHAR2(30),
  viewcount NUMBER default 0,
  regdate DATE,
  updatedate DATE,
  deletedate DATE,
  is_deleted NUMBER DEFAULT 0 CHECK (is_deleted IN (0, 1))
);

COMMENT ON COLUMN KJH_Board.id IS 'id';
COMMENT ON COLUMN KJH_Board.title IS '제목';
COMMENT ON COLUMN KJH_Board.passwd IS '비밀 번호';
COMMENT ON COLUMN KJH_Board.salt IS 'salt 값';
COMMENT ON COLUMN KJH_Board.content IS '내용';
COMMENT ON COLUMN KJH_Board.userid IS '등록자 계정';
COMMENT ON COLUMN KJH_Board.viewcount IS '조회 수';
COMMENT ON COLUMN KJH_Board.regdate IS '등록 날짜';
COMMENT ON COLUMN KJH_Board.updatedate IS '수정 날짜';
COMMENT ON COLUMN KJH_Board.deletedate IS '삭제 예정 날짜';
COMMENT ON COLUMN KJH_Board.is_deleted IS '삭제 여부';


drop table KJH_Board;

DESC KJH_BOARD;

SELECT *
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'KJH_BOARD';




CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1HMS_NEWS KJH_BOARD HMS_NEWS 
NOMAXVALUE;

update KJH_BOARD set viewcount= viewcount+1 where id =35;

SELECT * FROM ALL_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_BOARD';
DROP SEQUENCE SEQ_BOARD;

SELECT * FROM ALL_TRIGGERS WHERE TRIGGER_NAME = 'BOARD_TRIGGER';
SELECT * FROM USER_TRIGGERS WHERE TRIGGER_NAME = 'BOARD_TRIGGER';


INSERT INTO KJH_Board (id, title, content, user_id, updatedate, regdate)
VALUES (SEQ_BOARD.NEXTVAL, 'Sample Title', 'This is a sample content.', 'John Doe', SYSTIMESTAMP, SYSTIMESTAMP);

SELECT * FROM USER_TAB_PRIVS WHERE PRIVILEGE = 'TRIGGER';


delete from kjh_board where TO_CHAR(updatedate, 'YYYY-MM-DD') = '2023-11-14';

TRUNCATE TABLE KJH_BOARD;

select systimestamp from dual;

update KJH_Board set title = 10, content = 10, writer=10, regdate = SYSTIMESTAMP where id = 22;



SELECT * FROM KJH_Board
            
ORDER BY id ASC

ALTER TABLE KJH_BOARD MODIFY TITLE VARCHAR2(200);


select * from KJH_Board where TO_CHAR(updatedate, 'YYYY-MM-DD') = '2023-11-14';

select rownum, id, title, content, passwd, salt, userid, viewcount, regdate, updatedate, deletedate, is_deleted from KJH_Board order by regdate desc;

update KJH_Board set is_deleted=1, updatedate = SYSTIMESTAMP where TO_CHAR(deletedate, 'YYYY-MM-DD') = '2023-11-16';