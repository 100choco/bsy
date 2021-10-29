<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/bsy/css/bsymain.css" rel="stylesheet" type="text/css">
<link href="/bsy/css/content.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	

	<div class="wrapper">
		<jsp:include page="/include/bsymainhead.jsp"></jsp:include>
			<table border="1" style="width: 1090px;">
			
				<c:forEach var="list" items="${list}">
				<tr>
				<td colspan="14"><h2>${list.title}</h2></td>
				</tr>
				<tr>	
					<td>번호</td>
					<td><input type="hidden" id="num" value=${list.num }>${list.num}</td>
					<td colspan="2">작성자</td>
					<td><input type="hidden" id="writer" value=${list.boardWriter }>${list.boardWriter}</td>
					<td>작성시간</td>
					<td colspan="6">${list.regDate}</td>
					<td>조회수</td>
					<td>${list.views+1}</td>	
				</tr>
				<tr>
					<td colspan="14" style="height: 400px; white-space:pre;">${list.content}</td>
				</tr>
				</c:forEach>
			
			</table>
		<button type="button" onclick="location.href='/bsy/ReadBoardAllController'">돌아가기</button>
		<button type="button" id="deletebtn">삭제</button>
		<button type="button" id="updatebtn">수정</button> 
		
			<div>
			
				<table border="1" id="resultTable1">
				         
							<tr>
								<td>번호</td>
								<td>작성자</td>
								<td id="comment">댓글</td>
								<td id="commentRegDate">작성일</td>
								<td id="commentDelete">삭제하기</td>
							</tr>
							
						
				</table>
				
				<div>
					댓글 입력 : <input type="text" id="commentInsert" name="commentInsert">
					작성자 : <input type="text" id="commentWriter" name="commentWriter" value="${id }" readonly="readonly">
						<button type="button" id="commentbtn" >댓글 작성</button>	
				</div>

			</div>   
   
	</div>
	
	
			
	
   
   
   
   
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	$(function () {
		
		$("#commentbtn").on("click",function(){
			var num = $("#num").val()
			var commentInsert = $("#commentInsert").val()
			var commentWriter = $("#commentWriter").val()
			
			 $.ajax({
			      url : "/bsy/commemtInsertController",   
			      type : "get",  
			      data : {commentInsert:commentInsert, commentWriter:commentWriter, num:num},
			      success : function(data) {          
			          location.reload();											
			          
			              },
			      error : function(request, status, error) {
			              alert("code:"+request.status);
			              alert("CommemtView에러");
			                       
			      }   
			})

			
			
		})
		
		
		
	
	 $(document).ready(function(){
	      
	      var num = $("#num").val();
	      
	      $.ajax({
	      url : "/bsy/commemtViewController",   
	      type : "POST",  
	      dataType: 'json',
	      data : {num:num},
	      success : function(data) {          
	          
	             var tableElement = "<tr>"; 

	               $.each(data , function(i){
	            	   

	                   var commentNum = data[i].commentNum;  
	                   var commentWriter = data[i].commentWriter;  
	                   var commentContent = data[i].commentContent;  
	                   var commentRegDate = data[i].commentRegDate.substring(0, 10);  
	                   var commentDelete = "commentDelete"+commentNum;
	     /*141 삭제버튼 마커 <a id="'+commentDelete+'"class="btn btn-outline-light text-dark ml-right "  href="#" >삭제하기</a> */               
	                 tableElement += '<td>'+ commentNum+'</td><td>'+commentWriter+'</td><td id="commentContent">'+commentContent+'</td><td id="commentRegDate">'+commentRegDate+'</td><td id="cde">'+'<a id="'+commentDelete+'" href="#" >삭제하기</a>'+'</td>';
	                 tableElement += '</tr>';
	                
	                 $(document).on("click","#"+commentDelete ,function() {
	         			if("${id}" == "admin"){
	         				
	         				if(!confirm('정말 삭제하시겠습니까?')){
	         					alert("취소되었습니다!");
	         					return false;
	         					
	         				}else {
	         					alert("삭제되었습니다!");
	         					alert(commentNum);
	                            location.href='commentDeleteController?commentNum='+commentNum;
	         					location.reload();
	                          }
	         			}else if("${id}" == commentWriter){
	         				alert(commentWriter);
	         				alert("${id}");
	         				if(!confirm('정말 삭제하시겠습니까?')){
	         					alert("취소되었습니다!");
	         					return false;
	         					
	         				}else {
	         					alert("삭제되었습니다!");
	         					alert(commentNum);
	                            location.href='commentDeleteController?commentNum='+commentNum;
	         					location.reload();
	                          }
	         			}else{
	         				alert("권한이 없습니다!")
	         			}
	         			
	         			
	         			
	         		}); 
	             });
	                            
	               $("#resultTable1").append(tableElement);
	              
	              

	              },
	      error : function(request, status, error) {
	              alert("code:"+request.status);
	              alert("CommemtView에러");
	                       
	      }   
	})

				
		
			$("#deletebtn").on("click" ,function(){
				
				if("${id }" == "admin"){
					alert("삭제되었습니다!");
					window.location.href='deleteContentController?num=' + $("#num").val();
						}else if("${id }" == $("#writer").val()){
						alert("삭제되었습니다!");
						window.location.href='deleteContentController?num=' + $("#num").val();
						}else if("${id }" != $("#writer").val()){
					alert("권한없음!");
				}
			})
	 	 
		
				
				$("#updatebtn").on("click" ,function(){
					
					if("${id }" == "admin" || "${id }" == $("#writer").val()){
						window.location.href='updateContentControllerForm?num=' + $("#num").val();
					} else{
							alert("권한없음!");
							event.preventDefault();
					}
					
				});
			
	 });
});
	
	

	
	
	</script>
	
</body>
</html>