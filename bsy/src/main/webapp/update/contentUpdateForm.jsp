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
		<form action="updateContentController">
			<table class="table table-striped">
			<c:forEach var="list" items="${list}">
				<tr>
					<td>글 번호 : </td>
					<td> <input type="text" name="num" value="${list.num}" readonly="readonly"></td>
				</tr>
				
				<tr>
					<td>제목 : </td>
					<td> <input type="text" name="title" value="${list.title}"></td>
				</tr>
				<tr>
					<td>내용 :</td>
					<td><input type="text" name="content" value="${list.content}"></td>
				</tr>
			
			</c:forEach>
				
			</table>
			<input type="submit" value="수정하기">
		</form>
	</div>
</body>
</html>