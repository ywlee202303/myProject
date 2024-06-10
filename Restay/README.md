# Restay

## ✅ 프로젝트 기간
2023-12-04 ~ 2024-01-30


## ✅ 개발 환경
* 언어 : Java, HTML/CSS, Javascript

* 서버 : Apache Tomcat 9.0

* 프레임워크 : Spring Framework, MyBatis

* DB : Oracle

* IDE : Eclipse, SQL Developer

* 라이브러리 : jQuery


## ✅ 프로젝트 일정
![프로젝트 일정](https://github.com/ywlee202303/myProject/assets/127309120/21539182-e7e2-42e0-ae6c-2564ef68e83c)


## ✅ 프로젝트 기획
![프로젝트 기획](https://github.com/ywlee202303/myProject/assets/127309120/7728ea05-341a-46dd-b9aa-0a531dd5a41b)


## ✅ 페이지 주요 기능
**MAIN**

- 메인이미지 슬라이드 기능 (자동 슬라이드 & 버튼)
- "전체보기" 클릭 시, 각각 FIND STAY, TRAVEL 페이지로 이동
- "예약하기" 버튼 클릭시, 해당 숙소 예약 페이지로 이동

![메인페이지](https://github.com/ywlee202303/myProject/assets/127309120/15642adb-c529-44d0-b5c1-618a50a5442c)

**HEADER**

- "RE_STAY" 클릭 시 메인페이지로 이동
- "메뉴" 클릭 시 해당페이로 이동
- 장소 & 날짜 모달창 생성하여 검색조건 설정 후, FIND STAY(숙소) 페이지로 이동

![image](https://github.com/ywlee202303/myProject/assets/127309120/05e97eef-2e3e-486d-bee8-00ae57aac672)
![언제어디로](https://github.com/ywlee202303/myProject/assets/127309120/b16c1949-0bcf-4c90-ab91-d174baf9ea4a)

**LOGIN & JOIN**

- 비밀번호 유효성 검사(정규표현식 사용)
- 모든 입력값 조건 만족 후 회원가입
- 사용자 약관 전체 동의 클릭 시, 전체 체크 기능

![로그인](https://github.com/ywlee202303/myProject/assets/127309120/7a97f220-2073-4ee5-953b-a0cae11c7416) | ![회원가입](https://github.com/ywlee202303/myProject/assets/127309120/384eb300-3007-4246-bc3f-ffe0f27bba67)
--- | --- |

![유효성 검사](https://github.com/ywlee202303/myProject/assets/127309120/30f27ad9-bca7-45e9-be22-0c8164cba8ea)

**ABOUT**

- 리스테이(RE_STAY) 소개페이지
- 리스테이(RE_STAY)의 identity(정체성) & symbol(상징)을 설명
  
![어바웃](https://github.com/ywlee202303/myProject/assets/127309120/c0e1a5b3-47e8-4677-8326-ab4cddde799d)

**CUSTOMER**

- 리스테이(RE_STAY) 고객센터 페이지
- 공지사항, 자유게시판, 자주 묻는 질문, 1:1문의 카테고리 분류
- 자유게시판, 1:1문의 댓글기능 구현(자유게시판 : 관리자, 사용자 / 1:1문의 : 관리자만 댓글 달 수 있도록 구현)
- Cookie 사용하여 조회수 기능 구현(24시간 지나면 쿠키 리셋)
- MultipartFile, ResourceLoader 사용하여 파일 업로드, 다운로드 기능 구현

![커스토머](https://github.com/ywlee202303/myProject/assets/127309120/1282697a-7235-45db-9d7d-a402c5fc100d)

##### [공지사항, 자주 묻는 질문 상세페이지]
![공지사항 상세](https://github.com/ywlee202303/myProject/assets/127309120/1a61ff99-d2c7-4459-a8dd-d445e5f0468c)
![자묻질](https://github.com/ywlee202303/myProject/assets/127309120/9876ecdf-82a1-4229-9dc5-9518969c3fcb)

##### [자유게시판 상세페이지]
![자게1](https://github.com/ywlee202303/myProject/assets/127309120/cad7884a-219c-43be-9638-69b3ad4a41df)

##### [1:1문의]
![11문의](https://github.com/ywlee202303/myProject/assets/127309120/788292b7-96e9-40c1-8762-2184182cddfd)

##### [고객센터 등록, 수정 페이지]
등록 - 사용자(자유게시판)
![image](https://github.com/ywlee202303/myProject/assets/127309120/d8a22a21-8162-421b-aaf8-ae1e5181e1ec)

수정 - 사용자(자유게시판)
![image](https://github.com/ywlee202303/myProject/assets/127309120/d025501e-62fc-413d-a1bd-ee9b18128252)

등록 - 관리자(공지사항, 자유게시판, 자주 묻는 질문)
![image](https://github.com/ywlee202303/myProject/assets/127309120/a26f8bd6-fc78-42c0-b58e-cbba68b34e6a)

수정 - 관리자(공지사항, 자유게시판, 자주 묻는 질문)
![image](https://github.com/ywlee202303/myProject/assets/127309120/20d3ef62-b6e1-481e-bdfe-f52c8b9538ec)
