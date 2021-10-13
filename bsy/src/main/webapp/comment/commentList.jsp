<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">

<tr>
	<td>댓글번호</td>
	<td>댓글작성자</td>
	<td>댓글내용</td>	
	<td>삭제</td>
	<td>수정</td>
</tr>

<c:forEach var="list" items="${list}">
<tr>
	<td>${list.commentNum}</td>
	<td>${list.commentWriter}</td>
	<td>${list.commentContent}</td>
	<td><a href="deleteContentController?num=${list.num}">삭제</a></td>
	<td><a href="updateContentControllerForm?num=${list.num}">수정</a></td>
</tr>
</c:forEach>

</table>
	
	
</body>
</html>