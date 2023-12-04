<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 100%;
}

table td {
	text-align: left;
	width: 20%;
}

a {
	text-decoration: none;
	color: black;
}
</style>
<link rel="stylesheet"
	href="/teamproject/resources/css/styles_layout.css">
<!-- styles_layout.css 파일 링크 -->
<link rel="stylesheet"
	href="/teamproject/resources/css/styles_table.css">
<body>
  <a href="gameList.do">게임 리스트</a>
  <a href="gameInsertForm.do">게임 등록</a><br>

  <a href="review_AL.do">리뷰목록</a>

  <a href="join_form.do">회원가입 페이지</a>
  <a href="login_form.do">로그인 페이지</a>
  <a href="mypage.do">마이페이지</a>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- 헤더 부분 include -->
	<%@ include file="/WEB-INF/views/layout/sidebar.jsp"%>
	<!-- 사이드(좌측) 부분 include -->
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
			<td><a href="join_form.do">회원가입 페이지</a></td>
			<td><a href="login_form.do">로그인 페이지</a></td>
			<td><a href="mypage.do">마이페이지</a></td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<!-- 푸터 부분 include -->
</body>

</head>
</body>
</html>