
    
INSERT
  INTO TB_MEMBER
      (MEM_NO
     , GR_NO
     , MEM_ID
     , MEM_PWD
     , MEM_NAME
     , MEM_IDNO
     , MEM_PHONE
     , MEM_MAIL
     , MEM_PROFILE
     , MEM_ENROLL_DATE
     , MEM_MODIFY_DATE
     , MEM_STATUS
     , MEM_ADM_FLAG)
VALUES (
       SEQ_MEMNO.NEXTVAL
     , 1
     , 'admin'
     , 'project100WOW!'
     , '관리자'
     , '9401272'
     , '01088882222'
     , 'admin@gmail.com'
     , null 
     , sysdate
     , sysdate
     , 'Y'
     , 'U'
     ); 
     
-- 신고카테고리 이유 쌓기
INSERT
  INTO TB_RPT_RSN
      (
        RPT_REASON_NO
      , RPT_REASON  
        )
VALUES (
       1
     , '욕설 및 비방' 
     );
INSERT
  INTO TB_RPT_RSN
      (
        RPT_REASON_NO
      , RPT_REASON  
        )
VALUES (
       2
     , '성적이고 음란한 대화' 
     );
     
INSERT
  INTO TB_RPT_RSN
      (
        RPT_REASON_NO
      , RPT_REASON  
        )
VALUES (
       3
     , '스팸, 금전적 요구' 
     );

    
    COMMIT;

SELECT MEM_NO
			 , GR_NO
			 , MEM_ID
			 , MEM_PWD
			 , MEM_NAME
			 , MEM_IDNO
			 , MEM_PHONE
			 , MEM_MAIL
			 , MEM_PROFILE
			 , MEM_ENROLL_DATE
			 , MEM_MODIFY_DATE
			 , MEM_STATUS
             , MEM_ADM_FLAG
		  FROM TB_MEMBER
		 WHERE MEM_STATUS = 'Y'
		   AND MEM_ID = 'admin'
		   AND MEM_PWD = 'project100WOW!';
           
           
--- 중복체크용 sql
	SELECT
               COUNT(*) AS "COUNT"
		  FROM TB_MEMBER
		 WHERE MEM_ID = 'admin';
         
         
--- 아이디찾기용 sql
	SELECT MEM_ID
		  FROM TB_MEMBER
		 WHERE MEM_NAME = '유저일'
           AND MEM_PHONE= 01088881111;
         
         
--- 회원가입용 sql
INSERT
  INTO TB_MEMBER
      (MEM_NO
     , GR_NO
     , MEM_ID
     , MEM_PWD
     , MEM_NAME
     , MEM_IDNO
     , MEM_PHONE
     , MEM_MAIL
     , MEM_PROFILE
     , MEM_ENROLL_DATE
     , MEM_MODIFY_DATE
     , MEM_STATUS
     , MEM_ADM_FLAG)
VALUES (
       SEQ_MEMNO.NEXTVAL
     , 1
     , 'user01'
     , 'project100WOW!'
     , '박공주'
     , '960723'
     , '01066842537'
     , 'user01@gmail.com'
     , null 
     , sysdate
     , sysdate
     , 'Y'
     , 'U'
     );


     
-- 리뷰 쌓기
INSERT
  INTO TB_REVIEW
    (  RV_NO
     , BOOK_NO
     , SPACE_NO
     , MEM_NO
     , RV_CONTENT
     , RV_ENROLL_DATE
     , RV_MODIFY_DATE
     , RV_STAR
     , RV_STATUS
     )
VALUES
    (
      SEQ_RVNO.NEXTVAL
    , 1 
    , 2 
    , 2 
    , '환하고 사장님이 친절하고 좋았어용!' 
    , SYSDATE
    , SYSDATE
    , 4
    , 'Y'
    );
    
    
-- 신고용 데이터 쌓기
INSERT
  INTO TB_REPORT
    (  RPT_NO
     , MEM_NO
     , RPT_MEM_NO
     , RPT_REASON_NO
     , RPT_REF_CAT
     , RPT_REF_NO
     , RPT_DATE
     )
VALUES
    (
      SEQ_RPTNO.NEXTVAL
    , 8 -- 신고한 회원번호 > 생성완료!
    , 2 -- 신고당한 회원번호 > 생성완료!
    , 1 -- 신고 사유번호 (1,2,3)  > 생성완료!
    , 1 -- 글인지 댓글인지
    , 1 -- 글 카테고리 몇번글? 
    , SYSDATE
    );
    
-- 후기추천
INSERT
  INTO TB_LIKE
    (
       LIKE_NO
     , SPACE_NO
     , MEM_NO
     , LIKE_DATE
     )
VALUES
    (
       SEQ_LIKENO.NEXTVAL
     , 2
     , 2
     , SYSDATE
     );

-- 관리자 회원조회
SELECT MEM_NO
     , MEM_ID
     , MEM_NAME
     , MEM_PHONE
     , GR_NAME
     , (
        SELECT COUNT(*) AS "RPT_COUNT"
                       FROM TB_REPORT
                      WHERE MEM_NO = 8
        ) AS "RPT_COUNT"
     , (
        SELECT COUNT(*) AS "LIKE_COUNT"
                       FROM TB_LIKE
                      WHERE MEM_NO = 8
        )AS "LIKE_COUNT"
     , MEM_ADM_FLAG
     , MEM_STATUS
     , MEM_ENROLL_DATE
  FROM TB_MEMBER
  LEFT JOIN TB_GRADE USING (GR_NO)
  WHERE MEM_NO = 8;
     
 -------------------------------------------여기까지 완료----------------------------------------- 
 
 
 
 
 ------------------------------------------지미님이 주신거-----------------------------------------
 INSERT
  INTO TB_PAYLIST
   (
      PL_ID
    , PL_STATUS
    , PL_TID
    , PL_MEM_NO
    , PL_TYPE   
    , PL_AMOUNT 
    , PL_DISCOUNT_AMOUNT
    , PL_REQUEST_TIME
    , PL_APPROVED_TIME    
   )
VALUES
   ( 
      SEQ_PLNO.NEXTVAL
     , 'Y'
     , '123456DF'
     , 2
     , 'CARD'
     , '56000'
     , '51000'
     , SYSDATE
     , SYSDATE     
   );
-- 예약테이블 (1)
INSERT
  INTO TB_BOOK
    (
      BOOK_NO
    , SPACE_NO
    , MEM_NO
    , PL_ID
    , BOOK_COUNT
    , BOOK_DATE
    , BOOK_IN
    , BOOK_OUT
    , BOOK_PRICE
    , BOOK_NAME
    , BOOK_PHONE
    , BOOK_EMAIL
    , BOOK_PURPOSE
    , BOOK_ADD_CONTENT
    , BOOK_CAR
    , BOOK_ANIMAL
    , BOOK_CHAIR
    , BOOK_STAND
    , BOOK_CREATE_DATE
    , BOOK_MODIFY_DATE
    , BOOK_STATUS
    , BOOK_CATEGORY
    , BOOK_CANCEL_REASON
    , BOOK_CANCEL_CONTENT
      
    )
 VALUES
    (
       SEQ_BONO.nextval
     , 2
     , 2
     , SEQ_PLNO.CURRVAL
     , 5
     , '2022.07.27'
     , '09'
     , '17'
     , '51000'
     , '홍길동'
     , '01056265892'
     , 'wlalcjstk789@naver.com'
     , '프로필사진촬영'
     , '코로나땜에 걱정되어서요. 환기30분 부탁해요. 감사해요'
     , 'Y'
     , 'N'
     , 'Y'
     , 'N'
     , SYSDATE
     , SYSDATE
     , 'Y'
     , '예약확정'
     , NULL
     , NULL
     );
   
 -- 결제 (2)  
   INSERT
  INTO TB_PAYLIST
   (
      PL_ID
    , PL_STATUS
    , PL_TID
    , PL_MEM_NO
    , PL_TYPE   
    , PL_AMOUNT
    , PL_DISCOUNT_AMOUNT
    , PL_REQUEST_TIME
    , PL_APPROVED_TIME    
   )
VALUES
   ( 
       SEQ_PLNO.NEXTVAL
     , 'Y'
     , '123456DF'
     , 2
     , 'CARD'
     , '10000'
     , '10000'
     , SYSDATE
     , SYSDATE     
   );
   
  -- 예약 (2)
  INSERT
  INTO TB_BOOK
    (
      BOOK_NO
    , SPACE_NO
    , MEM_NO
    , PL_ID
    , BOOK_COUNT
    , BOOK_DATE
    , BOOK_IN
    , BOOK_OUT
    , BOOK_PRICE
    , BOOK_NAME
    , BOOK_PHONE
    , BOOK_EMAIL
    , BOOK_PURPOSE
    , BOOK_ADD_CONTENT
    , BOOK_CAR
    , BOOK_ANIMAL
    , BOOK_CHAIR
    , BOOK_STAND
    , BOOK_CREATE_DATE
    , BOOK_MODIFY_DATE
    , BOOK_STATUS
    , BOOK_CATEGORY
    , BOOK_CANCEL_REASON
    , BOOK_CANCEL_CONTENT
      
    )
 VALUES
    (
       SEQ_BONO.nextval
     , 3
     , 2
     , SEQ_PLNO.CURRVAL
     , 8
     , '2022.05.27'
     , '12'
     , '13'
     , '10000'
     , '김지민'
     , '01056265892'
     , 'wlalcjstk789@naver.com'
     , '프로필사진촬영'
     , '의자3개필요해요'
     , 'N'
     , 'N'
     , 'Y'
     , 'Y'
     , '2022.05.26'
     , '2022.05.26'
     , 'Y'
     , '예약확정'
     , NULL
     , NULL
     );
     
     
     -- 결제(3)   
   INSERT
  INTO TB_PAYLIST
   (
      PL_ID
    , PL_STATUS
    , PL_TID
    , PL_MEM_NO
    , PL_TYPE   
    , PL_AMOUNT   
    , PL_DISCOUNT_AMOUNT
    , PL_REQUEST_TIME
    , PL_APPROVED_TIME    
   )
VALUES
   ( 
       SEQ_PLNO.NEXTVAL
     , 'Y'
     , '12DFG6DF'
     , 2
     , 'CARD'
     , '65000'
     , '60000'
     , SYSDATE
     , SYSDATE     
   );
   -- 예약(3)
   INSERT
  INTO TB_BOOK
    (
      BOOK_NO
    , SPACE_NO
    , MEM_NO
    , PL_ID
    , BOOK_COUNT
    , BOOK_DATE
    , BOOK_IN
    , BOOK_OUT
    , BOOK_PRICE
    , BOOK_NAME
    , BOOK_PHONE
    , BOOK_EMAIL
    , BOOK_PURPOSE
    , BOOK_ADD_CONTENT
    , BOOK_CAR
    , BOOK_ANIMAL
    , BOOK_CHAIR
    , BOOK_STAND
    , BOOK_CREATE_DATE
    , BOOK_MODIFY_DATE
    , BOOK_STATUS
    , BOOK_CATEGORY
    , BOOK_CANCEL_REASON
    , BOOK_CANCEL_CONTENT
      
    )
 VALUES
    (
       SEQ_BONO.nextval
     , 8
     , 2
     , SEQ_PLNO.CURRVAL
     , 8
     , '2022.08.27'
     , '12'
     , '13'
     , '60000'
     , '강민'
     , '01056265892'
     , 'wlalcjstk789@naver.com'
     , '바디프로필사진촬영'
     , '의자3개필요해요'
     , 'N'
     , 'N'
     , 'Y'
     , 'N'
     , '2022.06.26'
     , '2022.07.26'
     , 'N'
     , '예약취소'
     , '일정취소및변경'
     , '다이어트포기로 인해 바디프로필사진은 취소했습니다 ㅎㅎ'
     );
   
   
   -- 결제(4)   
     INSERT
  INTO TB_PAYLIST
   (
      PL_ID
    , PL_STATUS
    , PL_TID
    , PL_MEM_NO
    , PL_TYPE   
    , PL_AMOUNT 
    , PL_DISCOUNT_AMOUNT
    , PL_REQUEST_TIME
    , PL_APPROVED_TIME    
   )
VALUES
   ( 
       SEQ_PLNO.NEXTVAL
     , 'Y'
     , '56DGGDF'
     , 2
     , 'CARD'
     , '50800'
     , '50800'
     , SYSDATE
     , SYSDATE     
   );
   
-- 예약(4)
    INSERT
  INTO TB_BOOK
    (
      BOOK_NO
    , SPACE_NO
    , MEM_NO
    , PL_ID
    , BOOK_COUNT
    , BOOK_DATE
    , BOOK_IN
    , BOOK_OUT
    , BOOK_PRICE
    , BOOK_NAME
    , BOOK_PHONE
    , BOOK_EMAIL
    , BOOK_PURPOSE
    , BOOK_ADD_CONTENT
    , BOOK_CAR
    , BOOK_ANIMAL
    , BOOK_CHAIR
    , BOOK_STAND
    , BOOK_CREATE_DATE
    , BOOK_MODIFY_DATE
    , BOOK_STATUS
    , BOOK_CATEGORY
    , BOOK_CANCEL_REASON
    , BOOK_CANCEL_CONTENT
      
    )
 VALUES
    (
       SEQ_BONO.nextval
     , 10
     , 2
     , SEQ_PLNO.CURRVAL
     , 3
     , '2022.07.07'
     , '10'
     , '13'
     , '50800'
     , '김개식'
     , '01056265892'
     , 'wlal0512@naver.com'
     , '가족사진'
     , null
     , 'Y'
     , 'Y'
     , 'Y'
     , 'N'
     , '2022.06.26'
     , '2022.06.26'
     , 'Y'
     , '예약확정'
     , NULL
     , NULL
     );
   
-- 결제(5)   
     INSERT
  INTO TB_PAYLIST
   (
      PL_ID
    , PL_STATUS
    , PL_TID
    , PL_MEM_NO
    , PL_TYPE   
    , PL_AMOUNT 
    , PL_DISCOUNT_AMOUNT
    , PL_REQUEST_TIME
    , PL_APPROVED_TIME    
   )
VALUES
   ( 
       SEQ_PLNO.NEXTVAL
     , 'Y'
     , '86DGGDF'
     , 2
     , 'CARD'
     , '80000'
     , '70000'
     , SYSDATE
     , SYSDATE     
   );
   
    INSERT
  INTO TB_BOOK
    (
      BOOK_NO
    , SPACE_NO
    , MEM_NO
    , PL_ID
    , BOOK_COUNT
    , BOOK_DATE
    , BOOK_IN
    , BOOK_OUT
    , BOOK_PRICE
    , BOOK_NAME
    , BOOK_PHONE
    , BOOK_EMAIL
    , BOOK_PURPOSE
    , BOOK_ADD_CONTENT
    , BOOK_CAR
    , BOOK_ANIMAL
    , BOOK_CHAIR
    , BOOK_STAND
    , BOOK_CREATE_DATE
    , BOOK_MODIFY_DATE
    , BOOK_STATUS
    , BOOK_CATEGORY
    , BOOK_CANCEL_REASON
    , BOOK_CANCEL_CONTENT
      
    )
 VALUES
    (
       SEQ_BONO.nextval
     , 9
     , 2
     , SEQ_PLNO.CURRVAL
     , 3
     , '2022.08.07'
     , '10'
     , '13'
     , '70000'
     , '김개식'
     , '01056265892'
     , 'wlal0512@naver.com'
     , '친구들과의 모임'
     , null
     , 'Y'
     , 'Y'
     , 'Y'
     , 'N'
     , '2022.07.27'
     , '2022.07.27'
     , 'Y'
     , '예약확정'
     , NULL
     , NULL
     );
     
     
     -- 결제(6)   
     INSERT
  INTO TB_PAYLIST
   (
      PL_ID
    , PL_STATUS
    , PL_TID
    , PL_MEM_NO
    , PL_TYPE   
    , PL_AMOUNT 
    , PL_DISCOUNT_AMOUNT
    , PL_REQUEST_TIME
    , PL_APPROVED_TIME    
   )
VALUES
   ( 
       SEQ_PLNO.NEXTVAL
     , 'Y'
     , '135fgcvDF'
     , 2
     , 'CARD'
     , '80000'
     , '70000'
     , SYSDATE
     , SYSDATE     
   );
   
    INSERT
  INTO TB_BOOK
    (
      BOOK_NO
    , SPACE_NO
    , MEM_NO
    , PL_ID
    , BOOK_COUNT
    , BOOK_DATE
    , BOOK_IN
    , BOOK_OUT
    , BOOK_PRICE
    , BOOK_NAME
    , BOOK_PHONE
    , BOOK_EMAIL
    , BOOK_PURPOSE
    , BOOK_ADD_CONTENT
    , BOOK_CAR
    , BOOK_ANIMAL
    , BOOK_CHAIR
    , BOOK_STAND
    , BOOK_CREATE_DATE
    , BOOK_MODIFY_DATE
    , BOOK_STATUS
    , BOOK_CATEGORY
    , BOOK_CANCEL_REASON
    , BOOK_CANCEL_CONTENT
      
    )
 VALUES
    (
       SEQ_BONO.nextval
     , 4
     , 2
     , SEQ_PLNO.CURRVAL
     , 3
     , '2022.09.07'
     , '13'
     , '19'
     , '80000'
     , '김개식'
     , '01056265892'
     , 'wlal0512@naver.com'
     , '친구들과의 모임'
     , null
     , 'Y'
     , 'N'
     , 'Y'
     , 'N'
     , '2022.07.27'
     , '2022.07.27'
     , 'Y'
     , '예약확정'
     , NULL
     , NULL
     );
     
     
        -- 결제(7)   
     INSERT
  INTO TB_PAYLIST
   (
      PL_ID
    , PL_STATUS
    , PL_TID
    , PL_MEM_NO
    , PL_TYPE   
    , PL_AMOUNT 
    , PL_DISCOUNT_AMOUNT
    , PL_REQUEST_TIME
    , PL_APPROVED_TIME    
   )
VALUES
   ( 
       SEQ_PLNO.NEXTVAL
     , 'Y'
     , '535fgcvDF'
     , 2
     , 'CARD'
     , '30000'
     , '30000'
     , SYSDATE
     , SYSDATE     
   );
   
    INSERT
  INTO TB_BOOK
    (
      BOOK_NO
    , SPACE_NO
    , MEM_NO
    , PL_ID
    , BOOK_COUNT
    , BOOK_DATE
    , BOOK_IN
    , BOOK_OUT
    , BOOK_PRICE
    , BOOK_NAME
    , BOOK_PHONE
    , BOOK_EMAIL
    , BOOK_PURPOSE
    , BOOK_ADD_CONTENT
    , BOOK_CAR
    , BOOK_ANIMAL
    , BOOK_CHAIR
    , BOOK_STAND
    , BOOK_CREATE_DATE
    , BOOK_MODIFY_DATE
    , BOOK_STATUS
    , BOOK_CATEGORY
    , BOOK_CANCEL_REASON
    , BOOK_CANCEL_CONTENT
      
    )
 VALUES
    (
       SEQ_BONO.nextval
     , 4
     , 2
     , SEQ_PLNO.CURRVAL
     , 3
     , '2022.08.17'
     , '10'
     , '12'
     , '30000'
     , '김개식'
     , '01056265892'
     , 'wlal0512@naver.com'
     , '친구들과의 모임'
     , null
     , 'Y'
     , 'N'
     , 'Y'
     , 'N'
     , '2022.07.27'
     , '2022.07.27'
     , 'Y'
     , '예약확정'
     , NULL
     , NULL
     );
 COMMIT;
   ------------------------------------------------------------------------------------------

GRANT CREATE VIEW TO SPACEFIT;

SELECT MEM_NO
		     , MEM_ID
		     , MEM_NAME
		     , MEM_IDNO 
		     , MEM_PHONE
		     , MEM_MAIL
		     , GR_NAME
		     , (
		        SELECT COUNT(*) AS "BOOK_COUNT"
		                       FROM TB_BOOK B1
		                      WHERE B1.MEM_NO = MEM.MEM_NO
		        )AS "BOOK_COUNT_ALL"
		     , (
		        SELECT COUNT(*) AS "BOOK_COUNT_MONTH"
		                       FROM TB_BOOK B2
		                      WHERE B2.MEM_NO = MEM.MEM_NO
		                        AND BOOK_DATE BETWEEN TO_DATE('2022.05.01', 'YYYY.MM.DD') 
		                                          AND TO_DATE('2022-07-28', 'YYYY.MM.DD')
		        )AS "BOOK_COUNT_MONTH"
		     , (
		            SELECT SUM(BOOK_PRICE)
		              FROM TB_BOOK B3
		              WHERE B3.MEM_NO = MEM.MEM_NO
		            )AS "BOOK_AMOUNT_ALL"
		     , (
		         SELECT SUM(BOOK_PRICE)
		           FROM TB_BOOK B4
		          WHERE B4.MEM_NO = MEM.MEM_NO
		            AND BOOK_DATE BETWEEN TO_DATE('2022.05.01', 'YYYY.MM.DD') 
		                              AND TO_DATE('2022-07-28', 'YYYY.MM.DD')
		        )AS "BOOK_AMOUNT_MONTH"
		     , (
		        SELECT COUNT(*) AS "RPT_COUNT"
		                       FROM TB_REPORT R
		                      WHERE R.MEM_NO = MEM.MEM_NO
		        ) AS "RPT_COUNT"
		     , (
		        SELECT COUNT(*) AS "LIKE_COUNT"
		                       FROM TB_LIKE L
		                      WHERE L.MEM_NO = MEM.MEM_NO
		        )AS "LIKE_COUNT"
		     , MEM_STATUS
		     , MEM_ADM_FLAG
		     , MEM_ENROLL_DATE
		     , MEM_MODIFY_DATE
		  FROM TB_MEMBER MEM
		  LEFT JOIN TB_GRADE USING (GR_NO);


commit;
-- 전체회원수 조회 뷰
SELECT COUNT(*) AS "MEM_ALL_COUNT"
FROM TB_MEMBER;

CREATE OR REPLACE VIEW VW_MEM_ALL_COUNT
AS SELECT COUNT(*) AS "MEM_ALL_COUNT"
FROM TB_MEMBER;        

SELECT * 
FROM VW_MEM_ALL_COUNT;  



-- 누적 신고
SELECT COUNT(*) AS "RPT_COUNT"
FROM TB_REPORT
WHERE MEM_NO = 8;


  
-- 누적 추천
SELECT COUNT(*) AS "LIKE_COUNT"
FROM TB_LIKE
WHERE MEM_NO = 2; 





CREATE OR REPLACE VIEW VW_BOOK_AMT_COUNT
AS SELECT COUNT(*) AS "BOOK_AMT_COUNT"
FROM TB_BOOK
JOIN TB_MEMBER USING (MEM_NO);  


-- 누적주문액 / 전체
SELECT SUM(BOOK_PRICE)
FROM TB_BOOK
JOIN TB_MEMBER USING (MEM_NO)
WHERE MEM_NO = 2;

SELECT SUM(BOOK_PRICE)
FROM TB_BOOK
JOIN TB_MEMBER USING (MEM_NO)
WHERE MEM_NO = 2
AND BOOK_DATE BETWEEN TO_DATE('2022.05.01', 'YYYY.MM.DD') 
                   AND TO_DATE('2022-07-28', 'YYYY.MM.DD');  


-- 누적주문건 / 전체
SELECT COUNT(*) AS "BOOK_COUNT"
FROM TB_BOOK
WHERE MEM_NO = 2;               
                   
-- 누적주문건 / 월별
SELECT COUNT(*) AS "BOOK_COUNT"
FROM TB_BOOK
WHERE MEM_NO = 2
AND BOOK_DATE BETWEEN TO_DATE('2022.05.01', 'YYYY.MM.DD') 
                   AND TO_DATE('2022-07-28', 'YYYY.MM.DD');



COMMIT;






SELECT MEM_NO
     , MEM_ID
     , MEM_NAME
     , MEM_IDNO 
     , MEM_PHONE
     , MEM_MAIL
     , GR_NAME
     , MEM_STATUS
     , MEM_ADM_FLAG
     , MEM_ENROLL_DATE
     , MEM_MODIFY_DATE
     , (
        SELECT COUNT(*) AS "BOOK_COUNT"
                       FROM TB_BOOK B1
                      WHERE B1.MEM_NO = MEM.MEM_NO
        )AS "BOOK_COUNT_ALL"
    , (
        SELECT COUNT(*) AS "BOOK_COUNT_MONTH"
                       FROM TB_BOOK B2
                      WHERE B2.MEM_NO = MEM.MEM_NO
                        AND BOOK_DATE BETWEEN TO_DATE('2022.05.01', 'YYYY.MM.DD') 
                                          AND TO_DATE('2022-07-28', 'YYYY.MM.DD')
        )AS "BOOK_COUNT_MONTH"
  FROM TB_MEMBER MEM
  LEFT JOIN TB_GRADE USING (GR_NO);
  
  
  
  (
        SELECT COUNT(*) AS "BOOK_COUNT"
                       FROM TB_BOOK B
                      WHERE B.MEM_NO = MEM.MEM_NO
        )AS "BOOK_COUNT_ALL"

(
        SELECT COUNT(*) AS "BOOK_COUNT_MONTH"
                       FROM TB_BOOK
                      WHERE MEM_NO =11
                        AND BOOK_DATE BETWEEN TO_DATE('2022.05.01', 'YYYY.MM.DD') 
                                          AND TO_DATE('2022-07-28', 'YYYY.MM.DD')
        )AS "BOOK_COUNT_MONTH"
     , (
            SELECT SUM(BOOK_PRICE)
              FROM TB_BOOK
              JOIN TB_MEMBER USING (MEM_NO)
             WHERE MEM_NO = 11
            )AS "BOOK_AMOUNT_ALL"
     , (
         SELECT SUM(BOOK_PRICE)
           FROM TB_BOOK
           JOIN TB_MEMBER USING (MEM_NO)
          WHERE MEM_NO = 11
            AND BOOK_DATE BETWEEN TO_DATE('2022.05.01', 'YYYY.MM.DD') 
                              AND TO_DATE('2022-07-28', 'YYYY.MM.DD')
        )AS "BOOK_AMOUNT_MONTH"
     , (
        SELECT COUNT(*) AS "RPT_COUNT"
                       FROM TB_REPORT
                      WHERE MEM_NO = 11
        ) AS "RPT_COUNT"
     , (
        SELECT COUNT(*) AS "LIKE_COUNT"
                       FROM TB_LIKE
                      WHERE MEM_NO = 11
        )AS "LIKE_COUNT"


     
     