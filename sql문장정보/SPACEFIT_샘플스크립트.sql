-----------------삭제------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
---------------------------------------


--------------------------------------------------------
--  파일이 생성됨 - 목요일-7월-28-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_BANNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BANNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BONO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BONO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_COMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CPNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CPNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10000 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FANO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FANO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FINO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FINO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GRNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_GRNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_LIKENO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_LIKENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MCNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MCNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MEMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MEMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 12 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NONO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_NONO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PLNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PLNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_QNNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_QNNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RPTNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RPTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RVNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RVNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SPNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_SPNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_TENO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_TENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table TB_BANNER
--------------------------------------------------------

  CREATE TABLE "TB_BANNER" 
   (	"BAN_NO" NUMBER, 
	"BAN_NAME" VARCHAR2(30 BYTE), 
	"BAN_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"BAN_ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"BAN_MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"BAN_URL" VARCHAR2(30 BYTE), 
	"BAN_IMG" VARCHAR2(255 BYTE)
   ) ;

   COMMENT ON COLUMN "TB_BANNER"."BAN_NO" IS '배너번호';
   COMMENT ON COLUMN "TB_BANNER"."BAN_NAME" IS '배너명';
   COMMENT ON COLUMN "TB_BANNER"."BAN_STATUS" IS '상태(Y/N)';
   COMMENT ON COLUMN "TB_BANNER"."BAN_ENROLL_DATE" IS '등록일';
   COMMENT ON COLUMN "TB_BANNER"."BAN_MODIFY_DATE" IS '수정일';
   COMMENT ON COLUMN "TB_BANNER"."BAN_URL" IS 'URL';
   COMMENT ON COLUMN "TB_BANNER"."BAN_IMG" IS '배너이미지경로';
--------------------------------------------------------
--  DDL for Table TB_BOOK
--------------------------------------------------------

  CREATE TABLE "TB_BOOK" 
   (	"BOOK_NO" NUMBER, 
	"SPACE_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"PL_ID" VARCHAR2(100 BYTE), 
	"BOOK_COUNT" NUMBER, 
	"BOOK_DATE" VARCHAR2(30 BYTE), 
	"BOOK_IN" VARCHAR2(20 BYTE), 
	"BOOK_OUT" VARCHAR2(20 BYTE), 
	"BOOK_PRICE" NUMBER, 
	"BOOK_NAME" VARCHAR2(20 BYTE), 
	"BOOK_PHONE" VARCHAR2(13 BYTE), 
	"BOOK_EMAIL" VARCHAR2(30 BYTE), 
	"BOOK_PURPOSE" VARCHAR2(60 BYTE), 
	"BOOK_ADD_CONTENT" VARCHAR2(1500 BYTE), 
	"BOOK_CAR" CHAR(1 BYTE) DEFAULT 'N', 
	"BOOK_ANIMAL" CHAR(1 BYTE) DEFAULT 'N', 
	"BOOK_CHAIR" CHAR(1 BYTE) DEFAULT 'N', 
	"BOOK_STAND" CHAR(1 BYTE) DEFAULT 'N', 
	"BOOK_CREATE_DATE" DATE DEFAULT SYSDATE, 
	"BOOK_MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"BOOK_STATUS" CHAR(1 BYTE) DEFAULT 'Y', 
	"BOOK_CATEGORY" VARCHAR2(20 BYTE) DEFAULT '예약확정', 
	"BOOK_CANCEL_REASON" VARCHAR2(40 BYTE), 
	"BOOK_CANCEL_CONTENT" VARCHAR2(1500 BYTE)
   ) ;

   COMMENT ON COLUMN "TB_BOOK"."BOOK_NO" IS '예약번호';
   COMMENT ON COLUMN "TB_BOOK"."SPACE_NO" IS '공간번호';
   COMMENT ON COLUMN "TB_BOOK"."MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_BOOK"."PL_ID" IS '결제식별자';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_COUNT" IS '예약인원';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_DATE" IS '대여날짜 xxxx.xx.xx';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_IN" IS '체크인시간(숫자만)';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_OUT" IS '체크아웃시간';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_PRICE" IS '가격';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_NAME" IS '예약자명';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_PHONE" IS '예약자연락처';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_EMAIL" IS '예약자이메일';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_PURPOSE" IS '사용목적';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_ADD_CONTENT" IS '요청사항';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_CAR" IS '주차옵션';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_ANIMAL" IS '반려동물옵션';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_CHAIR" IS '미니의자옵션';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_STAND" IS '보면대옵션';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_CREATE_DATE" IS '신청일';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_MODIFY_DATE" IS '수정일';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_STATUS" IS '상태값(Y/N)';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_CATEGORY" IS '예약현황';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_CANCEL_REASON" IS '취소사유';
   COMMENT ON COLUMN "TB_BOOK"."BOOK_CANCEL_CONTENT" IS '취소상세사유';
--------------------------------------------------------
--  DDL for Table TB_CART
--------------------------------------------------------

  CREATE TABLE "TB_CART" 
   (	"MEM_NO" NUMBER, 
	"SPACE_NO" NUMBER, 
	"CART_LIMIT" NUMBER, 
	"CART_DATE" VARCHAR2(30 BYTE), 
	"CART_IN" VARCHAR2(20 BYTE), 
	"CART_OUT" VARCHAR2(20 BYTE), 
	"CART_PARKING" CHAR(1 BYTE) DEFAULT 'N', 
	"CART_ANIMAL" CHAR(1 BYTE) DEFAULT 'N', 
	"CART_STAND" CHAR(1 BYTE) DEFAULT 'N', 
	"CART_CHAIR" CHAR(1 BYTE) DEFAULT 'N', 
	"CART_PRICE" NUMBER DEFAULT 0
   ) ;

   COMMENT ON COLUMN "TB_CART"."MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_CART"."SPACE_NO" IS '공간번호';
   COMMENT ON COLUMN "TB_CART"."CART_LIMIT" IS '요청인원';
   COMMENT ON COLUMN "TB_CART"."CART_DATE" IS '대여예정일';
   COMMENT ON COLUMN "TB_CART"."CART_IN" IS '체크인시간';
   COMMENT ON COLUMN "TB_CART"."CART_OUT" IS '체크아웃시간';
   COMMENT ON COLUMN "TB_CART"."CART_PARKING" IS '주차';
   COMMENT ON COLUMN "TB_CART"."CART_ANIMAL" IS '반려동물';
   COMMENT ON COLUMN "TB_CART"."CART_STAND" IS '보면대';
   COMMENT ON COLUMN "TB_CART"."CART_CHAIR" IS '미니의자';
   COMMENT ON COLUMN "TB_CART"."CART_PRICE" IS '가격';
--------------------------------------------------------
--  DDL for Table TB_COMMENT
--------------------------------------------------------

  CREATE TABLE "TB_COMMENT" 
   (	"COM_NO" NUMBER, 
	"RV_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"MEM_ID" VARCHAR2(60 BYTE), 
	"COM_CONTENT" VARCHAR2(1000 BYTE), 
	"COM_ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"COM_MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"COM_PARENT_NO" NUMBER DEFAULT 0, 
	"COM_STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "TB_COMMENT"."COM_NO" IS '댓글번호';
   COMMENT ON COLUMN "TB_COMMENT"."RV_NO" IS '후기번호';
   COMMENT ON COLUMN "TB_COMMENT"."MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_COMMENT"."COM_CONTENT" IS '댓글내용';
   COMMENT ON COLUMN "TB_COMMENT"."COM_ENROLL_DATE" IS '댓글작성일';
   COMMENT ON COLUMN "TB_COMMENT"."COM_MODIFY_DATE" IS '댓글수정일';
   COMMENT ON COLUMN "TB_COMMENT"."COM_PARENT_NO" IS '이 댓글이 참조하는 댓글번호 (만일 원글일 경우 0)';
--------------------------------------------------------
--  DDL for Table TB_COUPON
--------------------------------------------------------

  CREATE TABLE "TB_COUPON" 
   (	"CP_NO" NUMBER, 
	"CP_NAME" VARCHAR2(30 BYTE), 
	"CP_DISCOUNT" NUMBER, 
	"CP_ENROLL_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "TB_COUPON"."CP_NO" IS '쿠폰번호';
   COMMENT ON COLUMN "TB_COUPON"."CP_NAME" IS '쿠폰명';
   COMMENT ON COLUMN "TB_COUPON"."CP_DISCOUNT" IS '할인금액';
   COMMENT ON COLUMN "TB_COUPON"."CP_ENROLL_DATE" IS '등록일';
--------------------------------------------------------
--  DDL for Table TB_FAQ
--------------------------------------------------------

  CREATE TABLE "TB_FAQ" 
   (	"FAQ_NO" NUMBER, 
	"FAQ_TITLE" VARCHAR2(100 BYTE), 
	"FAQ_CONTENT" VARCHAR2(4000 BYTE), 
	"FAQ_MEM_NO" NUMBER, 
	"FAQ_CREATE_DATE" DATE DEFAULT SYSDATE, 
	"FAQ_UPDATE_DATE" DATE DEFAULT SYSDATE, 
	"FAQ_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "TB_FAQ"."FAQ_NO" IS '글번호';
   COMMENT ON COLUMN "TB_FAQ"."FAQ_TITLE" IS '제목';
   COMMENT ON COLUMN "TB_FAQ"."FAQ_CONTENT" IS '내용';
   COMMENT ON COLUMN "TB_FAQ"."FAQ_MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_FAQ"."FAQ_CREATE_DATE" IS '작성일';
   COMMENT ON COLUMN "TB_FAQ"."FAQ_UPDATE_DATE" IS '수정일';
   COMMENT ON COLUMN "TB_FAQ"."FAQ_STATUS" IS '활성화여부';
--------------------------------------------------------
--  DDL for Table TB_FILE
--------------------------------------------------------

  CREATE TABLE "TB_FILE" 
   (	"FILE_NO" NUMBER, 
	"REF_BNO" NUMBER, 
	"FILE_CATEGORY" NUMBER, 
	"FILE_ORIGIN_NAME" VARCHAR2(255 BYTE), 
	"FILE_CHANGE_NAME" VARCHAR2(255 BYTE), 
	"FILE_PATH" VARCHAR2(1000 BYTE), 
	"FILE_UPLOAD_DATE" DATE DEFAULT SYSDATE, 
	"FILE_LEVEL" NUMBER, 
	"FILE_STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "TB_FILE"."FILE_NO" IS '파일번호';
   COMMENT ON COLUMN "TB_FILE"."REF_BNO" IS '참조게시글번호';
   COMMENT ON COLUMN "TB_FILE"."FILE_CATEGORY" IS '참조게시글카테고리(1공간/2:후기/3.홈페이지관리)';
   COMMENT ON COLUMN "TB_FILE"."FILE_ORIGIN_NAME" IS '파일원본명';
   COMMENT ON COLUMN "TB_FILE"."FILE_CHANGE_NAME" IS '파일수정명';
   COMMENT ON COLUMN "TB_FILE"."FILE_PATH" IS '저장폴더경로';
   COMMENT ON COLUMN "TB_FILE"."FILE_UPLOAD_DATE" IS '업로드일';
   COMMENT ON COLUMN "TB_FILE"."FILE_LEVEL" IS '파일레벨';
   COMMENT ON COLUMN "TB_FILE"."FILE_STATUS" IS '상태';
--------------------------------------------------------
--  DDL for Table TB_GRADE
--------------------------------------------------------

  CREATE TABLE "TB_GRADE" 
   (	"GR_NO" NUMBER, 
	"GR_NAME" VARCHAR2(20 BYTE), 
	"GR_COND" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table TB_LIKE
--------------------------------------------------------

  CREATE TABLE "TB_LIKE" 
   (	"LIKE_NO" NUMBER, 
	"SPACE_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"LIKE_DATE" DATE
   ) ;

   COMMENT ON COLUMN "TB_LIKE"."MEM_NO" IS '회원번호';
--------------------------------------------------------
--  DDL for Table TB_LOVE
--------------------------------------------------------

  CREATE TABLE "TB_LOVE" 
   (	"SPACE_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"LOVE_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "TB_LOVE"."SPACE_NO" IS '공간번호';
   COMMENT ON COLUMN "TB_LOVE"."MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_LOVE"."LOVE_DATE" IS '찜한날짜';
--------------------------------------------------------
--  DDL for Table TB_MCP
--------------------------------------------------------

  CREATE TABLE "TB_MCP" 
   (	"MCP_NO" NUMBER, 
	"CP_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"MCP_STATUS" CHAR(1 BYTE) DEFAULT 'Y', 
	"MCP_USE" CHAR(1 BYTE) DEFAULT 'N', 
	"MCP_START_DATE" DATE DEFAULT SYSDATE, 
	"MCP_END_DATE" DATE
   ) ;

   COMMENT ON COLUMN "TB_MCP"."MCP_NO" IS '발급된쿠폰번호';
   COMMENT ON COLUMN "TB_MCP"."CP_NO" IS '쿠폰번호';
   COMMENT ON COLUMN "TB_MCP"."MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_MCP"."MCP_STATUS" IS '유효상태(Y/N)';
   COMMENT ON COLUMN "TB_MCP"."MCP_USE" IS '사용여부(Y/N)';
   COMMENT ON COLUMN "TB_MCP"."MCP_START_DATE" IS '발급일';
   COMMENT ON COLUMN "TB_MCP"."MCP_END_DATE" IS '만료일';
--------------------------------------------------------
--  DDL for Table TB_MEMBER
--------------------------------------------------------

  CREATE TABLE "TB_MEMBER" 
   (	"MEM_NO" NUMBER, 
	"GR_NO" NUMBER DEFAULT 1, 
	"MEM_ID" VARCHAR2(60 BYTE), 
	"MEM_PWD" VARCHAR2(1024 BYTE), 
	"MEM_NAME" VARCHAR2(30 BYTE), 
	"MEM_IDNO" VARCHAR2(7 BYTE), 
	"MEM_PHONE" VARCHAR2(11 BYTE), 
	"MEM_MAIL" VARCHAR2(60 BYTE), 
	"MEM_PROFILE" VARCHAR2(120 BYTE), 
	"MEM_ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MEM_MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"MEM_STATUS" CHAR(1 BYTE) DEFAULT 'Y', 
	"MEM_ADM_FLAG" CHAR(1 BYTE) DEFAULT 'U'
   ) ;

   COMMENT ON COLUMN "TB_MEMBER"."MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_MEMBER"."GR_NO" IS '회원등급 3개';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_ID" IS '아이디';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_PWD" IS '비밀번호';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_IDNO" IS '주민번호';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_PHONE" IS '전화번호';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_MAIL" IS '이메일';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_PROFILE" IS 'resources/xxxxx/xxxx.jpg';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_ENROLL_DATE" IS '회원가입일';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_MODIFY_DATE" IS '정보수정일';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_STATUS" IS 'Y |  N  |  B';
   COMMENT ON COLUMN "TB_MEMBER"."MEM_ADM_FLAG" IS 'A  |  U';
--------------------------------------------------------
--  DDL for Table TB_NOTICE
--------------------------------------------------------

  CREATE TABLE "TB_NOTICE" 
   (	"NT_NO" NUMBER, 
	"NT_TITLE" VARCHAR2(100 BYTE), 
	"NT_CONTENT" VARCHAR2(4000 BYTE), 
	"NT_MEM_NO" NUMBER, 
	"NT_COUNT" NUMBER DEFAULT 0, 
	"NT_CREATE_DATE" DATE DEFAULT SYSDATE, 
	"NT_UPDATE_DATE" DATE DEFAULT SYSDATE, 
	"NT_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"NT_CATEGORY" VARCHAR2(15 BYTE)
   ) ;

   COMMENT ON COLUMN "TB_NOTICE"."NT_NO" IS '글번호';
   COMMENT ON COLUMN "TB_NOTICE"."NT_TITLE" IS '제목';
   COMMENT ON COLUMN "TB_NOTICE"."NT_CONTENT" IS '내용';
   COMMENT ON COLUMN "TB_NOTICE"."NT_MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_NOTICE"."NT_COUNT" IS '조회수';
   COMMENT ON COLUMN "TB_NOTICE"."NT_CREATE_DATE" IS '작성날짜';
   COMMENT ON COLUMN "TB_NOTICE"."NT_UPDATE_DATE" IS '수정일';
   COMMENT ON COLUMN "TB_NOTICE"."NT_STATUS" IS '활성화여부';
   COMMENT ON COLUMN "TB_NOTICE"."NT_CATEGORY" IS '분류(이벤트|일반)';
--------------------------------------------------------
--  DDL for Table TB_PAYLIST
--------------------------------------------------------

  CREATE TABLE "TB_PAYLIST" 
   (	"PL_ID" VARCHAR2(100 BYTE), 
	"PL_STATUS" VARCHAR2(1024 BYTE), 
	"PL_TID" VARCHAR2(1024 BYTE), 
	"PL_MEM_NO" NUMBER, 
	"PL_TYPE" VARCHAR2(1024 BYTE), 
	"PL_MCP_NO" NUMBER, 
	"PL_AMOUNT" VARCHAR2(1024 BYTE), 
	"PL_DISCOUNT_AMOUNT" VARCHAR2(1024 BYTE), 
	"PL_CARD_INFO" VARCHAR2(1024 BYTE), 
	"PL_REQUEST_TIME" DATE DEFAULT SYSDATE, 
	"PL_APPROVED_TIME" DATE, 
	"PL_PAYLOAD" VARCHAR2(1024 BYTE)
   ) ;

   COMMENT ON COLUMN "TB_PAYLIST"."PL_ID" IS '결제식별자';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_STATUS" IS '상태';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_TID" IS '결제고유번호';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_TYPE" IS '결제방법';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_MCP_NO" IS '발급된쿠폰번호';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_AMOUNT" IS '쿠폰 적용 전 금액';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_DISCOUNT_AMOUNT" IS '쿠폰 적용 후 금액';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_CARD_INFO" IS '결제 카드 정보';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_REQUEST_TIME" IS '결제 준비 요청 시각';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_APPROVED_TIME" IS '결제 승인 시각';
   COMMENT ON COLUMN "TB_PAYLIST"."PL_PAYLOAD" IS '커스텀 정보';
--------------------------------------------------------
--  DDL for Table TB_QNA
--------------------------------------------------------

  CREATE TABLE "TB_QNA" 
   (	"QNA_NO" NUMBER, 
	"QNA_CATEGORY" VARCHAR2(6 BYTE), 
	"QNA_SPACE_NO" NUMBER, 
	"QNA_TITLE" VARCHAR2(100 BYTE), 
	"QNA_CONTENT" VARCHAR2(4000 BYTE), 
	"QNA_MEM_NO" NUMBER, 
	"QNA_GROUP" NUMBER DEFAULT 0, 
	"QNA_REF_NO" NUMBER, 
	"QNA_CREATE_DATE" DATE DEFAULT SYSDATE, 
	"QNA_UPDATE_DATE" DATE DEFAULT SYSDATE, 
	"QNA_COUNT" NUMBER DEFAULT 0, 
	"QNA_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"QNA_PUBLIC" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"QNA_PWD" VARCHAR2(30 BYTE)
   ) ;

   COMMENT ON COLUMN "TB_QNA"."QNA_NO" IS '글번호';
   COMMENT ON COLUMN "TB_QNA"."QNA_CATEGORY" IS '분류';
   COMMENT ON COLUMN "TB_QNA"."QNA_SPACE_NO" IS '공간번호';
   COMMENT ON COLUMN "TB_QNA"."QNA_TITLE" IS '제목';
   COMMENT ON COLUMN "TB_QNA"."QNA_CONTENT" IS '내용';
   COMMENT ON COLUMN "TB_QNA"."QNA_MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_QNA"."QNA_GROUP" IS '글깊이';
   COMMENT ON COLUMN "TB_QNA"."QNA_REF_NO" IS '참조글번호';
   COMMENT ON COLUMN "TB_QNA"."QNA_CREATE_DATE" IS '작성날짜';
   COMMENT ON COLUMN "TB_QNA"."QNA_UPDATE_DATE" IS '수정일';
   COMMENT ON COLUMN "TB_QNA"."QNA_COUNT" IS '조회수';
   COMMENT ON COLUMN "TB_QNA"."QNA_STATUS" IS '활성화여부';
   COMMENT ON COLUMN "TB_QNA"."QNA_PUBLIC" IS '비밀글여부';
   COMMENT ON COLUMN "TB_QNA"."QNA_PWD" IS '비밀번호';
--------------------------------------------------------
--  DDL for Table TB_REPORT
--------------------------------------------------------

  CREATE TABLE "TB_REPORT" 
   (	"RPT_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"RPT_MEM_NO" NUMBER, 
	"RPT_REASON_NO" NUMBER, 
	"RPT_REF_CAT" NUMBER, 
	"RPT_REF_NO" NUMBER, 
	"RPT_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "TB_REPORT"."MEM_NO" IS '신고한회원번호';
   COMMENT ON COLUMN "TB_REPORT"."RPT_MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "TB_REPORT"."RPT_REASON_NO" IS '신고사유번호';
   COMMENT ON COLUMN "TB_REPORT"."RPT_REF_CAT" IS '후기글 1 | 댓글 2';
--------------------------------------------------------
--  DDL for Table TB_REVIEW
--------------------------------------------------------

  CREATE TABLE "TB_REVIEW" 
   (	"RV_NO" NUMBER, 
	"BOOK_NO" NUMBER, 
	"SPACE_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"RV_CONTENT" VARCHAR2(1500 BYTE), 
	"RV_ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"RV_MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"RV_STAR" NUMBER, 
	"RV_STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "TB_REVIEW"."RV_NO" IS '후기번호';
   COMMENT ON COLUMN "TB_REVIEW"."BOOK_NO" IS '예약번호';
   COMMENT ON COLUMN "TB_REVIEW"."SPACE_NO" IS '공간번호';
   COMMENT ON COLUMN "TB_REVIEW"."MEM_NO" IS '작성자회원번호';
   COMMENT ON COLUMN "TB_REVIEW"."RV_CONTENT" IS '후기내용';
   COMMENT ON COLUMN "TB_REVIEW"."RV_ENROLL_DATE" IS '후기작성일';
   COMMENT ON COLUMN "TB_REVIEW"."RV_MODIFY_DATE" IS '후기수정일';
   COMMENT ON COLUMN "TB_REVIEW"."RV_STAR" IS '평점';
   COMMENT ON COLUMN "TB_REVIEW"."RV_STATUS" IS '후기상태';
--------------------------------------------------------
--  DDL for Table TB_RPT_RSN
--------------------------------------------------------

  CREATE TABLE "TB_RPT_RSN" 
   (	"RPT_REASON_NO" NUMBER, 
	"RPT_REASON" VARCHAR2(90 BYTE)
   ) ;

   COMMENT ON COLUMN "TB_RPT_RSN"."RPT_REASON_NO" IS '신고사유번호';
   COMMENT ON COLUMN "TB_RPT_RSN"."RPT_REASON" IS '신고사유';
--------------------------------------------------------
--  DDL for Table TB_SPACE
--------------------------------------------------------

  CREATE TABLE "TB_SPACE" 
   (	"SPACE_NO" NUMBER, 
	"SPACE_NAME" VARCHAR2(30 BYTE), 
	"SPACE_LIMIT" NUMBER, 
	"SPACE_INFO" VARCHAR2(4000 BYTE), 
	"SPACE_CATEGORY" VARCHAR2(300 BYTE), 
	"SPACE_PIC" VARCHAR2(500 BYTE), 
	"SPACE_EN_DATE" DATE DEFAULT SYSDATE, 
	"SPACE_PRICE" NUMBER,
    "SPACE_STATUS" CHAR(1) DEFAULT 'Y' CHECK (SPACE_STATUS IN ('Y', 'N'))
   ) ;

   COMMENT ON COLUMN "TB_SPACE"."SPACE_NO" IS '공간번호';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_NAME" IS '공간명';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_LIMIT" IS '수용인원';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_INFO" IS '공간설명';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_CATEGORY" IS '공간분류';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_PIC" IS '대표이미지경로';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_EN_DATE" IS '공간등록일';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_PRICE" IS '시간당가격';
   COMMENT ON COLUMN "TB_SPACE"."SPACE_STATUS" IS '활성화여부';
--------------------------------------------------------
--  DDL for Table TB_TERMS
--------------------------------------------------------

  CREATE TABLE "TB_TERMS" 
   (	"TERMS_NO" NUMBER, 
	"TERMS_TITLE" VARCHAR2(100 BYTE), 
	"TERMS_CONTENT" VARCHAR2(4000 BYTE), 
	"TERMS_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"TERMS_PAGE" VARCHAR2(50 BYTE), 
	"TERMS_NOTE" VARCHAR2(200 BYTE), 
	"TERMS_ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"TERMS_MODIFY_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "TB_TERMS"."TERMS_NO" IS '약관번호';
   COMMENT ON COLUMN "TB_TERMS"."TERMS_TITLE" IS '이용약관명';
   COMMENT ON COLUMN "TB_TERMS"."TERMS_CONTENT" IS '약관내용';
   COMMENT ON COLUMN "TB_TERMS"."TERMS_STATUS" IS '상태(Y/N)';
   COMMENT ON COLUMN "TB_TERMS"."TERMS_PAGE" IS '게시영역';
   COMMENT ON COLUMN "TB_TERMS"."TERMS_NOTE" IS '비고';
   COMMENT ON COLUMN "TB_TERMS"."TERMS_ENROLL_DATE" IS '등록일';
   COMMENT ON COLUMN "TB_TERMS"."TERMS_MODIFY_DATE" IS '수정일';
REM INSERTING into TB_BANNER
SET DEFINE OFF;
REM INSERTING into TB_BOOK
SET DEFINE OFF;
REM INSERTING into TB_CART
SET DEFINE OFF;
REM INSERTING into TB_COMMENT
SET DEFINE OFF;
REM INSERTING into TB_COUPON
SET DEFINE OFF;
REM INSERTING into TB_FAQ
SET DEFINE OFF;
REM INSERTING into TB_FILE
SET DEFINE OFF;
REM INSERTING into TB_GRADE
SET DEFINE OFF;
Insert into TB_GRADE (GR_NO,GR_NAME,GR_COND) values (1,'Basic',0);
Insert into TB_GRADE (GR_NO,GR_NAME,GR_COND) values (2,'Silver',3);
Insert into TB_GRADE (GR_NO,GR_NAME,GR_COND) values (3,'Gold',5);
REM INSERTING into TB_LIKE
SET DEFINE OFF;
REM INSERTING into TB_LOVE
SET DEFINE OFF;
REM INSERTING into TB_MCP
SET DEFINE OFF;
REM INSERTING into TB_MEMBER
SET DEFINE OFF;
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (1,1,'admin','project100WOW!','관리자','9401272','01088882222','admin@gmail.com',null,to_date('22/07/27','RR/MM/DD'),to_date('22/07/27','RR/MM/DD'),'Y','A');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (2,1,'user01','1111','유저일','910414','01088881111','user01@gmail.com',null,to_date('21/06/01','RR/MM/DD'),to_date('21/06/01','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (4,1,'user03','3333','유저삼','030303','01088883333','user03@gmail.com',null,to_date('21/06/03','RR/MM/DD'),to_date('21/06/03','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (5,1,'user04','4444','유저사','665598','01088884444','user04@gmail.com',null,to_date('21/06/04','RR/MM/DD'),to_date('21/06/04','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (6,1,'user05','5555','유저오','890615','01088885555','user05@gmail.com',null,to_date('21/06/05','RR/MM/DD'),to_date('21/06/05','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (7,1,'user06','6666','유저육','000608','01088886666','user06@gmail.com',null,to_date('21/06/06','RR/MM/DD'),to_date('21/06/06','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (8,1,'user07','7777','유저칠','980715','01088887777','user07@gmail.com',null,to_date('21/06/07','RR/MM/DD'),to_date('21/06/07','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (9,1,'user08','8888','유저팔','930530','01088888888','user08@gmail.com',null,to_date('21/06/08','RR/MM/DD'),to_date('21/06/08','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (10,1,'user09','9999','유저구','990919','01088889999','user09@gmail.com',null,to_date('21/06/09','RR/MM/DD'),to_date('21/06/09','RR/MM/DD'),'Y','U');
Insert into TB_MEMBER (MEM_NO,GR_NO,MEM_ID,MEM_PWD,MEM_NAME,MEM_IDNO,MEM_PHONE,MEM_MAIL,MEM_PROFILE,MEM_ENROLL_DATE,MEM_MODIFY_DATE,MEM_STATUS,MEM_ADM_FLAG) values (11,1,'user10','1010','유저십','011010','01088881010','user10@gmail.com',null,to_date('21/06/10','RR/MM/DD'),to_date('21/06/10','RR/MM/DD'),'Y','U');
REM INSERTING into TB_NOTICE
SET DEFINE OFF;
REM INSERTING into TB_PAYLIST
SET DEFINE OFF;
REM INSERTING into TB_QNA
SET DEFINE OFF;
REM INSERTING into TB_REPORT
SET DEFINE OFF;
REM INSERTING into TB_REVIEW
SET DEFINE OFF;
REM INSERTING into TB_RPT_RSN
SET DEFINE OFF;
REM INSERTING into TB_SPACE
SET DEFINE OFF;
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (1,'공간명1',10,'공간설명입니다.1','practice','resources/admin/space_upfiles/practice/prac1_1.jpg',to_date('22/03/09','RR/MM/DD'),10000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (2,'공간명2',20,'공간설명입니다.2','studio','resources/admin/space_upfiles/studio/studio1_1.jpg',to_date('22/03/10','RR/MM/DD'),25000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (3,'공간명3',30,'공간설명입니다.3','party','resources/admin/space_upfiles/party/party1_1.jpg',to_date('22/03/11','RR/MM/DD'),30000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (4,'공간명4',10,'공간설명입니다.4','practice','resources/admin/space_upfiles/practice/prac2_1.jpg',to_date('22/03/12','RR/MM/DD'),10000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (5,'공간명5',20,'공간설명입니다.5','studio','resources/admin/space_upfiles/studio/studio2_1.jpg',to_date('22/03/13','RR/MM/DD'),25000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (6,'공간명6',30,'공간설명입니다.6','party','resources/admin/space_upfiles/party/party2_1.jpg',to_date('22/03/14','RR/MM/DD'),30000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (7,'공간명7',10,'공간설명입니다.7','practice','resources/admin/space_upfiles/practice/prac3_1.jpg',to_date('22/03/15','RR/MM/DD'),10000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (8,'공간명8',20,'공간설명입니다.8','studio','resources/admin/space_upfiles/studio/studio3_1.jpg',to_date('22/03/16','RR/MM/DD'),25000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (9,'공간명9',30,'공간설명입니다.9','party','resources/admin/space_upfiles/party/loof1_1.jpg',to_date('22/03/17','RR/MM/DD'),30000);
Insert into TB_SPACE (SPACE_NO,SPACE_NAME,SPACE_LIMIT,SPACE_INFO,SPACE_CATEGORY,SPACE_PIC,SPACE_EN_DATE,SPACE_PRICE) values (10,'공간명10',10,'공간설명입니다.10','practice','resources/admin/space_upfiles/practice/prac4_1.jpg',to_date('22/03/18','RR/MM/DD'),10000);
REM INSERTING into TB_TERMS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_TB_LIKE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_LIKE" ON "TB_LIKE" ("LIKE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_FILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_FILE" ON "TB_FILE" ("FILE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_COUPON
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_COUPON" ON "TB_COUPON" ("CP_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_TERMS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_TERMS" ON "TB_TERMS" ("TERMS_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_GRADE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_GRADE" ON "TB_GRADE" ("GR_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_QNA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_QNA" ON "TB_QNA" ("QNA_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_MCP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_MCP" ON "TB_MCP" ("MCP_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_FAQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_FAQ" ON "TB_FAQ" ("FAQ_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_BANNER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_BANNER" ON "TB_BANNER" ("BAN_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_BOOK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_BOOK" ON "TB_BOOK" ("BOOK_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_COMMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_COMMENT" ON "TB_COMMENT" ("COM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_RPT_RSN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_RPT_RSN" ON "TB_RPT_RSN" ("RPT_REASON_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_REVIEW" ON "TB_REVIEW" ("RV_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_LOVE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_LOVE" ON "TB_LOVE" ("SPACE_NO", "MEM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_NOTICE" ON "TB_NOTICE" ("NT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_PAYLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_PAYLIST" ON "TB_PAYLIST" ("PL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_MEMBER" ON "TB_MEMBER" ("MEM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_SPACE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_SPACE" ON "TB_SPACE" ("SPACE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_REPORT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_REPORT" ON "TB_REPORT" ("RPT_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table TB_LIKE
--------------------------------------------------------

  ALTER TABLE "TB_LIKE" ADD CONSTRAINT "PK_TB_LIKE" PRIMARY KEY ("LIKE_NO") ENABLE;
  ALTER TABLE "TB_LIKE" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_LIKE" MODIFY ("SPACE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_LIKE" MODIFY ("LIKE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_BANNER
--------------------------------------------------------

  ALTER TABLE "TB_BANNER" ADD CHECK (BAN_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_BANNER" MODIFY ("BAN_IMG" NOT NULL ENABLE);
  ALTER TABLE "TB_BANNER" MODIFY ("BAN_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_BANNER" MODIFY ("BAN_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_BANNER" ADD CONSTRAINT "PK_TB_BANNER" PRIMARY KEY ("BAN_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_FILE
--------------------------------------------------------

  ALTER TABLE "TB_FILE" ADD CHECK (FILE_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_FILE" MODIFY ("FILE_UPLOAD_DATE" NOT NULL ENABLE);
  ALTER TABLE "TB_FILE" MODIFY ("FILE_CHANGE_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_FILE" MODIFY ("FILE_ORIGIN_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_FILE" MODIFY ("FILE_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "TB_FILE" MODIFY ("REF_BNO" NOT NULL ENABLE);
  ALTER TABLE "TB_FILE" MODIFY ("FILE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_FILE" ADD CONSTRAINT "PK_TB_FILE" PRIMARY KEY ("FILE_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_FAQ
--------------------------------------------------------

  ALTER TABLE "TB_FAQ" ADD CHECK (FAQ_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_FAQ" MODIFY ("FAQ_MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_FAQ" MODIFY ("FAQ_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TB_FAQ" MODIFY ("FAQ_TITLE" NOT NULL ENABLE);
  ALTER TABLE "TB_FAQ" MODIFY ("FAQ_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_FAQ" ADD CONSTRAINT "PK_TB_FAQ" PRIMARY KEY ("FAQ_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_GRADE
--------------------------------------------------------

  ALTER TABLE "TB_GRADE" MODIFY ("GR_COND" NOT NULL ENABLE);
  ALTER TABLE "TB_GRADE" MODIFY ("GR_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_GRADE" MODIFY ("GR_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_GRADE" ADD CONSTRAINT "PK_TB_GRADE" PRIMARY KEY ("GR_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_COUPON
--------------------------------------------------------

  ALTER TABLE "TB_COUPON" MODIFY ("CP_DISCOUNT" NOT NULL ENABLE);
  ALTER TABLE "TB_COUPON" MODIFY ("CP_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_COUPON" MODIFY ("CP_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_COUPON" ADD CONSTRAINT "PK_TB_COUPON" PRIMARY KEY ("CP_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_SPACE
--------------------------------------------------------

  ALTER TABLE "TB_SPACE" ADD CHECK (SPACE_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_SPACE" ADD UNIQUE ("SPACE_NAME") ENABLE;
  ALTER TABLE "TB_SPACE" MODIFY ("SPACE_PIC" NOT NULL ENABLE);
  ALTER TABLE "TB_SPACE" MODIFY ("SPACE_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "TB_SPACE" MODIFY ("SPACE_INFO" NOT NULL ENABLE);
  ALTER TABLE "TB_SPACE" MODIFY ("SPACE_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "TB_SPACE" MODIFY ("SPACE_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_SPACE" MODIFY ("SPACE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_SPACE" MODIFY ("SPACE_PRICE" NOT NULL ENABLE);
  ALTER TABLE "TB_SPACE" ADD CONSTRAINT "PK_TB_SPACE" PRIMARY KEY ("SPACE_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_TERMS
--------------------------------------------------------

  ALTER TABLE "TB_TERMS" ADD CHECK (TERMS_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_TERMS" MODIFY ("TERMS_PAGE" NOT NULL ENABLE);
  ALTER TABLE "TB_TERMS" MODIFY ("TERMS_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TB_TERMS" MODIFY ("TERMS_TITLE" NOT NULL ENABLE);
  ALTER TABLE "TB_TERMS" MODIFY ("TERMS_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_TERMS" ADD CONSTRAINT "PK_TB_TERMS" PRIMARY KEY ("TERMS_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_COMMENT
--------------------------------------------------------

  ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "PK_TB_COMMENT" PRIMARY KEY ("COM_NO") ENABLE;
  ALTER TABLE "TB_COMMENT" ADD CHECK (COM_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_COMMENT" MODIFY ("COM_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TB_COMMENT" MODIFY ("MEM_ID" NOT NULL ENABLE);
  ALTER TABLE "TB_COMMENT" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_COMMENT" MODIFY ("RV_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_COMMENT" MODIFY ("COM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_REVIEW
--------------------------------------------------------

  ALTER TABLE "TB_REVIEW" ADD CHECK (RV_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_REVIEW" MODIFY ("RV_STAR" NOT NULL ENABLE);
  ALTER TABLE "TB_REVIEW" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REVIEW" MODIFY ("SPACE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REVIEW" MODIFY ("BOOK_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REVIEW" MODIFY ("RV_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REVIEW" ADD CONSTRAINT "PK_TB_REVIEW" PRIMARY KEY ("RV_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_RPT_RSN
--------------------------------------------------------

  ALTER TABLE "TB_RPT_RSN" ADD CONSTRAINT "PK_TB_RPT_RSN" PRIMARY KEY ("RPT_REASON_NO") ENABLE;
  ALTER TABLE "TB_RPT_RSN" MODIFY ("RPT_REASON" NOT NULL ENABLE);
  ALTER TABLE "TB_RPT_RSN" MODIFY ("RPT_REASON_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_NOTICE
--------------------------------------------------------

  ALTER TABLE "TB_NOTICE" ADD CHECK (NT_CATEGORY IN('이벤트', '일반')) ENABLE;
  ALTER TABLE "TB_NOTICE" ADD CHECK (NT_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_NOTICE" MODIFY ("NT_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "TB_NOTICE" MODIFY ("NT_MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_NOTICE" MODIFY ("NT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TB_NOTICE" MODIFY ("NT_TITLE" NOT NULL ENABLE);
  ALTER TABLE "TB_NOTICE" MODIFY ("NT_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "PK_TB_NOTICE" PRIMARY KEY ("NT_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_MCP
--------------------------------------------------------

  ALTER TABLE "TB_MCP" ADD CHECK ("MCP_STATUS"='Y' OR "MCP_STATUS"='N') ENABLE;
  ALTER TABLE "TB_MCP" MODIFY ("MCP_END_DATE" NOT NULL ENABLE);
  ALTER TABLE "TB_MCP" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_MCP" MODIFY ("CP_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_MCP" MODIFY ("MCP_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_MCP" ADD CHECK ("MCP_USE"='Y' OR "MCP_USE"='N') ENABLE;
  ALTER TABLE "TB_MCP" ADD CONSTRAINT "PK_TB_MCP" PRIMARY KEY ("MCP_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_MEMBER
--------------------------------------------------------

  ALTER TABLE "TB_MEMBER" ADD UNIQUE ("MEM_MAIL") ENABLE;
  ALTER TABLE "TB_MEMBER" ADD UNIQUE ("MEM_PHONE") ENABLE;
  ALTER TABLE "TB_MEMBER" ADD UNIQUE ("MEM_ID") ENABLE;
  ALTER TABLE "TB_MEMBER" ADD CHECK (MEM_STATUS IN('Y', 'N', 'A', 'B')) ENABLE;
  ALTER TABLE "TB_MEMBER" MODIFY ("MEM_STATUS" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" MODIFY ("MEM_PHONE" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" MODIFY ("MEM_IDNO" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" MODIFY ("MEM_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" MODIFY ("MEM_PWD" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" MODIFY ("MEM_ID" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" MODIFY ("GR_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_MEMBER" ADD CHECK (MEM_STATUS IN('Y', 'N', 'B')) ENABLE;
  ALTER TABLE "TB_MEMBER" ADD CHECK (MEM_ADM_FLAG IN ('A', 'U')) ENABLE;
  ALTER TABLE "TB_MEMBER" ADD CONSTRAINT "PK_TB_MEMBER" PRIMARY KEY ("MEM_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_PAYLIST
--------------------------------------------------------

  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_APPROVED_TIME" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_REQUEST_TIME" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_TYPE" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_TID" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_STATUS" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" MODIFY ("PL_ID" NOT NULL ENABLE);
  ALTER TABLE "TB_PAYLIST" ADD CONSTRAINT "PK_TB_PAYLIST" PRIMARY KEY ("PL_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_LOVE
--------------------------------------------------------

  ALTER TABLE "TB_LOVE" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_LOVE" MODIFY ("SPACE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_LOVE" ADD CONSTRAINT "PK_TB_LOVE" PRIMARY KEY ("SPACE_NO", "MEM_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_BOOK
--------------------------------------------------------

  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_DATE" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_COUNT" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("PL_ID" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("SPACE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" ADD CONSTRAINT "PK_TB_BOOK" PRIMARY KEY ("BOOK_NO") ENABLE;
  ALTER TABLE "TB_BOOK" ADD CHECK (BOOK_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_BOOK" ADD CHECK (BOOK_STAND IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_BOOK" ADD CHECK (BOOK_CHAIR IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_BOOK" ADD CHECK (BOOK_ANIMAL IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_BOOK" ADD CHECK (BOOK_CAR IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_PHONE" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_NAME" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_PRICE" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_OUT" NOT NULL ENABLE);
  ALTER TABLE "TB_BOOK" MODIFY ("BOOK_IN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_CART
--------------------------------------------------------

  ALTER TABLE "TB_CART" ADD CHECK (CART_CHAIR IN ('N','Y')) ENABLE;
  ALTER TABLE "TB_CART" ADD CHECK (CART_STAND IN ('N','Y')) ENABLE;
  ALTER TABLE "TB_CART" ADD CHECK (CART_ANIMAL IN ('N','Y')) ENABLE;
  ALTER TABLE "TB_CART" ADD CHECK (CART_PARKING IN ('N','Y')) ENABLE;
  ALTER TABLE "TB_CART" MODIFY ("CART_OUT" NOT NULL ENABLE);
  ALTER TABLE "TB_CART" MODIFY ("CART_IN" NOT NULL ENABLE);
  ALTER TABLE "TB_CART" MODIFY ("CART_DATE" NOT NULL ENABLE);
  ALTER TABLE "TB_CART" MODIFY ("CART_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "TB_CART" MODIFY ("SPACE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_CART" MODIFY ("MEM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_QNA
--------------------------------------------------------

  ALTER TABLE "TB_QNA" ADD CHECK (QNA_PUBLIC IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_QNA" ADD CHECK (QNA_STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "TB_QNA" ADD CHECK (QNA_CATEGORY IN('공간', '결제', '예약', '기타')) ENABLE;
  ALTER TABLE "TB_QNA" MODIFY ("QNA_GROUP" NOT NULL ENABLE);
  ALTER TABLE "TB_QNA" MODIFY ("QNA_MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_QNA" MODIFY ("QNA_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TB_QNA" MODIFY ("QNA_TITLE" NOT NULL ENABLE);
  ALTER TABLE "TB_QNA" MODIFY ("QNA_SPACE_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_QNA" MODIFY ("QNA_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "TB_QNA" MODIFY ("QNA_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_QNA" ADD CONSTRAINT "PK_TB_QNA" PRIMARY KEY ("QNA_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_REPORT
--------------------------------------------------------

  ALTER TABLE "TB_REPORT" MODIFY ("RPT_REF_CAT" NOT NULL ENABLE);
  ALTER TABLE "TB_REPORT" MODIFY ("RPT_REASON_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REPORT" MODIFY ("RPT_MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REPORT" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REPORT" MODIFY ("RPT_NO" NOT NULL ENABLE);
  ALTER TABLE "TB_REPORT" ADD CONSTRAINT "PK_TB_REPORT" PRIMARY KEY ("RPT_NO") ENABLE;
  ALTER TABLE "TB_REPORT" ADD CHECK (RPT_REF_CAT IN ('1', '2')) ENABLE;
  ALTER TABLE "TB_REPORT" MODIFY ("RPT_REF_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TB_BOOK
--------------------------------------------------------

  ALTER TABLE "TB_BOOK" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_BOOK_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_BOOK" ADD CONSTRAINT "FK_TB_PAYLIST_TO_TB_BOOK_1" FOREIGN KEY ("PL_ID")
	  REFERENCES "TB_PAYLIST" ("PL_ID") ENABLE;
  ALTER TABLE "TB_BOOK" ADD CONSTRAINT "FK_TB_SPACE_TO_TB_BOOK_1" FOREIGN KEY ("SPACE_NO")
	  REFERENCES "TB_SPACE" ("SPACE_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_CART
--------------------------------------------------------

  ALTER TABLE "TB_CART" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_CART_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_CART" ADD CONSTRAINT "FK_TB_SPACE_TO_TB_CART_1" FOREIGN KEY ("SPACE_NO")
	  REFERENCES "TB_SPACE" ("SPACE_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_COMMENT
--------------------------------------------------------

  ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_COMMENT_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "FK_TB_REVIEW_TO_TB_COMMENT_1" FOREIGN KEY ("RV_NO")
	  REFERENCES "TB_REVIEW" ("RV_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_FAQ
--------------------------------------------------------

  ALTER TABLE "TB_FAQ" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_FAQ_1" FOREIGN KEY ("FAQ_MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_LIKE
--------------------------------------------------------

  ALTER TABLE "TB_LIKE" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_LIKE_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_LIKE" ADD CONSTRAINT "FK_TB_SPACE_TO_TB_LIKE_1" FOREIGN KEY ("SPACE_NO")
	  REFERENCES "TB_SPACE" ("SPACE_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_LOVE
--------------------------------------------------------

  ALTER TABLE "TB_LOVE" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_LOVE_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_LOVE" ADD CONSTRAINT "FK_TB_SPACE_TO_TB_LOVE_1" FOREIGN KEY ("SPACE_NO")
	  REFERENCES "TB_SPACE" ("SPACE_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_MCP
--------------------------------------------------------

  ALTER TABLE "TB_MCP" ADD CONSTRAINT "FK_TB_COUPON_TO_TB_MCP_1" FOREIGN KEY ("CP_NO")
	  REFERENCES "TB_COUPON" ("CP_NO") ENABLE;
  ALTER TABLE "TB_MCP" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_MCP_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_MEMBER
--------------------------------------------------------

  ALTER TABLE "TB_MEMBER" ADD CONSTRAINT "FK_TB_GRADE_TO_TB_MEMBER_1" FOREIGN KEY ("GR_NO")
	  REFERENCES "TB_GRADE" ("GR_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_NOTICE
--------------------------------------------------------

  ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_NOTICE_1" FOREIGN KEY ("NT_MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_PAYLIST
--------------------------------------------------------

  ALTER TABLE "TB_PAYLIST" ADD CONSTRAINT "FK_TB_MCP_TO_TB_PAYLIST_1" FOREIGN KEY ("PL_MCP_NO")
	  REFERENCES "TB_MCP" ("MCP_NO") ENABLE;
  ALTER TABLE "TB_PAYLIST" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_PAYLIST_1" FOREIGN KEY ("PL_MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_QNA
--------------------------------------------------------

  ALTER TABLE "TB_QNA" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_QNA_1" FOREIGN KEY ("QNA_MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_QNA" ADD CONSTRAINT "FK_TB_QNA_TO_TB_QNA_1" FOREIGN KEY ("QNA_REF_NO")
	  REFERENCES "TB_QNA" ("QNA_NO") ENABLE;
  ALTER TABLE "TB_QNA" ADD CONSTRAINT "FK_TB_SPACE_TO_TB_QNA_1" FOREIGN KEY ("QNA_SPACE_NO")
	  REFERENCES "TB_SPACE" ("SPACE_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_REPORT
--------------------------------------------------------

  ALTER TABLE "TB_REPORT" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_REPORT_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_REPORT" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_REPORT_2" FOREIGN KEY ("RPT_MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_REPORT" ADD CONSTRAINT "FK_TB_RPT_RSN_TO_TB_REPORT_1" FOREIGN KEY ("RPT_REASON_NO")
	  REFERENCES "TB_RPT_RSN" ("RPT_REASON_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TB_REVIEW
--------------------------------------------------------

  ALTER TABLE "TB_REVIEW" ADD CONSTRAINT "FK_TB_BOOK_TO_TB_REVIEW_1" FOREIGN KEY ("BOOK_NO")
	  REFERENCES "TB_BOOK" ("BOOK_NO") ENABLE;
  ALTER TABLE "TB_REVIEW" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_REVIEW_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "TB_MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "TB_REVIEW" ADD CONSTRAINT "FK_TB_SPACE_TO_TB_REVIEW_1" FOREIGN KEY ("SPACE_NO")
	  REFERENCES "TB_SPACE" ("SPACE_NO") ENABLE;

commit;