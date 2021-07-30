<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
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
    
	<title>예약/결제 페이지(비회원)</title>
	
	
		
	<script type="text/javascript">
	
	//	function confirm(){
	//		var nm = document.rsv3Form.name.value;
	//		var pn = document.rsv3Form.phone.value;
	//		var pw = document.rsv3Form.password.value;
	//		var tm = document.rsv3Form.terms.checked;
			
	//	if (tm == 0){
	//		 alert("개인정보 약관에 동의하셔야 합니다.");
	//	}else if (nm==""){
	//		alert("이름을 입력해주세요");
	//	}else if (pn==""){
	//		alert("휴대전화 번호를 입력해주세요");
	//	}else if(pw==""){
	//		alert("비밀번호를 입력해주세요");
	//	}else if (pw.length < 4) {
	//		alert("비밀번호를 4글자 이상 입력해주세요");	
	//	}else{
	//		alert("예약이 완료 되었습니다");
	//		document.rsv3Form.submit();
	//	}
	//	}
		

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
           ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
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
<form id ="rsv3Form" method="post" action="${contextPath}/rsv/rsvnon.do">
<div class="container">
<br>
<div class="row">
<div class="col-sm-2">
</div>
<div class="col-sm-8"  align=center>
	<h1>예약 페이지(비회원)</h1>
	<br>
	<div class="shadow p-3 mb-4 bg-body rounded" style="width:700px;">
	
<div class="input-group" align=left>

<div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width:100px;">이름</span>
  <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요." >
  </div>
  <br>
  <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width:100px;">휴대전화</span>
  <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대전화번호를 입력해주세요." >
  </div>
  <br>
  <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width:100px;">추가사항</span>
  <input type="text" class="form-control" id="addinfo" name="addinfo" placeholder="추가사항을 입력해주세요." >
  </div>
  <br>
  <div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping" style="width:100px;">비밀번호</span>
  <input type="text" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요." >
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
 			 <input type="text" class="form-control" name="resName" value="${resName1}" readonly="readonly">
			</div>
			
			<div class="input-group flex-nowrap">
  			<span class="input-group-text" id="addon-wrapping" style="width:100px;">예약일</span>
 			 <input type="text" class="form-control" id="datepicker" name="rsvDate">
			</div>
		<!--  예약일
			<div class="input-group mb-3">
			    <p><input type="text" id="datepicker"></p>
			</div>-->
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupSelect01" style="width:100px;">시간</label>
			  <select class="form-select" id="rsvTime" name="rsvTime">
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
			  <select class="form-select" id="rsvGuestNum" name="rsvGuestNum">
				 <option value="2">2</option>
				 <option value="3">3</option>
				 <option value="4">4</option>
			  </select>
				</div>
				</div>
					<br>		
						<h4>[필수] 개인정보 약관 동의</h4>
						<br>
							<div class="ec-base-box agreeArea" align=center>

								<div class="shadow p-1 mb-1 bg-body rounded" style="width:600px;">
									<div style="overflow:scroll; width:600px; height:200px;">
								 		<p>개인정보보호법에 따라 대전 관광 맛집 서비스에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
								        <p class="fw-bold">1. 수집하는 개인정보</p>
								        <p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 대전 관광 맛집 서비스 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 대전 관광 맛집 서비스는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다</p>
								        <p class="fw-bold">회원가입 시점에 대전 관광 맛집 서비스가 이용자로부터 수집하는 개인정보는 아래와 같습니다.</p>
								        <p>- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
											- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다</p>
										<p class="fw-bold">서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.</p>
										<p>대전 관광 맛집 서비스 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.</p>
										<p class="fw-bold">서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.</p>
										<p>구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
											2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
											대전 관광 맛집 서비스에서 제공하는 위치기반 서비스에 대해서는 '대전 관광 맛집 서비스 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
											이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다</p>
										<p class="fw-bold">2. 수집한 개인정보의 이용</p>
										<p>대전 관광 맛집 서비스 및 대전 관광 맛집 서비스 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
								
											- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
											- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
											- 법령 및 대전 관광 맛집 서비스 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
											- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
											- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
											- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
											- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</p>
								
							</div>
						</div>
						<br>	
						<div class="form-check mb-3" align=center>
							<input type="checkbox" class="form-check-input" id="validationFormCheck1" style="width:20px; height=20px;" name="terms" required>	   
							<label class="form-check-label" for="validationFormCheck1">(필수) 이용약관에 동의합니다</label>
							<div class="invalid-feedback">동의하지 않으시면 회원가입을 할 수 없습니다</div>
						</div>
						  
					</div>


	<button type="submit" class="btn btn-danger" size="200" align=right>확인/결제</button>
	
</div>
<div class="col-sm-2" align= right>
</div>

</div>
</div>
</div>
</form>
 </div>
 </div>
</body>
</html>