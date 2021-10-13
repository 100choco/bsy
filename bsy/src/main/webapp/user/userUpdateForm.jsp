<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="/bsy/css/bsymain.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="wrapper">
		<jsp:include page="/include/bsymainhead.jsp"></jsp:include>
			<form action="userUpdateController">
				<table class="table table-striped">
					
			<c:forEach var="list" items="${list}">
					<tr>
						<td>회원번호</td><td> <input type="text" name="userNum" readonly="readonly" value="${list.userNum}"></td>
					</tr>
					<tr>
						<td>아이디</td><td> <input type="text" name="id" readonly="readonly" value="${list.id}"> </td>
					</tr>
					<tr>
						<td>비밀번호</td><td> <input type="password" name="password" value="${list.password}"> </td>
					</tr>
					<tr>
						<td>휴대폰번호</td><td> <input type="number" name="phoneNumber" value="${list.phoneNumber}"> </td>
					</tr>
					<tr>
						<td>성별</td><td> 남 : <input type="radio" name="gender" value="f" checked="checked"> 여 : <input type="radio" name="gender" value="m" > </td>
					</tr>
					<tr>
						<td>이메일</td><td> <input type="text" name="email" value="${list.email}"> </td>
					</tr>
					<tr>
						<td>생년월일</td><td> <input type="text" name="birth" value="${list.birth}"> </td>
					</tr>
					</c:forEach>	
		
					</table>
					<input type="submit" value="수정하기">
		
			</form>
	</div>
</body>
</html>