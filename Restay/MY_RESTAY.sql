-- 회원 테이블
CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(30)		NULL,
	"MEMBER_PW"	VARCHAR2(30)		NULL,
	"MEMBER_ROLE"	VARCHAR2(30)		NULL,
	"MEMBER_NAME"	VARCHAR2(30)		NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NULL,
	"MEMBER_PHONE"	VARCHAR2(11)		NULL,
	"MEMBER_ED"	DATE		NULL,
	"MEMBER_MD"	DATE		NULL,
	"MEMBER_STATUS"	VARCHAR2(3)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원아이디';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ROLE" IS '회원타입';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE" IS '전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ED" IS '회원가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_MD" IS '회원수정일';

COMMENT ON COLUMN "MEMBER"."MEMBER_STATUS" IS '회원상태';

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'MEMBER';

ALTER TABLE MEMBER DROP CONSTRAINT SYS_C008474;
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK PRIMARY KEY (MEMBER_NO);
ALTER TABLE MEMBER MODIFY MEMBER_STATUS DEFAULT 'Y';
ALTER TABLE MEMBER MODIFY MEMBER_ROLE DEFAULT 'ROLE_USER';
ALTER TABLE MEMBER MODIFY MEMBER_ED DEFAULT SYSDATE;
ALTER TABLE MEMBER MODIFY MEMBER_MD DEFAULT SYSDATE;
ALTER TABLE MEMBER MODIFY MEMBER_PW VARCHAR2(300);

CREATE SEQUENCE SEQ_MEMBER_NO;

select *
from member
where member_no = 41;

SELECT MEMBER_NO,
       MEMBER_ID,
       MEMBER_PW,
       MEMBER_ROLE,
       MEMBER_NAME,
       MEMBER_EMAIL,
       MEMBER_PHONE,
       MEMBER_ED,
       MEMBER_MD,
       MEMBER_STATUS
FROM MEMBER
WHERE MEMBER_ID = 'admin';

select *
from member
where LOWER(MEMBER_ID) = LOWER('test02');


INSERT INTO MEMBER
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'admin', '1234', 'ROLE_ADMIN', '관리자', 'NULL', 'NULL', SYSDATE, SYSDATE, 'Y');

INSERT INTO MEMBER
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'test04', '1234', 'ROLE_user', 'test04', 'NULL', 'NULL', SYSDATE, SYSDATE, 'Y');

INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'lee0101', 'hello1234', '이무기', '01012341234');

-- 숙소 테이블
DELETE FROM HOUSE;

ALTER TABLE HOUSE ADD CONSTRAINT H_CODE_PK PRIMARY KEY (H_CODE);

SELECT COUNT(*)
FROM HOUSE;

SELECT H_CODE,
       H_NAME,
       H_ADDRESS,
       H_TEL,
       H_EMAIL,
       LIKE_STATE,
       H_IMG,
       H_AREA,
       H_ENROLLDATE,
       H_STATUS,
       H_SIGUNGU
FROM HOUSE
WHERE H_STATUS = 'Y';

-- 지역코드 테이블
CREATE TABLE AREAINFO (
    AREA_CODE NUMBER,
    AREA_NAME VARCHAR2(30),
    SIGUNGU_CODE NUMBER,
    SIGUNGU_NAME VARCHAR2(30)
);

SELECT DISTINCT AREA_CODE,
       AREA_NAME,
       SIGUNGU_CODE,
       SIGUNGU_NAME
FROM AREAINFO;


SELECT SIGUNGU_CODE,
       SIGUNGU_NAME
FROM AREAINFO
WHERE AREA_CODE = 3;

-- 숙소 테이블
CREATE SEQUENCE SEQ_HOUSE_CODE;

SELECT TO_CHAR(H_MIN_PRICE, 'FML999,999,999')
FROM HOUSE;

-- 숙소 이미지 테이블
CREATE TABLE HOUSE_IMAGE(
    H_CODE VARCHAR2(30),
    H_IMAGE_CODE VARCHAR2(30),
    H_IMAGE_ORIGINALFILENAME VARCHAR2(4000),
    H_IMAGE_RENAMEDFILENAME VARCHAR2(4000),
    CONSTRAINT PK_H_CODE_IMAGE_CODE PRIMARY KEY (H_CODE, H_IMAGE_CODE)
);

CREATE SEQUENCE SEQ_HOUSE_IMG_CODE;

COMMENT ON COLUMN "HOUSE_IMAGE"."H_CODE" IS '숙소 코드';
COMMENT ON COLUMN "HOUSE_IMAGE"."H_IMAGE_CODE" IS '숙소 이미지 코드';
COMMENT ON COLUMN "HOUSE_IMAGE"."H_IMAGE_ORIGINALFILENAME" IS '숙소 오리지널 파일';
COMMENT ON COLUMN "HOUSE_IMAGE"."H_IMAGE_RENAMEDFILENAME" IS '숙소 리네임드 파일';

INSERT INTO HOUSE_IMAGE
(
    H_CODE,
    H_IMAGE_CODE,
    H_IMAGE_ORIGINALFILENAME,
    H_IMAGE_RENAMEDFILENAME
)
VALUES
(
    'H15',
    'HIMG' || SEQ_HOUSE_IMG_CODE.NEXTVAL,
    'TEST.JPG',
    '20240426TEST.JPG'
);

-- 숙소 조회(숙소만)
SELECT H_CODE,
       H_NAME,
       H_ADDRESS,
       H_TEL,
       H_EMAIL,
       LIKE_STATE,
       H_AREA,
       H_ENROLLDATE,
       H_STATUS,
       H_SIGUNGU,
       H_MIN_PRICE
FROM HOUSE
WHERE H_STATUS = 'Y'
ORDER BY H_ENROLLDATE DESC;

-- 숙소 조회(이미지 포함)
SELECT RNUM,
       H_CODE,
       H_NAME,
       H_ADDRESS,
       H_TEL,
       H_EMAIL,
       LIKE_STATE,
       H_AREA,
       H_ENROLLDATE,
       H_STATUS,
       H_SIGUNGU,
       H_MIN_PRICE,
       HI_H_IMAGE_CODE,
       HI_H_IMAGE_ORIGINALFILENAME,
       HI_H_IMAGE_RENAMEDFILENAME
FROM
(
    SELECT ROWNUM AS RNUM,
           H_CODE,
           H_NAME,
           H_ADDRESS,
           H_TEL,
           H_EMAIL,
           LIKE_STATE,
           H_AREA,
           H_ENROLLDATE,
           H_STATUS,
           H_SIGUNGU,
           H_MIN_PRICE,
           HI_H_IMAGE_CODE,
           HI_H_IMAGE_ORIGINALFILENAME,
           HI_H_IMAGE_RENAMEDFILENAME
    FROM
    (
        SELECT H.H_CODE,
               H.H_NAME,
               H.H_ADDRESS,
               H.H_TEL,
               H.H_EMAIL,
               H.LIKE_STATE,
               H.H_AREA,
               H.H_ENROLLDATE,
               H.H_STATUS,
               H.H_SIGUNGU,
               H.H_MIN_PRICE,
               HI.H_IMAGE_CODE AS HI_H_IMAGE_CODE,
               HI.H_IMAGE_ORIGINALFILENAME AS HI_H_IMAGE_ORIGINALFILENAME,
               HI.H_IMAGE_RENAMEDFILENAME AS HI_H_IMAGE_RENAMEDFILENAME
        FROM HOUSE H
        LEFT OUTER JOIN HOUSE_IMAGE HI ON (H.H_CODE = HI.H_CODE)
        WHERE H.H_STATUS = 'Y'
        ORDER BY H_IMAGE_RENAMEDFILENAME DESC
    )
)
WHERE H_STATUS = 'Y'
  AND RNUM BETWEEN 1 AND 10;


SELECT H.H_CODE,
       H.H_NAME,
       H.H_ADDRESS,
       H.H_TEL,
       H.H_EMAIL,
       H.LIKE_STATE,
       H.H_AREA,
       H.H_ENROLLDATE,
       H.H_STATUS,
       H.H_SIGUNGU,
       H.H_MIN_PRICE,
       HI.H_IMAGE_CODE AS HI_H_IMAGE_CODE,
       HI.H_IMAGE_ORIGINALFILENAME AS HI_H_IMAGE_ORIGINALFILENAME,
       HI.H_IMAGE_RENAMEDFILENAME AS HI_H_IMAGE_RENAMEDFILENAME
FROM HOUSE H
LEFT OUTER JOIN HOUSE_IMAGE HI ON (H.H_CODE = HI.H_CODE)
WHERE H.H_STATUS = 'Y'
ORDER BY H_IMAGE_RENAMEDFILENAME DESC;

SELECT H.H_CODE,
       H.H_NAME,
       H.H_ADDRESS,
       H.H_TEL,
       H.H_EMAIL,
       H.LIKE_STATE,
       H.H_AREA,
       H.H_ENROLLDATE,
       H.H_STATUS,
       H.H_SIGUNGU,
       TO_CHAR(H.H_MIN_PRICE, 'FML999,999,999') AS H_MIN_PRICE,
       HI.H_IMAGE_CODE AS HI_H_IMAGE_CODE,
       HI.H_IMAGE_ORIGINALFILENAME AS HI_H_IMAGE_ORIGINALFILENAME,
       HI.H_IMAGE_RENAMEDFILENAME AS HI_H_IMAGE_RENAMEDFILENAME
FROM HOUSE H
LEFT OUTER JOIN HOUSE_IMAGE HI ON (H.H_CODE = HI.H_CODE)
WHERE H.H_CODE IN ('H21', 'H22', 'H23', 'H41', 'H42', 'H43', 'H44', 'H45', 'H46', 'H47')
ORDER BY H_IMAGE_RENAMEDFILENAME;

-- 숙소 이미지 조회
SELECT H_CODE,
       H_IMAGE_CODE,
       H_IMAGE_ORIGINALFILENAME,
       H_IMAGE_RENAMEDFILENAME
FROM HOUSE_IMAGE;

-- 고객센터 테이블
CREATE TABLE "CUSTOMER" (
	"CUSTOMER_NO"	NUMBER		NOT NULL,
	"CUSTOMER_TITLE"	VARCHAR2(100)		NULL,
	"CUSTOMER_CATEGORY"	VARCHAR2(50)		NULL,
	"CUSTOMER_ENROLLDATE"	DATE		NULL,
	"CUSTOMER_MODIFYDATE"	DATE		NULL,
	"CUSTOMER_CONTENT"	VARCHAR2(2000)		NULL,
	"CUSTOMER_ORIGINALFILENAME"	VARCHAR2(500)		NULL,
	"CUSTOMER_RENAMEDFILENAME"	VARCHAR2(500)		NULL,
	"CUSTOMER_COUNT"	NUMBER		NULL,
	"CUSTOMER_STATUS"	CHAR(2)		NULL,
    CONSTRAINT CUSTOMER_NO_PK PRIMARY KEY (CUSTOMER_NO) 
);

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_NO" IS '고객센터 번호';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_TITLE" IS '고객센터 제목';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_CATEGORY" IS '카테고리';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_ENROLLDATE" IS '등록일';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_MODIFYDATE" IS '수정일';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_CONTENT" IS '내용';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_ORIGINALFILENAME" IS '원본파일';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_RENAMEDFILENAME" IS '변경파일';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_COUNT" IS '조회수';

COMMENT ON COLUMN "CUSTOMER"."CUSTOMER_STATUS" IS '상태';

ALTER TABLE CUSTOMER MODIFY CUSTOMER_ENROLLDATE DEFAULT SYSDATE;
ALTER TABLE CUSTOMER MODIFY CUSTOMER_MODIFYDATE DEFAULT SYSDATE;
ALTER TABLE CUSTOMER MODIFY CUSTOMER_STATUS VARCHAR2(3);
ALTER TABLE CUSTOMER MODIFY CUSTOMER_STATUS DEFAULT 'Y';
ALTER TABLE CUSTOMER MODIFY CUSTOMER_COUNT DEFAULT 0;

CREATE SEQUENCE SEQ_CUSTOMER_NO;

-- 고객센터 (전체 리스트)
SELECT C.CUSTOMER_NO,
       C.CUSTOMER_TITLE,
       C.CUSTOMER_CATEGORY,
       C.CUSTOMER_ENROLLDATE,
       C.CUSTOMER_MODIFYDATE,
       C.CUSTOMER_CONTENT,
       C.CUSTOMER_ORIGINALFILENAME,
       C.CUSTOMER_RENAMEDFILENAME,
       C.CUSTOMER_COUNT,
       C.CUSTOMER_STATUS,
       C.MEMBER_NO,
       M.MEMBER_ID
FROM CUSTOMER C
LEFT OUTER JOIN MEMBER M ON (C.MEMBER_NO = M.MEMBER_NO)
WHERE CUSTOMER_STATUS = 'Y'
ORDER BY CUSTOMER_ENROLLDATE DESC;

-- 고객센터 (공지사항 리스트)
SELECT C.CUSTOMER_NO,
       C.CUSTOMER_TITLE,
       C.CUSTOMER_CATEGORY,
       C.CUSTOMER_ENROLLDATE,
       C.CUSTOMER_MODIFYDATE,
       C.CUSTOMER_CONTENT,
       C.CUSTOMER_ORIGINALFILENAME,
       C.CUSTOMER_RENAMEDFILENAME,
       C.CUSTOMER_COUNT,
       C.CUSTOMER_STATUS,
       C.MEMBER_NO,
       M.MEMBER_ID
FROM CUSTOMER C
LEFT OUTER JOIN MEMBER M ON (C.MEMBER_NO = M.MEMBER_NO)
WHERE CUSTOMER_STATUS = 'Y' 
  AND CUSTOMER_CATEGORY = '[공지사항]'
ORDER BY CUSTOMER_ENROLLDATE DESC;

-- 고객센터 (자유게시판 리스트)
SELECT C.CUSTOMER_NO,
       C.CUSTOMER_TITLE,
       C.CUSTOMER_CATEGORY,
       C.CUSTOMER_ENROLLDATE,
       C.CUSTOMER_MODIFYDATE,
       C.CUSTOMER_CONTENT,
       C.CUSTOMER_ORIGINALFILENAME,
       C.CUSTOMER_RENAMEDFILENAME,
       C.CUSTOMER_COUNT,
       C.CUSTOMER_STATUS,
       C.MEMBER_NO,
       M.MEMBER_ID
FROM CUSTOMER C
LEFT OUTER JOIN MEMBER M ON (C.MEMBER_NO = M.MEMBER_NO)
WHERE CUSTOMER_STATUS = 'Y' 
  AND CUSTOMER_CATEGORY = '[자유게시판]'
ORDER BY CUSTOMER_ENROLLDATE DESC;

-- 고객센터 (자주 묻는 질문 리스트)
SELECT C.CUSTOMER_NO,
       C.CUSTOMER_TITLE,
       C.CUSTOMER_CATEGORY,
       C.CUSTOMER_ENROLLDATE,
       C.CUSTOMER_MODIFYDATE,
       C.CUSTOMER_CONTENT,
       C.CUSTOMER_ORIGINALFILENAME,
       C.CUSTOMER_RENAMEDFILENAME,
       C.CUSTOMER_COUNT,
       C.CUSTOMER_STATUS,
       C.MEMBER_NO,
       M.MEMBER_ID
FROM CUSTOMER C
LEFT OUTER JOIN MEMBER M ON (C.MEMBER_NO = M.MEMBER_NO)
WHERE CUSTOMER_STATUS = 'Y' 
  AND CUSTOMER_CATEGORY = '[자주 묻는 질문]'
ORDER BY CUSTOMER_ENROLLDATE DESC;

SELECT COUNT(*)
FROM CUSTOMER
WHERE CUSTOMER_STATUS = 'Y'
AND CUSTOMER_CATEGORY = '[공지사항]';

SELECT COUNT(*)
FROM CUSTOMER
WHERE CUSTOMER_CATEGORY = '[1:1문의]';

-- 댓글 테이블
CREATE TABLE REPLY (
    REPLY_NO VARCHAR2(30),
    CUSTOMER_NO VARCHAR2(30),
    WRITER_NO NUMBER,
    REPLY_CONTENT VARCHAR2(2000),
    REPLY_STATUS VARCHAR2(3) DEFAULT 'Y',
    REPLY_CREATEDATE DATE DEFAULT SYSDATE,
    REPLY_MODIFYDATE DATE DEFAULT SYSDATE,
    CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO)
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호';
COMMENT ON COLUMN "REPLY"."CUSTOMER_NO" IS '고객센터 번호';
COMMENT ON COLUMN "REPLY"."WRITER_NO" IS '작성자 번호';
COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';
COMMENT ON COLUMN "REPLY"."REPLY_STATUS" IS '댓글 상태';
COMMENT ON COLUMN "REPLY"."REPLY_CREATEDATE" IS '댓글 등록일';
COMMENT ON COLUMN "REPLY"."REPLY_MODIFYDATE" IS '댓글 수정일';

CREATE SEQUENCE SEQ_REPLY_NO;

SELECT REPLY_NO,
       CUSTOMER_NO,
       WRITER_NO,
       REPLY_CONTENT,
       REPLY_STATUS,
       REPLY_CREATEDATE,
       REPLY_MODIFYDATE
FROM REPLY
WHERE CUSTOMER_NO = 'C35';

SELECT R.REPLY_NO,
       R.CUSTOMER_NO,
       R.WRITER_NO,
       R.REPLY_CONTENT,
       R.REPLY_STATUS,
       R.REPLY_CREATEDATE,
       R.REPLY_MODIFYDATE,
       M.MEMBER_ID
FROM REPLY R
LEFT OUTER JOIN MEMBER M ON (R.WRITER_NO = M.MEMBER_NO)
WHERE CUSTOMER_NO = 'C35'
ORDER BY REPLY_CREATEDATE DESC;

-- 댓글 수
SELECT C.CUSTOMER_NO, COUNT(C.CUSTOMER_NO)
FROM CUSTOMER C
LEFT OUTER JOIN REPLY R ON (C.CUSTOMER_NO = R.CUSTOMER_NO)
WHERE R.REPLY_NO IS NOT NULL
GROUP BY C.CUSTOMER_NO;

SELECT *
FROM CUSTOMER
WHERE CUSTOMER_NO = 'C34';

COMMIT;

ROLLBACK;