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
						<button type="button" id="commentbtn" >bbb</button>	
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
	                    
	                 tableElement += '<td>'+ commentNum+'</td><td>'+commentWriter+'</td><td id="commentContent">'+commentContent+'</td><td id="commentRegDate">'+commentRegDate+'</td><td id="cde">'+'<a id="'+commentDelete+'"class="btn btn-outline-light text-dark ml-right "  href="#" >삭제하기</a>'+'</td>';
	                 tableElement += '</tr>';
	                 
	                 
	               });
	                            
	               $("#resultTable1").append(tableElement);
	              
	              

	              },
	      error : function(request, status, error) {
	              alert("code:"+request.status);
	              alert("CommemtView에러");
	                       
	      }   
	})

				
		
		$(document).on("click", "#"+idNo, function() {
	                    
	                    if(userAd==1){
	                         if(!confirm('정말 삭제하시겠습니까?')){
	                             return false;
	                          }else {
	                            location.href='#'+bnum+'&cnum='+cnum+'&cwriter='+cwriter;
	                          }

	                    }else{
	                        if(userId==cwriter){
	                             if(!confirm('정말 삭제하시겠습니까?')){
	                                 return false;
	                              }else {
	                                location.href='/minPJ02/CommentDelete?bnum='+bnum+'&cnum='+cnum+'&cwriter='+cwriter;
	                              }
	                        }else{
	                           alert("권한이 없습니다.")
	                           return false;
	                        }    
	                    }
	                    
	                  }); 
		
		
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
})
	/* 	function ajax(url = '',
		            data = {},
		            method = 'post',
		            type = 'x-www-form-urlencoded') {
		
			console.log(data);
		
		
		  let contentType = undefined;
		  if(type == "json"){
		      contentType = "application/json; charset=utf-8";
		      data = JSON.stringify(data);
		  }else{
		      contentType = "application/x-www-form-urlencoded";
		  }
		
		  let res = undefined;
		  $.ajax({
		      url : url,
		      method : method,
		      async: false,
		      data : data,
		      contentType: contentType,
		      success : function(result){ // ajax 통신 후 가져온 데이터
		          //console.log("Ajax 결과 -> ");
		          //console.log(result);
		          res = result;
		      },
		      error: function(e) {
		          console.error(e);
		      }
		  });
		  return res;
		}
	
	function test() {
		var text1 = $("#text1").val();
		var text2 = $("#text2").val();
		var text3 = $("#text3").val();
		data = {
				text1:text1,
				text2:text2,
				text3:text3
		}
		result = ajax('commemtViewController', data, 'post', 'json')
		console.log(result)
	} */
	

	
	
	</script>
	
</body>
</html>