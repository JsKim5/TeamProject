<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<c:if test="${pw == null }">
				등록된 정보가 존재하지 않습니다
			</c:if>
			<c:if test="${pw != null }">
				비밀번호는 ${pw }입니다
			</c:if>
			
			<tr>
				<td><input type="button" value="로그인 페이지로" onclick="location.href='login.do'"></td>
			</tr>
			
		</table>
	</body>
</html>