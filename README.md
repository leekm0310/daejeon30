# 대슐랭가이드 - 식당예약사이트
## 기획의도
* '대슐랭가이드'는 쇼핑몰과 커뮤니티를 결합한 웹쇼핑몰 프로젝트 입니다

<img src="https://user-images.githubusercontent.com/87681380/130398528-952447be-775a-49e0-9a65-195d346b8cb9.JPG" width="800">



## 프로젝트 개요
1. 개발기간: 2021. 06. 10 ~ 2021. 08. 17
2. 개발환경

* 공통
  - 운영체제: Window 10
  - IDE: Eclipse (빌드도구 Maven)
  - Web Server: Apache Tomcat 9
  - Database: MySQL Server 8.0.19
  
* FrontEnd
  - HTML5, CSS3, JavaScript, bootstrap 5.0.1, Jquery 3.3.1, Ajax, Json
  
* BackEnd
  - Language: Java 1.6, JSP 
  - Framework: Spring Framework

3. 프로젝트의 기능
 * 공통기능: 로그인, 회원가입
 * 관리자
   - 회원 관리: 회원 정보 수정, 회원 탈퇴
   - 식당 관리: 식당 등록, 식당 수정, 식당 삭제
   - 예약 관리: 예약요청 수락, 취소요청 수락
   - 게시판 관리: 게시판 글 등록, 수정, 삭제
   
 * 사용자
   - 식당 관련: 식당 검색, 식당 예약, 식당 찜하기
   - 예약 관련: 예약취소 요청, 예약 변경
   - 게시판 관련: 추천게시판/리뷰게시판 글 등록, 수정, 삭제
   - 마이페이지 관련: 나의 현황 요약, 내 게시물 관리, 예약내역 조회, 회원정보 수정(및 탈퇴), 찜한 리스트 확인


## 화면설명
### 공통기능: 로그인, 회원가입
- 회원가입 유효성 검사
- 로그인 아이디나 비밀번호 불일치시 alert
<img src="https://user-images.githubusercontent.com/87681380/130551110-2ce6a05e-d3b6-485d-96e5-0de3a924ac3e.gif" width="600">

* * *

### 사용자화면: 식당 분류별 보기, 식당 검색
- 식당을 지역, 음식 종류, 기타 분류에 따라 출력
- 식당 이름 키워드 검색
<img src="https://user-images.githubusercontent.com/87681380/130551101-720ca37b-2051-44bc-a61d-00679f7f1762.gif" width="600">

* * *

### 사용자화면: 식당 상세보기, 찜하기 및 예약
- 식당 예약 기능 (회원/비회원 구분)
- 예약 내역 조회, 변경, 취소 기능
- 아래시연은 비회원 기준
<img src="https://user-images.githubusercontent.com/87681380/130551107-ad7805ad-dfdc-470c-bda0-8a6607ff71cf.gif" width="600">

* * *

### 사용자화면: 마이페이지
- 나의 현황 요약, 내 게시물 관리, 예약내역 조회, 회원정보 수정(및 탈퇴), 찜한 리스트 확인/삭제 기능
<img src="https://user-images.githubusercontent.com/87681380/130551755-8bfb0e0d-203c-4e4e-9315-6f5222a027d6.gif" width="600">

* * *

### 관리자화면: 각각 메뉴 확인
- 관리자 메인 화면에서는 예약현황, 문의현황 및 회원 등록 현황을 확인할 수 있게 함, 숫자 클릭시 해당 메뉴 이동
- 사이드 메뉴 통해서 이동 가능
<img src="https://user-images.githubusercontent.com/87681380/130551108-10df44e7-bc0f-493e-a7f9-429f4f4da13d.gif" width="600">

* * *

### 관리자화면: 게시판 글쓰기, 수정, 삭제 - 공지사항, FAQ
- 관리자 게시판(공지사항, FAQ) 글쓰기, 수정, 삭제 기능 구현
- 관리자 게시판 메뉴 중 문의 게시판 글 읽기/삭제 및 댓글 등록/삭제 가능
<img src="https://user-images.githubusercontent.com/87681380/130401097-6c815c8d-130a-4239-b7f9-86be8f4385de.gif" width="600">

* * *

### 관리자계정: 문의게시판 글 읽기, 댓글 등록/삭제
- 관리자화면 아닌 일반 메인 화면에서도 문의게시판 글 읽기/삭제, 댓글 등록/삭제 모두 가능
<img src="https://user-images.githubusercontent.com/87681380/130401600-dc600416-e2f1-422f-84c2-17df29b2c09c.gif" width="600">


* * *

