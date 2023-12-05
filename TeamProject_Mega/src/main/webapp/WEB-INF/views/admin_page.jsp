<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/teamproject/resources/js/headerScript.js"></script>
<link rel="stylesheet" href="/teamproject/resources/css/layout_main.css">
<!-- styles_layout.css 파일 링크 -->
</head>
<body>


	
	
	<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>



	<table>
		<caption>링크목록</caption>
		<tr>
			<th colspan = "3">Game</th>
		</tr>
		<tr>
			<td><a href="gameList.do">게임 리스트</a></td>
			<td><a href="gameAdminPage.do">게임 관리 페이지</a></td>
			<td></td>
		</tr>
		<tr>
			<th colspan = "3">Review</th>
		</tr>
		<tr>
			<td><a href="review_AL.do">리뷰목록</a></td>
			<td><a href="MainPage.do">메인페이지</a></td>
			<td></td>
		</tr>
		<tr>
			<th colspan = "3">User</th>
		</tr>
		<tr>
		  <c:if test="${login == null }">
			<td><a href="join_form.do">회원가입</a></td>
		  </c:if>
		  
		  <c:if test="${login == null }">
			<td><a href="login_form.do">로그인</a></td>
		  </c:if>
			
		  <c:if test="${login != null }">
			<td><a href="mypage.do">마이페이지</a></td>
		  </c:if>
		</tr>
	</table>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<!-- 푸터 부분 include -->
</body>
</html>