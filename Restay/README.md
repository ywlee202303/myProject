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
**❖ MAIN**

- 메인이미지 슬라이드 기능 (자동 슬라이드 & 버튼)
![image](https://github.com/ywlee202303/myProject/assets/127309120/c1838110-45d3-4cc4-898b-7e00797fe61c)

- "전체보기" 클릭 시, 각각 FIND STAY, TRAVEL 페이지로 이동
![image](https://github.com/ywlee202303/myProject/assets/127309120/0c717ff5-8803-4b93-90db-76e3418b1ade)

- "예약하기" 버튼 클릭시, 해당 숙소 예약 페이지로 이동
![메인룸](https://github.com/ywlee202303/myProject/assets/127309120/82bea275-cc45-479e-baff-9bf4ab4e73f6)

**❖ HEADER**

- "RE_STAY" 클릭 시 메인페이지로 이동
- "메뉴" 클릭 시 해당페이로 이동
![헤더](https://github.com/ywlee202303/myProject/assets/127309120/b2e63893-8446-4931-be27-1068f7a77ff1)

- 장소 & 날짜 모달창 생성하여 검색조건 설정 후, FIND STAY(숙소) 페이지로 이동
![헤더2](https://github.com/ywlee202303/myProject/assets/127309120/51e7d906-cea8-4c21-a8ae-5ce6d9d266a2)
![언제어디로](https://github.com/ywlee202303/myProject/assets/127309120/b16c1949-0bcf-4c90-ab91-d174baf9ea4a)

**❖ FIND STAY**

- 리스테이(RE_STAY)에 입점된 모든 숙소를 조회하는 페이지
- 페이징 처리하여 한 페이지에 '10개' 숙소 노출
- 메인이미지와 동일하게 Swiper 사용하여 슬라이드 기능 구현(숙소별로 DB에 저장된 이미지 갯수에 따라 슬라이드 이미지 갯수 상이)
![숙소조회](https://github.com/ywlee202303/myProject/assets/127309120/979cd229-50bf-4704-bf94-b711c1293ea1)

**❖ BOOKING**

- FIND STAY 페이지에서 "에약하기" 클릭 시 예약페이지로 이동
![예약](https://github.com/ywlee202303/myProject/assets/127309120/e272ba92-6159-4dd2-a3c2-7006984756dd)

- 예약페이지에서 체크인, 체크아웃 날짜 선택 가능(Date Range Picker 사용)
![예약날짜](https://github.com/ywlee202303/myProject/assets/127309120/2714527c-a7dd-459f-bed5-ab6664a8628c)

**❖ PAYMENT**

- 예약페이지에서 "예약하기" 클릭 시 결제페이지로 이동
- 사용자 약관 전체 동의 클릭 시, 필수 항목 전체 체크 가능
- 필수 체크 항목 내용 jQuery 사용하여 toggle 효과 적용
![결제](https://github.com/ywlee202303/myProject/assets/127309120/4043cf3b-2d16-4c21-aae3-6ae4df17ad64)

**❖ MYPAGE**

- 회원 정보 수정 : 현재 패스워드를 입력하여 본인인증 후 회원 정보 수정 페이지로 이동
- 정규표현식 사용하여 비밀번호 유효성 검사
- "회원탈퇴" 클릭 시 회원탈퇴 가능
![마이페이지_회원정보수정](https://github.com/ywlee202303/myProject/assets/127309120/a49c61fe-17a9-48b4-8037-69206301b654)
![마이페이지_회원정보수정2](https://github.com/ywlee202303/myProject/assets/127309120/79546c4a-72b3-4ac6-aee3-1d160ad6b159)

- 예약정보 : 사용자 본인이 예약한 숙소 리스트 확인 가능
- "예약 상세 확인" 클릭 시 예약 상세 정보 확인 가능
![마이페이지_예약정보](https://github.com/ywlee202303/myProject/assets/127309120/4a6383a7-cae5-45f0-803e-2ec989dac1bf)
![screencapture-localhost-8080-Restay-payment-detail-R242-2024-06-11-15_08_13](https://github.com/ywlee202303/myProject/assets/127309120/bf77cc2a-f3bb-4b9a-844d-2c14f31ed208)




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
