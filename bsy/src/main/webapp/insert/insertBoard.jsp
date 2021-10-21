<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/bsy/css/bsymain.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrapper">
	<jsp:include page="/include/bsymainhead.jsp"></jsp:include>
		<form action="/bsy/insertBoardController" method="get">
			<table class="table table-striped">
			
				<tr> 
					<td> 제목 :</td>
					<td><input type="text" name="title" style="width: 758px;"> </td>
				</tr>

				<tr>
					<td> 내용 : </td>
					<td><textarea rows="15" cols="100" style="resize:none;" wrap="hard" name="content"></textarea></td>
				</tr>
				
				<tr>
					<td> 작성자 : </td>
					<c:if test="${id == null }">
						<td> <input type="text" name="boardWriter" style="width: 758px;"></td>
					</c:if> 
					
					<c:if test="${id != null }">
						<td> <input type="text" name="boardWriter" style="width: 758px;" value=${id } readonly></td>
					</c:if>
					
				</tr>
				
				
			</table>
		<input type="submit" value="등록하기">
		<button type="button" onclick="location.href='/bsy/main.jsp'">돌아가기</button>
		</form>
	</div>
</body>
</html>