<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>study의 main</title>
<script src="https://kit.fontawesome.com/fea8ea66bc.js" crossorigin="anonymous"></script>
<link href="/bsy/css/bsymain.css" rel="stylesheet" type="text/css">
</head>
<body>

<%-- <%= session.getAttribute("id") == null%> --%>

	<div class="wrapper">
		
		<jsp:include page="/include/bsymainhead.jsp"></jsp:include>
			
			<div class="block">
			
				<div class="gal">
					<button type="button" id="boardbtn" class="btn btn-outline-info" onclick="location.href='ReadBoardAllController'"><h2>갤러리</h2></button>
				</div>
		
				<!-- <div class="gall">
					<button type="button" id="boardbtnn" class="btn btn-outline-dark" onclick="location.href='readBoardUserAllController'"><h2>회원 갤러리</h2></button>
				</div>
			 -->
			</div>
		
			<div class="login">
				<div class="loginhead">
					<div class="loginform">
						<c:choose>
							<c:when test="${id == null }">
								<form action="userLoginController" method="post">  <!-- 미구현 -->
		
									<table>
										<tr>
											<td>아이디 : </td><td><input type="text" name="id" placeholder="아이디"></td><td rowspan="2"><input type="submit" value="로그인" id="loginbtn"></td>
										</tr>
												
										<tr>
											<td>비밀번호 : </td><td><input type="password" name="password" placeholder="비밀번호"></td>
										</tr>	
									
									</table>
										
								</form>
								<ul class="logNav">
									<li><a href="/bsy/signUp/signUp.jsp">회원가입</a></li>
								
								</ul>
								</c:when>
								<c:when test="${id == 'admin'}">
									<h4>관리자님 환영합니다</h4>
										<a href="readUserListAllController">회원관리</a>
										<a href="logoutController"> 로그아웃</a>
								</c:when>
								<c:otherwise>
									<h4>	${id}님 환영합니다.</h4>
									<a href="logoutController"> 로그아웃</a>
									
								</c:otherwise>
								
								</c:choose>
							</div>
			
					</div>
					
					<div id="sidee">
						<div id="sidee1"><a href="https://weather.naver.com/today/06170101"><i class="fas fa-cloud-sun fa-4x"></i></a></div> 
						<div id="sidee2"><a href="https://www.youtube.com/"><i class="fab fa-youtube fa-4x"></i></a></div>
						<div id="sidee3"><a href="https://www.instagram.com/?hl=ko"><i class="fab fa-instagram fa-4x"></i></a></div> 
					</div>
			
			</div>
		
		</div>
	

</body>
</html>