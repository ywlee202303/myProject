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

-- 숙소 조회(이미지 포함)
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
       HI.H_IMAGE_CODE,
       HI.H_IMAGE_ORIGINALFILENAME,
       HI.H_IMAGE_RENAMEDFILENAME
FROM HOUSE H
LEFT OUTER JOIN HOUSE_IMAGE HI ON (H.H_CODE = HI.H_CODE)
WHERE H.H_STATUS = 'Y'
ORDER BY H_IMAGE_RENAMEDFILENAME;

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
WHERE H.H_STATUS = 'Y'
ORDER BY H_IMAGE_RENAMEDFILENAME;

COMMIT;

ROLLBACK;