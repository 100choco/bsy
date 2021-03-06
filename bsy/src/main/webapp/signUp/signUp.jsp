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
		<div class="row">
			<div class="col-sm-6">
				
					<form action="signUpController" method="get">
						<table class="table table-striped" id="signUpTable">
							<tr>
								<td>아이디 : </td><td> <input type="text" name="id" id="id" placeholder="아이디" style="width: 250px"><button type="button" id="idcbtn">중복확인</button></td><td></td>
							</tr>
							<tr>
								<td>비밀번호 : </td><td> <input type="password" name="password" id="password" placeholder="비밀번호" style="width: 250px"> </td>
							</tr>
							<tr>
								<td>비밀번호 확인 : </td><td> <input type="password" name="passwordcheck" id="passwordcheck" placeholder="비밀번호확인" style="width: 250px"> <button type="button" id="pwcbtn" name="pwcbtn">일치확인</button><label id=""></label></td><td>  </td>
							</tr>
							
							<tr>
								<td>전화번호 : </td><td colspan="2"> <input type="text" name="phoneNumber" id="phoneNumber" required="required" placeholder="번호 11자리를 입력해주세요" maxlength="11" style="width: 250px"> </td>
							</tr>
							<tr>
								<td>성별 : </td><td colspan="2"> 남 : <input type="radio" name="gender" value="m" checked="checked" id="genderM" required="required"> 여 : <input type="radio" name="gender" value="f" id="genderF"> </td>
							</tr>
							<tr >
								<td>이메일 : </td><td> <input type="email" name="email" id="email" required="required" style="width: 250px;" placeholder="이메일"></td><td></td>
							</tr>
							<tr>
								<td></td><td colspan="3"><label id="lab3"></label></td>
							</tr>
							<tr>
								<td>생년월일 : (선택)</td><td > <input type="date" name="birth" id="birth" style="width: 250px"> </td><td></td>
								
							</tr>
							<tr>
								<td colspan="2"> <input type="submit" value="가입하기" id="complete"> <button type="button" onclick="location.href='/bsy/main.jsp'">돌아가기</button> </td><td></td>
							</tr>
						
						</table>
				
				</form>
				
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	
	$(function () {
		var pwc = 0;
		var idchk = false;
		var emailchk = 0;
		var numRegex = /^01([0-9]{11})$/;
		
		
		
		
		
		/* $("#testBtn").on("click",function(){
			alert('a')
			var phoneNumber = $('#phoneNumber').val()
			if(/^[0-9]{11}/.test(phoneNumber)==true){
				alert('성공');
			} 
		}) */
		
		/* 비밀번호 일치확인 */
		 $("#pwcbtn").on("click",function(){
			
			var pw1 = $("#password").val();
			var pw2 = $("#passwordcheck").val();
			

			if(pw1 == "" && pw2== ""){
				alert("비밀번호를 입력해주세요");
			}else if(pw1 == pw2){
				pwc++;
				alert("비밀번호가 일치합니다");
			}else if(pw1 != pw2){
				alert("비밀번호가 다릅니다");
			}
		});
		
		//emil 확인 체크
         $("#email").on("keyup", function(){
            var email = $("#email").val();
            var check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]+\.)+[a-zA-Z]{2,3}$/i;
            if(!check.test(email)) {
               emailchk = 1;
                   $("#lab3").text("이메일 형식에 맞춰주세요");
                   $("#lab3").css("color", "red");
               }else{
                  emailchk = 0;
                    $("#lab3").text("알맞은 형식의 이메일입니다.");
                    $("#lab3").css("color", "blue");
                }
           });

		$("#complete").on("click",function(){
			var pw1 = $("#password").val();
			var pw2 = $("#passwordcheck").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var birth = $('#birth').val();
			var phoneNumber = $('#phoneNumber').val();

			
			if(pw1 == pw2 && pwc < 1){
				alert("비밀번호확인체크를 해주세요");
				event.preventDefault();
				
			}else if (email = ""){
				alert("이메일을 확인해 주세요");
				event.preventDefault();
				
			}else if(pw1 == "" || pw2== ""){
				alert("비밀번호 공백을 확인해 주세요");
				event.preventDefault();
				
			}else if(pw1 != pw2){
				alert("비밀번호를 일치하게 해주세요");
				event.preventDefault();
				
			}else if(idchk == false){
				alert("아이디 중복확인해주세요");
				idchk = false;
				event.preventDefault();
				
				/* 전화번호 11자리와 숫자만 사용 */
			}else if(phoneNumber == "" && phoneNumber == null){
				alert("폰번호를 확인해주세요");
				event.preventDefault();
			}else if(/^[0-9]{11}/.test(phoneNumber)==false){
				alert("전화번호 11자리를 확인해주세요");	
				event.preventDefault();
				
			}else if(emailchk == 1){
				alert("이메일 양식에 맞춰주세요");	
				
				event.preventDefault();
			}else{
				idchk = true;
				alert("회원가입 완료");
			}

		}); 
		
		/* 아이디 중복검사 */
			$("#idcbtn").click(function() {
				
			var id = $("#id").val();
			
			$.ajax({ 														//이 함수를 써서
				url : "/bsy/idCheckController",										//어디로 보낸다. 
				type : "POST",										//포스트 방식으로 밑에꺼를 url로 보낸다.
				data : {id:id},										//아이디명을 넘기면 벨류값도 넘어간다{name:valuse}
				success : function(data) {							//결과값은 데이타에 담긴다.
		
				if(data == 1){
					alert("아이디가 중복됩니다.");
					return idchk=false;
				}else if(data == 2){
					alert("아이디를 입력해 주세요");
					return idchk=false;
				}else if(data == 0){
					alert("사용가능한아이디입니다.");
					return idchk=true;
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