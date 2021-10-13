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
			<table border="1" class="table table-striped">
		
				<tr>
					<td>회원번호</td>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>휴대폰번호</td>
					<td>성별</td>
					<td>이메일</td>
					<td>생년월일</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				
				<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.userNum}</td>
					<td>${list.id}</td>
					<td>${list.password}</td>
					<td>${list.phoneNumber}</td>
					<td>${list.gender}</td>
					<td>${list.email}</td>
					<td>${list.birth}</td>
					<td><a href="userUpdateFormController?userNum=${list.userNum}" style="text-decoration: none;">수정</a></td>
					<td><a href="userDeleteController?userNum=${list.userNum}" style="text-decoration: none;">삭제</a></td>
					
				</tr>
				</c:forEach>
		
			</table>
				<a href="/bsy/main.jsp">돌아가기</a>
		</div>
</body>
</html>