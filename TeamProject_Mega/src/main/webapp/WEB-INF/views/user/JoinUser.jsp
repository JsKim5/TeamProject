<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
		    body {
		      font-family: 'Arial', sans-serif;
		      margin: 0;
		      padding: 0;
		      background-color: #f2f2f2;
		      display: flex;
		      align-items: center;
		      justify-content: center;
		      min-height: 100vh;
		    }
		
		    table {
		      width: 80%;
		      margin: 50px auto;
		      padding: 20px;
		      background-color: #fff;
		      border-radius: 8px;
		      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		      border-collapse: collapse;
		    }
		
		    th, td {
		      padding: 15px;
		      text-align: center;
		    }
		
		    th {
		      background-color: #f5f5f5;
		      border-top: 1px solid #ddd;
		      border-bottom: 1px solid #ddd;
		    }
		
		    tr:nth-child(1) th {
		      border-top: none;
		    }
		
		    tr:nth-child(odd) {
		      background-color: #f9f9f9;
		    }
		
		    tr:hover {
		      background-color: #f0f0f0;
		    }
		
		    caption {
		      font-size: 24px;
		      margin: 10px 0;
		    }
		
		    .aa {
		      border-right: 1px solid #ddd;
		    }
		
		    a {
		      text-decoration: none;
		      color: #333;
		      font-weight: bold;
		    }
		
		    input[type="button"] {
		      background-color: #FFFFE4;
		      color: #000000;
		      padding: 10px 20px;
		      border: none;
		      border-radius: 4px;
		      cursor: pointer;
		      font-size: 1em;
		      transition: background-color 0.3s;
		    }
		
		    input[type="button"]:hover {
		      background-color: #45a049;
		    }
		 </style>
		
		<script>
			function send_check(f) {
				let user_name = f.user_name.value.trim();
				let user_pwd = f.user_pwd.value.trim();
				let user_nickname = f.user_nickname.value.trim();
				let user_email = f.user_email.value.trim();
				let user_id = f.user_id.value.trim();

				
				if(user_id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(user_pwd == ''){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(user_nickname == ''){
					alert("닉네임을 입력하세요");
					return;
				}

				if(user_name == ''){
					alert("이름을 입력하세요");
					return;
				}
				
				if(user_email == ''){
					alert("이메일을 입력하세요");
					return;
				}
				
				f.action = "join.do";
				f.submit();
				
			}
			
			function idcheck(){
				$.ajax({
					url : "checkid", //url안에 뭘넣어야하는지
					type : "post",
					dataType : "json",
					data : {"user_id" : $("#user_id").val()},
					success : function(data){
						if(data == 1){
							alert("중복된 아이디입니다.");
						}else if(data == 0){
							$("#checkid").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
						}
					}
				})
		</script>
	</head>
	
	<body>
		<form action="join.do" method="post">
			<table border="1">
				<caption>회원가입</caption>
			
				<tr align="center">
					<td>이름</td>
					<td><input name="user_name"></td>
				</tr>
				
				<!-- <tr align="center">
					<td>전화번호</td>
					<td><input type="tel" name="user_tel"></td> 본인인증 구현
				</tr> -->
				
				<tr align="center">
					<td>이메일</td>
					<td><input type="email" name="user_email"></td>
				</tr>
				
				<tr align="center">
					<td>아이디</td>
					<td><input name="user_id"></td>
					<td><input type="button" value="중복검사" onclick="idcheck();">
				</tr>
				
				<tr align="center">
					<td>비밀번호</td>
					<td><input type="password" name="user_pwd"></td>
				</tr>
				
				<tr align="center">
					<td>닉네임</td>
					<td><input name="user_nickname"></td>
				</tr>
				
				<!-- <tr align = "center" >
					<form method="POST" enctype="multipart/form-data">
					<td>프로필 사진</td>
					<td><input type="file" name="photo"></td>
					</form>
				</tr> -->
				
				<tr>
					<td colspan="1">
					<input type="button" value="가입하기" onclick="send_check(this.form);">
					<input type = "button" value="뒤로가기" onclick = "location.href='home.do'"><!-- home.do를 초기화면 url로 수정 -->
					</td>
				</tr>
	</table>
		</form>
	</body>
</html>