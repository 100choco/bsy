<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <h1>게시물 작성하기</h1>
   
	   <form action="../boardInsert" method="get">
	      <table class="table table-striped">
	         <tr>
	            <td>제목</td>
	            <td><input type="text" id="title" name="title" style="width: 758px;"></td>
	         </tr>
	         <tr>
	            <td>작성자</td>
	            <td><input type="text" name="writer" value="<%=session.getAttribute("id")%>" readonly="readonly" style="width: 758px;"></td>
	         </tr>
	         <tr>
	            <td>내용</td>
	            <td><textarea rows="15" cols="100" id="content" name="content" style="resize:none;"></textarea></td>
	         </tr>
	      </table>
	      
	      <input type="submit" value="작성하기">
	      <input type="reset" value="초기화">
	      <button type="button" onclick="history.back(-1);">돌아가기</button>
	      
	      
	   </form>
	   
   </div>
   
</body>
</html>