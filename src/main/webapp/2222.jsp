<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
	<title>회원가입</title>
	  <style>
	  div#header{
	  position:fixed;
	  width:100%;
	  top:0;
	  left:0;
	    }
	    
	  .wrapper {
	position:relative;
	min-height:100%;
	margin: 0 auto - 155px;

}  
	  .footer{
	  position:absolute;
	  bottom: 0;
	  width:100%;
		}
	 	
	</style>
	<script type="text/javascript">
	
		function SignUp(){
			var tm = document.form.terms.checked;
			var id = document.form.id.value;
			var pw = document.form.passwd.value;
			var pwo = document.form.passwdOk.value;
			var nm = document.form.name.value;
			var pn = document.form.phoneNumber.value;
			var em = document.form.email.value;
			//var findString = "@";
		
		if (tm == 0){
			 alert("개인정보 약관에 동의하셔야 합니다.");
		}else if(id==""){
			alert("아이디를 입력해주세요");	
		}else if (id.length < 6 || id.length > 12) {
			alert("아이디를 6자~12자 이내로 입력해주세요");	
		}else if(pw==""){
			alert("비밀번호를 입력해주세요");
		}else if(pwo==""){
			alert("비밀번호 확인을 입력해주세요");
		}else if (pwo.length < 4) {
			alert("비밀번호를 4글자 이상 입력해주세요");	
		}else if(pwo!=pw){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다 !, 다시 한번 확인해주세요");
		}else if (nm==""){
			alert("이름을 입력해주세요");
		}else if (pn==""){
			alert("휴대전화 번호를 입력해주세요");
		}else if (em==""){
			alert("이메일을 입력해주세요");
		//}else if (!em.indexOf(findString) != -1){
			//alert("이메일 형식을 다시 확인해주세요. @을 입력해주세요");
		}else{
			alert("회원가입을 축하드립니다");
			document.form.submit();
		}
		}
		
		function overlap(){
			alert("사용 가능한 아이디입니다")	
			//데이터베이스와 조회해서 일하는 아이디 값이 있으면 
			//이미 사용중인 아이디입니다 라는 메시지를 출력하게 해야 합니다
		}
	
			
	
	</script>
	

 
</head>
 <!-- 헤더입니다 -->
 <%@ include file="header.jsp" %>
<body>
<div class="wrapper">
	<form  name="form" method="post">
		<div class="container" width="100px" style="margin-bottom:300px; width: 700px; height: 806px; padding-bottom:100px;" >
			<br>
			<h3>회원 가입</h3>
			<br>
			<div class="col-md-6">
				<label for="inputId1" class="col-sm-2 col-form-label">아이디</label>
					    
				<div class="row gx-5">
				<div class="col">   			 
					<input type="text" class="form-control" id="inputId1" name="id"/>	    
					<div class="invalid-feedback"> 아이디를 입력해주세요
					</div>    
				</div>
				<div class="col">
					<!-- 이건 나중에 또 메소드 추가하자 -->
					<button type="button" class="btn btn-danger" style="float:right" onclick="overlap()">중복확인</button>
				</div>
					    
					    
				</div>
			</div>
			<div class="col-md-6">
				<label for="inputPassword1" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="inputPassword1" name="passwd">
			</div>
			<div class="col-md-6">
				<label for="inputPassword2" class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" id="inputPassword" placeholder="" name="passwdOk">
			</div>
			<div class="col-md-6">
				<label for="inputName1" class="form-label">이름</label>
				<input type="text" class="form-control" id="inputName1" placeholder="홍길동" name="name">
			</div>
			<div class="col-md-6">
				<label for="inputPhone" class="form-label">휴대전화</label>
				<input type="text" class="form-control" id="inputPhone" placeholder="'-'을 빼고입력해주세요" name="phoneNumber">
			</div>
			<div class="col-md-6">
				<label for="inputEmail" class="form-label">이메일</label>
				<input type="email" class="form-control" id="email" name="email">
			</div>
			<br>
				 	
				 	
			필수약관 동의
			<div class="ec-base-box agreeArea ">
				
				<h4>[필수] 개인정보 약관 동의</h4>
				<div class="shadow p-1 mb-1 bg-body rounded" style="width:700px; height:150px;">
					<div style="overflow:scroll; width:700px; height:150px;">
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
					
				<div class="form-check mb-3">
					<input type="checkbox" class="form-check-input" id="validationFormCheck1" name="terms"  required>	   
					<label class="form-check-label" for="validationFormCheck1">(필수) 이용약관에 동의합니다</label>
					<div class="invalid-feedback">동의하지 않으시면 회원가입을 할 수 없습니다</div>
				</div>
				  
			</div>
				    
				 	
			<div class="col-12">
				<button type="button" class="btn btn-danger"  onclick="SignUp()">회원가입</button>
			</div>
		</div>
	</form>
<br>
<br>
	
	</div>
	
	 
	
<!-- 푸터입니다 -->
<div class="footer">
	<%@ include file="footer.jsp" %>
</div>
	
</body>
</html>