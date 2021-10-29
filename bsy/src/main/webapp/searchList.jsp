<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
			<form action="searchListController" method="get">
		
				<select name="search" id="search">
					<option value="title">제목</option>
					<option value="boardWriter">작성자</option>
					<!-- <option value="tiCo">제목 + 작성자</option>	 -->
				</select>
					<input type="text" name="searchKey">
					<input type="submit" value="검색">
			</form>
	
</body>
</html>

