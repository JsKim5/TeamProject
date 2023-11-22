<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	id=${login.user_id }
	pwd=${login.user_pwd }
	
	<input type="button" value="마이페이지" onclick="location.href='mypage.do'">
</body>
</html>