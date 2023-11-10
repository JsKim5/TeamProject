<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
						<input type="button" value="이전화면" onclick="location.href="><!-- 메인페이지.do 넣기 -->
					</td>
			</table>			
	</body>
</html>