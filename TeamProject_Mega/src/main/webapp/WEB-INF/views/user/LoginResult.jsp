<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${login.user_name }님 환영합니다
	
	<input type="button" value="마이페이지" onclick="location.href='mypage.do'">
	<input type="button" value="로그아웃" onclick="location.href='logout.do'">
	<input type="button" value="회원탈퇴" onclick="location.href='delete_form.do'">
</body>
</html>