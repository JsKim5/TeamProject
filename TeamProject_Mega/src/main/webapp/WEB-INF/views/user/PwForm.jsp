<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 비밀번호 찾기 페이지 -->
		<form action = "/project/user/checkpw.jsp" method="post" name="checkpw">
				<table border="1">
					<caption>비밀번호 찾기</caption>
					
					<tr>
						<td>이름</td>
						<td><input name="s_name"></td><!-- user_name으로 해야하는지 확인 -->
					</tr>
					
					<tr>
						<td>아이디</td>
						<td><input name="s_id"></td>
					</tr>
					
					<tr>
						<td>주민번호</td>
						<td><input name="s_rrn1" maxlength="6"></td>
						<td><input name="s_rrn2" maxlength="7" type="password"></td> <!-- 뒷자리 암호화 방법 -->
					</tr>
					
					<tr>
						<td colspan="1" align="right">
						<input type="button" value="아이디 찾기" onclick="send(this.form)">
						</td>
				</table>
			</form>
</body>
</html>