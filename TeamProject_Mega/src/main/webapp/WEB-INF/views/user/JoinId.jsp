<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send_check(f) {
				let id = f.user_id.value.trim();
				let pw = f.user_pw.value.trim();
				let tel = f.user_tel.value.trim();
				let name = f.user_name.value.trim();
				let email = f.user_email.value.trim();
				
				if(user_id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(user_pw == ''){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(user_tel == ''){
					alert("전화번호를 입력하세요");
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
				
				f.submit();
				
			}
		</script>
	</head>
	
	<body>
		<!-- <form action="login.do" method="post"> -->
			<table border="1">
				<caption>회원가입</caption>
			
				<tr align="center">
					<td>이름</td>
					<td><input name="user_name"></td>
				</tr>
				
				<tr align="center">
					<td>전화번호</td>
					<td><input type="tel" name="user_tel"></td> <!-- 본인인증 구현 -->
				</tr>
				
				<tr align="center">
					<td>이메일</td>
					<td><input type="email" name="user_email"></td>
				</tr>
				
				<tr align="center">
					<td>아이디<td>
					<td><input name="user_id"></td>
				</tr>
			
				<tr align="center">
					<td>비밀번호</td>
					<td><input type="password" name="user_pw"></td>
				</tr>
				
				<tr align="center">
					<td>닉네임</td>
					<td><input name="user_nickname"></td>
				</tr>
				
				<tr align="center">
					<td>프로필 사진</td><!-- 필수 x -->
					<td><input type="image" value="사진 선택" name="user_image_path"></td>
				</tr>
				
				<tr>
					<td colspan="1">
					<input type="button" value="가입하기" onclick="send_check(this.form);">
					<input type = "button" value="뒤로가기" onclick = "location.href='home.do'"><!-- home.do를 초기화면 url로 수정 -->
					</td>
				</tr>
	</table>
		<!-- </form> -->
	</body>
</html>