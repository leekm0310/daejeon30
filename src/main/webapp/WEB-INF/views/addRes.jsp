<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<style>
table.type05 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin: 20px 10px;
}
table.type05 th {
  width: 150px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #efefef;
}
table.type05 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
   
   var cnt=1;
   function fn_addFile(){
 	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
 	  cnt++;
   }  
   </script>
</head>
<body>
    <form action="${contextPath}/admin/addNewRes.do" method="post" enctype="multipart/form-data">
		<h4>식당 등록</h4>


	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
	
		<div class="tab_container">
		
			<table class="type05">
			<tr>	
				<th scope="row">상호명</th>
				<td><input class="form-control" name="resName" type="text" size="40" /></td>
				<td></td><td></td>
			</tr>
			<tr>
				<th scope="row">운영시간</th>
				<td><input class="form-control" name="resOpen" type="text" size="40" /></td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td><input class="form-control" name="resPhone" type="text" size="40" /></td>
			</tr>
			<tr>
				<th scope="row">대표메뉴</th>
				<td><input class="form-control" name="resMenu" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<th scope="row">주소</th>
				<td><input class="form-control" name="resLocation" type="text" size="40" /></td>
			</tr>
			<tr>
				<th scope="row">수용인원수</th>
				<td><input class="form-control" name="resCapacity" type="text" size="40" /></td>
			</tr>
			
			<!--<tr>
				  <td >날짜기입할때쓸거</td>
				<td><input  name="#"  type="date" size="40" /></td>
			</tr>-->
			<tr>
				<th scope="row">재료</th>
				<td><input class="form-control" name="resIngredient" type="text" size="40" /></td>
			</tr>
			<tr>
				<th scope="row">분류</th>
				<td>
				<select class="form-control" name="resCategory">
				  <option value="한식"  >한식</option>
				  <option value="일식" >일식</option>
				  <option value="중식" selected>중식</option>
				  <option value="양식" >양식</option>
				  <option value="분식" >분식</option>
				  <option value="패스트푸드" >패스트푸드</option>
				</select>
				</td>
			</tr>
			
			<tr><!--  
				<th scope="row">위치</th>
				<td><input class="form-control" name="mapLocation" type="text" size="40" /></td>-->
			</tr>
			
			<tr>
				<th scope="row">지역분류</th>
				<td>
				<select class="form-control" name="resSort">
				  <option value="1"  >서구</option>
				  <option value="2" >중구</option>
				  <option value="3" selected>동구</option>
				  <option value="4" >유성구</option>
				  <option value="5" >대덕구</option>
				  <option value="6" >착한식당</option>
				  <option value="7" >30년전통식당</option>
				  <option value="8" >경로우대식당</option>
				</select>
				</td>
			</tr>
			<tr>
			 <th scope="row">상세설명</th>
			 <td>
			 <textarea class="form-control" id="detailInfo" name="detailInfo" rows="5" placeholder="내용을 입력해주세요."></textarea>
			 </td>
			</tr>
				</table>	
			
		<hr>
			
			<div class="tab_content" id="tab7">
				<h4>식당이미지</h4>
				<hr>
				<table >
				
					<tr>
			            <td align="right">이미지파일 첨부</td>
			            <td> <input type="file" name="resImageFileName" onchange="readURL(this);"></td>
			        </tr>
			        <tr>
			            <td><img  id="preview" src="#" width=200 height=200/></td>
			         </tr>
			         <tr>
			            <td align="right">이미지파일 첨부</td>
			            <td align="left"><input type="button" value="파일 추가" onClick="fn_addFile()"/></td>
			            <td><img  id="preview" src="#" width=200 height=200/></td>
			        </tr>
			         <tr>
	      			<td colspan="4"><div id="d_file"></div></td>
	   				</tr>
                    <tr>
                    <!-- 
                        <td align="right"> 이미지파일 2</td>
                            <td  align="left"> <input type="file" name="#" id="#" class="form-control"></td> -->
			        </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" class="btn btn-danger" value="등록"/>
                        </td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>

</form>	 
</body>