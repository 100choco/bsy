<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readBoard.jsp</title>
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
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성시간</td>
					<td>조회수</td>
					
				</tr>
				
				<c:forEach var = "list" items="${list}">
				
				<tr>
					<td>${list.num}</td>
					<td><a href="contentReadController?num=${list.num}&views=${list.views}">${list.title}</a></td>
					<td>${list.boardWriter}</td>
					<td>${list.regDate}</td>
					<td>${list.views}</td>
					
				</tr>
			
			</c:forEach>
			
			</table>
			
			<a href="/bsy/insert/insertBoard.jsp">게시글 작성</a>
			<a href="/bsy/main.jsp">홈으로</a>
		
		<jsp:include page="/searchList.jsp"></jsp:include>
	</div>
</body>
</html>