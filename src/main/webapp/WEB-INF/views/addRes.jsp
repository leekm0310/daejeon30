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
		<hr>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
	
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<table>
			<tr>	
				<td >식당이름</td>
				<td><input name="resName" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >운영시간</td>
				<td><input name="resOpen" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >전화번호</td>
				<td><input name="resPhone" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >대표메뉴</td>
				<td><input name="resMenu" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >주소</td>
				<td><input name="resLocation" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >수용인원수</td>
				<td><input name="resCapacity" type="text" size="40" /></td>
			</tr>
			
			<!--<tr>
				  <td >날짜기입할때쓸거</td>
				<td><input  name="#"  type="date" size="40" /></td>
			</tr>-->
			<tr>
				<td >재료</td>
				<td><input name="resIngredient" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >음식분류</td>
				<td>
				<select name="resCategory">
				  <option value="한식"  >한식</option>
				  <option value="일식" >일식</option>
				  <option value="중식" selected>중식</option>
				  <option value="양식" >양식</option>
				  <option value="분식" >분식</option>
				  <option value="패스트푸드" >패스트푸드</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td >위치</td>
				<td><input name="mapLocation" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >분류</td>
				<td>
				<select name="resSort">
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
			 <td>
			   <br>
			 </td>
			</tr>
				</table>	
			</div>
		<hr>
			
			<div class="tab_content" id="tab7">
				<h4>식당이미지</h4>
				<hr>
				<table >
				
					<tr>
			            <td align="right">이미지파일 첨부</td>
			            <td> <input type="file" name="resImageFileName" onchange="readURL(this);"></td>
			            <td><img  id="preview" src="#"   width=200 height=200/></td>
			            <td align="right">이미지파일 첨부</td>
			            <td align="left"><input type="button" value="파일 추가" onClick="fn_addFile()"/></td>
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
                            <input type="submit" value="등록"/>
                        </td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
</form>	 
</body>