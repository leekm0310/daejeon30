<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${resMap.res }" />
<c:set var="resImageFileList" value="${resMap.resImageFileList }"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
   function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
   
   function fn_remove(url,resNum){
	   var form = document.createElement("form");
	   form.setAttribute("method", "post");
	   form.setAttribute("action", url);
	   var resNumInput = document.createElement("input");
	   resNumInput.setAttribute("type", "hidden");
	   resNumInput.setAttribute("name", "resNum");
	   resNumInput.setAttribute("value", resNum);
	   
	   form.appendChild(resNumInput);
	   document.body.appendChild(form);
	   form.submit();
   }
   
   function fn_modify(obj){
	obj.action ="${contextPath}/admin/modRes.do";
	obj.submit();
   }   
   
   
</script>
</head>
<body>
    <form name="frmRes" action="#" method="post" enctype="multipart/form-data">
		<h6>식당 상세창</h6>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
	 <div class="col-sm-8">
	 <img src="${contextPath}/download.do?resNum=${res.resNum}&resImageFileName=${resImageFileList[0].resImageFileName}" id="preview" height="200" width="200" /><br>
	 </div>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<table>
			<tr >
			<td >식당번호</td>
			<td><input name="resNum" type="text" size="40" value="${res.resNum }" /></td>
			</tr>
			<tr >
				<td >식당이름</td>
				<td><input name="resName" type="text" size="40" value="${res.resName }" /></td>
			</tr>
			<tr>
				<td >위치</td>
				<td><input name="resLocation" type="text" size="40" value="${res.resLocation }"/></td>
			</tr>
			<tr>
				<td >운영시간</td>
				<td><input name="resOpen" type="text" size="40" value="${res.resOpen }"/></td>
			</tr>
			<tr>
				<td >전화번호</td>
				<td><input name="resPhone" type="text" size="40" value="${res.resPhone }"/></td>
			</tr>
			<tr>
				<td >대표메뉴</td>
				<td><input name="resMenu" type="text" size="40" value="${res.resMenu }"/></td>
			</tr>
			<tr>	
			<tr>
				<td >수용인원수</td>
				<td><input name="resCapacity" type="text" size="40" value="${res.resCapacity }"/></td>
			</tr>
			<tr>
				<td >재료</td>
				<td><input name="resIngredient" type="text" size="40" value="${res.resIngredient }"/></td>
			</tr>
			<tr>
				<td>식당분류</td>
				<td><input name="resCategory" type="text" size="40" value="${res.resCategory }"/></td>
			</tr>
			
			<tr>
				<td >위치</td>
				<td><input name="mapLocation" type="text" size="40" /></td>
			</tr>
			
			<tr>
			 <td>
			   <br>
			 </td>
			</tr>
				</table>	
			</div>
		
			</form>
			<div class="tab_content" id="tab7">
				<h4>식당이미지</h4>
				<table >
				 
				
	 <c:if test="${not empty resImageFileList && resImageFileList!='null' }">
	  <c:forEach var="item" items="${resImageFileList}" varStatus="status" begin="1">
		    <tr>
			    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
			      이미지${status.count }
			   </td>
			   <td>
			 
			     <input  type= "hidden"   name="originalFileName" value="${item.resImageFileName }" />
			    <img src="${contextPath}/download.do?resNum=${res.resNum}&resImageFileName=${item.resImageFileName}" id="preview" height="200" width="200" /><br>
			  
			   </td>   
			  </tr>  
			  <tr>
			    <td>
			       <input  type="file"  name="resImageFileName " id="i_resImageFileName"   disabled   onchange="readURL(this);"   />
			    </td>
			 </tr>
		</c:forEach>
 </c:if>
				
				
<div class="row justify-content-end">
<button type="button" class="btn btn-danger" style="width:150px;" onclick="fn_modify(frmRes)">수정반영하기</button>
<button type="button" class="btn btn-danger" style="width:100px;" onclick="fn_remove('${contextPath}/admin/removeRes.do', ${res.resNum})">삭제하기</button>
</div>
				
				<!--  
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
                    <tr>-->
                    <!-- 
                        <td align="right"> 이미지파일 2</td>
                            <td  align="left"> <input type="file" name="#" id="#" class="form-control"></td> -->
			        <!--  </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="등록"/>
                        </td>
					</tr>
				-->	
				</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
</form>	 
</body>