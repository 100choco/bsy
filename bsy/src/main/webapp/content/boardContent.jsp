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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
					<td><input type="hidden" id="num" value=${list.num }>${list.num}</td>
					<td>${list.title}</td>
					<td>${list.content}</td>
					<td><input type="hidden" id="writer" value=${list.boardWriter }>${list.boardWriter}</td>
					<td>${list.regDate}</td>
					<td>${list.views+1}</td>
					<td> <button type="button" id="deletebtn">삭제</button> </td>
					<td> <button type="button" id="updatebtn">수정</button> </td>
					<%-- <td><a href="updateContentControllerForm?num=${list.num}" id="updatebtn">수정</a></td> --%>
				</tr>
				</c:forEach>
			
			</table>
		<button type="button" onclick="location.href='/bsy/ReadBoardAllController'">돌아가기</button>
	</div>
	
	<script type="text/javascript">
			$(function () {
				$("#deletebtn").on("click" ,function(){
					
					if("${id }" == "admin"){
						alert("삭제되었습니다!");
						window.location.href='deleteContentController?num=' + $("#num").val();
					}else if("${id }" == null){
						alert("권한없음!");
						event.preventDefault();
					}{
						if("${id }" == $("#writer").val()){
							alert("삭제되었습니다!");
							window.location.href='deleteContentController?num=' + $("#num").val();
						}else{
							alert("권한없음!");
						}
					}
					
					 
				})
				
				$("#updatebtn").on("click" ,function(){
					
					if("${id }" == "admin" || "${id }" == $("#writer").val()){
						window.location.href='updateContentControllerForm?num=' + $("#num").val();
					} else{
							alert("권한없음!");
							event.preventDefault();
					}
					
				})
			})
	
	
	</script>
	
</body>
</html>