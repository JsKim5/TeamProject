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
		<table>
			<c:if test="${id == null }">
				아이디가 존재하지 않습니다.
			</c:if>
			<c:if test="${id != null }">
				<td>${name }님의 아이디는 ${id} 입니다.</td>
			</c:if>
			
			
			<tr>
				<td><input type="button" value="로그인 페이지로" onclick="location.href='login_form.do'"></td>
				<td><input type="button" value="비밀번호 찾기" onclick="location.href='selectpw_form.do'"></td>
			</tr>
			
		</table>

	</body>
</html>