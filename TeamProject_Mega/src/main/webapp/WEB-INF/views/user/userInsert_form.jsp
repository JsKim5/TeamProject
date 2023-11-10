<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
				let name = f.user_name.value;
				let id = f.user_id.value;
				let pwd = f.user_pwd.value;
				let email = f.user_email.value;
				let tel = f.user_tel.value;
				let nickname = f.user_nickname.value;
				
				if( name.trim() == '' ){
					alert("이름을 입력하세요");
					return;
				}
				
				if( id.trim() == '' ){
					alert("아이디를 입력하세요");
					return;
				}
				
				if( pwd.trim() == '' ){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if( email.trim() == '' ){
					alert("이메일을 입력하세요");
					return;
				}
				
				if( tel.trim() == '' ){
					alert("전화번호를 입력하세요");
					return;
				}
				
				if( nickname.trim() == '' ){
					alert("닉네임을 입력하세요");
					return;
				}
				
				f.action="userinsert.do";
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<form method="post" action="userinsert.do"></form>
			<table border="1" align="center">
				<tr>
					<td>이름</td>
					<td><input name="user_name"></td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td><input name="user_id"></td>
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="user_pwd"></td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td><input type="email" name="user_email"></td>
				</tr>
				
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="tel" name="user_tel"></td>
				</tr>
				
				<tr>
					<td>닉네임</td>
					<td><input name="user_nickname"></td>
				</tr>
				
				<tr>
					<td>프사</td>
					<td><input type="image" name="user_image_path"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="가입" onclick="send(this.form)">
						<input type="button" value="이전화면" onclick="location.href=home.do">
					</td>
			</table>			
	</body>
</html>