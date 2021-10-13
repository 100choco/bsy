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
					<td>번호</td>
					<td>제목</td>
					<td>내용</td>
					<td>작성자</td>
					<td>작성시간</td>
					<td>조회수</td>	
					<td>삭제</td>
					<td>수정</td>
				</tr>
				
				<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.num}</td>
					<td>${list.title}</td>
					<td>${list.content}</td>
					<td>${list.boardWriter}</td>
					<td>${list.regDate}</td>
					<td>${list.views+1}</td>
					<td><a href="deleteContentController?num=${list.num}">삭제</a></td>
					<td><a href="updateContentControllerForm?num=${list.num}">수정</a></td>
				</tr>
				</c:forEach>
			
			</table>
		<button type="button" onclick="location.href='/bsy/ReadBoardAllController'">돌아가기</button>
	</div>
	
	
</body>
</html>