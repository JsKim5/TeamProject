<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
		</script>
	</head>
		
	<body>
		<!-- 아이디 확인 페이지 -->

		<c:if test="">
		
		</c:if>

		<table>
			<!-- 일치하는 아이디가 없을때 표시 -->
			<tr>
				<td>아이디</td>
				<td>${ vo.user_id }</td>
			</tr>
			
			<tr>
				<td><input type="button" value="로그인 페이지로" onclick="location.href='login.do'"></td>
				<td><input type="button" value="비밀번호 찾기" onclick="location.href='searchpw.do'"></td>
			</tr>
			
		</table>

	</body>
</html>