# PawPawTrip

## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/10cc07bb-af91-4ea3-89f4-5dada1cfb377) 프로젝트 기간 / 인원
- 2024-02-01 ~ 2024-03-18
- KH정보교육원 팀 프로젝트 : 4명(김정아, 송은정, 양우찬, 이영우)


## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/10cc07bb-af91-4ea3-89f4-5dada1cfb377) 프로젝트 역할
- 커뮤니티 조회/등록/수정/삭제
- 파일 업로드/다운로드
- 마이페이지 내가 쓴 게시글 조회
- 관리자페이지(대시보드)
- 에러페이지
- 지역별 날씨 조회(공공 데이터 포털 API)


## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/88dc293a-8dc5-4f9a-9c5a-2cf12bd5a117) 개발 환경
* 언어 : Java, HTML/CSS, Javascript

* 서버 : Apache Tomcat 9.0

* 프레임워크 : Spring Framework, MyBatis

* DB : Oracle

* IDE : Eclipse, SQL Developer

* 라이브러리 : jQuery

* API : 공공 데이터 포털 API


## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/88dc293a-8dc5-4f9a-9c5a-2cf12bd5a117) 프로젝트 소개
- 국내 반려동물 양육자 1500만 '펫코노미(Pet + Economy)'시대
- 반려동물을 가족처럼 생각하는  '펫팸(Pet + Family)족' 증가
- 반려인이 필요로 하는 정보 1순위 '반려동물과 함께 갈 수 있는 장소 정보'
- 공공 데이터 포털 API를 활용한 국내 반려동물 동반가능 여행지 & 숙소 안내 사이트 '포포트립 (PawPaw Trip)'


## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/17d5f570-6030-4339-beec-e7b9a965fc88) 프로젝트 일정
![image](https://github.com/ywlee202303/myProject/assets/127309120/a699a539-3ef2-41ca-8cc4-d2649515d32d)


## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/88dc293a-8dc5-4f9a-9c5a-2cf12bd5a117) 프로젝트 기획
![image](https://github.com/ywlee202303/myProject/assets/127309120/61946380-2dd0-441a-b841-1df5dac12791)
![image](https://github.com/ywlee202303/myProject/assets/127309120/14e7706a-47b3-417d-8925-eb2442bbe134)
![image](https://github.com/ywlee202303/myProject/assets/127309120/463fbe59-1596-41fb-8631-c413070c7c16)


## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/88dc293a-8dc5-4f9a-9c5a-2cf12bd5a117) ERD
![image](https://github.com/ywlee202303/myProject/assets/127309120/9490a287-7891-4b8c-9caa-bcd55a5d1d0b)


## ![favicon](https://github.com/ywlee202303/myProject/assets/127309120/88dc293a-8dc5-4f9a-9c5a-2cf12bd5a117) 페이지 주요 기능
**❖ 커뮤니티**

- '공지사항(관리자 작성)' & '자유게시판(사용자 작성)'으로 구성
- 사용자는 공지사항 조회만 가능 & 관리자는 등록된 공지사항 수정 가능
- 각각의 게시글 중복조회를 막기 위해 Cookie에 사용자IP, 게시글 번호를 저장하여 조회수 카운트(24시간 지나면 Cookie 정보 초기화)
![image](https://github.com/ywlee202303/myProject/assets/127309120/9645c4cf-ab3b-4887-babc-0bc1c83d2817)

- 로그인 된 사용자는 자유게시판의 '수다' 또는 '마이펫자랑'에 게시글을 작성할 수 있다.('WYSIWYG Editor Library' 활용)
- 첨부파일 클릭 시 파일 다운로드 가능
- 게시글 수정 시 첨부파일 삭제 가능(Ajax 사용)
![image](https://github.com/ywlee202303/myProject/assets/127309120/c2f0a6bf-2d17-4d79-a75b-0335781329e0)

**❖ 마이페이지**

- 사용자 ID로 작성한 모든 게시글 조회
- 최근 작성한 게시글 순서로 조회(클릭 시 해당 게시글로 이동)
- 페이징 처리(한 페이지 최대 10개 게시글 표시)
![image](https://github.com/ywlee202303/myProject/assets/127309120/d2bd5cf4-1979-49fb-8c56-842bf61986bb)

**❖ 관리자페이지**

- 관리자가 해당 사이트의 전반적인 상황을 시각화하여 모니터링하는 것이 목적이다.
- 데이터를 수집할 때 유용하며, 사이트를 운영하는데에 큰 지표가 된다.
![image](https://github.com/ywlee202303/myProject/assets/127309120/d36f8ad7-73c5-430b-a151-c4b7272c26b9)

**❖ 에러페이지**

- 사용자가 잘못된 접근을 했거나, 사이트가 점검 중일 경우 안내하는 페이지
- Javascript 사용하여 랜덤으로 이모티콘 노출하도록 구현
![image](https://github.com/ywlee202303/myProject/assets/127309120/179e3f88-09cd-4ea5-b0e1-6c5ac769fa4b)

**❖ 지역별 날씨 조회(공공 데이터 포털 API 사용)**

- "오늘의 날씨" 로고 클릭 시 날씨 페이지로 이동
- 공공 데이터 포털 API(기상청_중기예보 조회서비스)를 사용하여 3일 후 ~ 8일 후 지역별 날씨 데이터 조회
- 날씨 데이터에 따라 이미지 변경(맑음, 흐림, 비...)
![image](https://github.com/ywlee202303/myProject/assets/127309120/4e68c1a3-71d0-4e40-9adc-16c6ebc16b53)


