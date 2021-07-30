<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="http://resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
	<title>예약/결제 페이지</title>
	
		
		<script>
       $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
     });
    </script>
		
</head>
  <body>
 <!-- 메인코드부 -->
 <div class="wrap">

 <hr>
	<div class="main-content">
		<div class="container">
			<div class="row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-8" align=center>
			<br>
					<h1>예약 페이지</h1>
					<br>
					<div class="shadow p-3 mb-4 bg-body rounded" style="width:700px;">
					
					<div class="input-group" align=left>
					
					  <div class="input-group flex-nowrap">
						  <span class="input-group-text" id="addon-wrapping" style="width:100px;">아이디</span>
						  <input type="text" class="form-control"  id="id" value="${member.id}" readonly="readonly">
						  </div>
					  <br>
					  <div class="input-group flex-nowrap">
						  <span class="input-group-text" id="addon-wrapping" style="width:100px;">이름</span>
						  <input type="text" class="form-control"  id="name" value="${member.name}" readonly="readonly">
						  </div>
					  <br>
						  <div class="input-group flex-nowrap">
						  <span class="input-group-text" id="addon-wrapping" style="width:100px;">휴대전화</span>
						  <input type="text" class="form-control" id="phone" value="${member.phone}" name="phone" readonly="readonly">
					  </div>
					  <br>
					  <div class="input-group flex-nowrap">
						  <span class="input-group-text" id="addon-wrapping" style="width:100px;">추가사항</span>
						  <input type="text" class="form-control"  aria-label="Username" aria-describedby="addon-wrapping">
						</div>

</div>
</div>
<div class="col-sm-2">
</div>
</div>
</div>
<br>
<div class="row">
<div class="col-sm-2">
</div>

<div class="col-sm-8" align=center>
	<h1>예약내역 요약</h1>
	<h6 style=color:red>***예약시 노 쇼(NO SHOW)방지를 위해 예약금 10,000원을 결제합니다.<br> 취소/환불 관련 내용은 공지사항을 참고해주세요***</h6>
	  <br>
		<div class="shadow p-3 mb-5 bg-body rounded"  style="width:700px;">
		<br>
		<br>
		<div class="input-group" align=left>
			 <div class="input-group flex-nowrap">
  			<span class="input-group-text" id="addon-wrapping" style="width:100px;">장소명</span>
 			 <input type="text" class="form-control" id="#" value="${resDetail.resName }" name="#" readonly="readonly">
			</div>
			
			<div class="input-group flex-nowrap">
  			<span class="input-group-text" id="addon-wrapping" style="width:100px;">예약일</span>
 			 <input type="text" class="form-control" input type="text" id="datepicker" >
			</div>
		<!--  예약일
			<div class="input-group mb-3">
			    <p><input type="text" id="datepicker"></p>
			</div>-->
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupSelect01" style="width:100px;">시간</label>
			  <select class="form-select" id="inputGroupSelect01">
				 <option value="오후 12:00">오후 12:00</option>
				 <option value="오후 12:30">오후 12:30</option>
				 <option value="오후 13:00">오후 13:00</option>
				 <option value="오후 13:30">오후 13:30</option>
				 <option value="오후 14:00">오후 14:00</option>
				 <option value="오후 17:00">오후 17:00</option>
				 <option value="오후 17:30">오후 17:30</option>
				 <option value="오후 18:00">오후 18:00</option>
				 <option value="오후 18:30">오후 18:30</option>
				 <option value="오후 19:00">오후 19:00</option>
				 <option value="오후 19:30">오후 19:30</option>
				 <option value="오후 20:00">오후 20:00</option>
			  </select>
		  	<label class="input-group-text" for="inputGroupSelect01" style="width:100px;">인원</label>
			  <select class="form-select" id="inputGroupSelect01">
		
				 <option value="2">2</option>
				 <option value="3">3</option>
				 <option value="4">4</option>
					  </select>
				</div>
				</div>
					<br>		

	<button type="button" class="btn btn-danger" onclick="location.href='./result1.jsp'" size="200" align=right>확인/결제</button>
	
</div>
			
				<div class="col-sm-2" align= right>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>