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
			<form action="signUpController" method="get">
				<table class="table table-striped">
					<tr>
						<td>아이디 : </td><td> <input type="text" name="id" id="id"><button type="button" id="idcbtn">중복확인</button></td>
					</tr>
					<tr>
						<td>비밀번호 : </td><td> <input type="password" name="password" id="password"> </td>
					</tr>
					<tr>
						<td>비밀번호 확인 : </td><td> <input type="password" name="passwordcheck" id="passwordcheck"><button type="button" id="pwcbtn">일치확인</button></td> 
					</tr>
					<tr>
						<td>전화번호 : </td><td colspan="2"> <input type="number" name="phoneNumber" id="phoneNumber" required="required" > </td>
					</tr>
					<tr>
						<td>성별 : </td><td colspan="2"> 남 : <input type="radio" name="gender" value="m" checked="checked" id="genderM" required="required"> 여 : <input type="radio" name="gender" value="f" id="genderF"> </td>
					</tr>
					<tr>
						<td>이메일 : </td><td> <input type="email" name="email" id="email" required="required"> </td>
					</tr>
					<tr>
						<td>생년월일 : </td><td > <input type="date" name="birth" id="birth" required="required"> </td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2"> <input type="submit" value="가입하기" id="complete"> </td>
					</tr>
				
				</table>
		
		</form>
	</div>
	<a href="/bsy/main.jsp">홈으로</a>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	
	$(function () {
		var pwc = 0;
		var ppp = false;
		 $("#pwcbtn").on("click",function(){
			
			var pw1 = $("#password").val();
			var pw2 = $("#passwordcheck").val();
			

			if(pw1 == "" && pw2== ""){
				alert("비밀번호를 입력해주세요");
			}else if(pw1 == pw2){
				pwc++;
				alert("비밀번호가 같습니다");
			}else if(pw1 != pw2){
				alert("비밀번호가 다릅니다");
			}
		});
		
		$("#complete").on("click",function(){
			var pw1 = $("#password").val();
			var pw2 = $("#passwordcheck").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var birth = $('#birth').val();
			
			alert(pwc);
			if(pw1 == pw2 && pwc < 1){
				alert("비밀번호확인체크를 해주세요");
				event.preventDefault();
				ppp = false;
			}else if (email = ""){
				alert("이메일을 확인해 주세요");
				event.preventDefault();
				ppp = false;
			}else if(pw1 == "" || pw2== ""){
				alert("비밀번호 공백을 확인해 주세요");
				event.preventDefault();
				ppp = false;
			}else if(pw1 != pw2){
				alert("비밀번호를 일치하게 해주세요");
				event.preventDefault();
				ppp = false;
			}else if(ppp == false){
				alert("아이디 중복확인해주세요");
				event.preventDefault();
			}else{
				ppp = true;
				alert("회원가입 완료");
			}

		}); 
			$("#idcbtn").click(function() {
			
			var id = $("#id").val();
			
			$.ajax({					//이 함수를 써서
				url : "/bsy/idCheckController",		//어디로 보낸다. 
				type : "POST",		//포스트 방식으로 밑에꺼를 url로 보낸다.
				data : {id:id},	//아이디명을 넘기면 벨류값도 넘어간다{name:valuse}
				success : function(data) {	//결과값은 데이타에 담긴다.
		
				if(data == 1){
					alert("아이디가 중복됩니다.");
					return ppp=false;
				}else if(data == 2){
					alert("아이디를 입력해 주세요");
					return ppp=false;
				}else if(data == 0){
					alert("사용가능한아이디입니다.");
					return ppp=true;
				}
				
				
				},
				error : function (request, status, error) {
					alert("에러");
					alert("code:"+request.status);
					
					
				}
			
			})
			
			
		});
		
	});
	
	</script>
</body>
</html>