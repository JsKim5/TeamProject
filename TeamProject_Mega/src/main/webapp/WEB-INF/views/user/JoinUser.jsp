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
		
		<script src="/teamproject/resources/js/httpRequest.js"></script>
		
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
			if(f.check1.value != "yes"){
				alert("id중복검사하세요~");
				return;
			}
			if(f.check2.value != "yes"){
				alert("닉네임중복검사하세요~");
				return;
			}
			f.action = "join.do";
			f.submit();
			
			
			
			alert("회원가입이 완료되었습니다");
			
		}
			
		
			//id
			
			function check_id(f) {
				
				let id = f.user_id.value.trim();
				
				if(id == '') {
					alert("아이디를 입력하세요");
					return;
				}
				
				let url= "checkid.do";
				let param = "user_id="+id;
				
				
				
				sendRequest(url, param, checkFn, "post");
			}
			
			function checkFn() {

				if(xhr.readyState == 4 & xhr.status == 200) {
					
					let data = xhr.responseText;
					
					if(data == 'no') {
						alert("이미 사용중인 id입니다");
						return;
					}
					let joingtform = document.getElementById('joingt');
					let check = joingtform.check1.value = "yes";
					
					alert("사용 가능한 id입니다");
				}
			}
			
			
			
			//닉네임
			
			function check_nickname(f) {
				
				let nickname = f.user_nickname.value;
				
				let url= "checknickname.do";
				let param = "user_nickname="+nickname;
				
				sendRequest(url, param, checknicknameFn, "post");
			}
			
			function checknicknameFn() {

				if(xhr.readyState == 4 & xhr.status == 200) {
					
					let data = xhr.responseText;
					
					if(data == 'no') {
						alert("이미 사용중인 닉네임입니다");
						return;
					}
					
					let joingtform = document.getElementById('joingt');
					let check = joingtform.check2.value = "yes";

					
					alert("사용 가능한 닉네임입니다");
				}
			}
			
			
		</script>
	</head>
	
	<body>
		<form id="joingt" action="join.do" method="post">
		<input type="hidden" name="check1" value="no">
		<input type="hidden" name="check2" value="no">
			<table border="1">
				<caption>회원가입</caption>
			
				<tr align="center">
					<td>이름</td>
					<td><input name="user_name"></td>
				</tr>
				
				<tr align="center">
					<td>이메일</td>
					<td><input type="email" name="user_email"></td> 
					<!-- <td><input class="box" id="domain-txt" name="user_email1">@
						<select class="box" id="domain-list" name="user_email2">
						  <option value="naver.com">naver.com</option>
						  <option value="google.com">google.com</option>
						  <option value="hanmail.net">hanmail.net</option>
						  <option value="nate.com">nate.com</option>
						  <option value="kakao.com">kakao.com</option>
						</select><td> -->
				</tr>
				<!-- 이메일 앞부분을 1 뒷부분을 2로 받아서 db에 저장하고 불러올때 1과 2를 둘다 불러오는 방식 -->
				
				<tr align="center">
					<td>아이디</td>
					<td><input name="user_id"></td>
					<td><input type="button" value="중복검사" onclick="check_id(this.form);">
					
				</tr>
				
				<tr align="center">
					<td>비밀번호</td>
					<td><input type="password" name="user_pwd"></td>
				</tr>
				
				<tr align="center">
					<td>닉네임</td>
					<td><input name="user_nickname"></td>
					<td><input type="button" value="중복검사" onclick="check_nickname(this.form);">
				</tr>
				
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