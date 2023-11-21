<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<!-- 비밀번호 확인 페이지 -->
		<table>
			<!-- 일치하는 비밀번호가 없을때 표시 -->
			<tr>
				<td>비밀번호</td>
				<td>${ vo.user_pwd }</td>
			</tr>
			
			<tr>
				<td><input type="button" value="로그인 페이지로" onclick="location.href='login.do'"></td>
			</tr>
			
		</table>
	</body>
</html>