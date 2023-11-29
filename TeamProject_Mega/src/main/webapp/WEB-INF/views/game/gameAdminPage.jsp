<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 관리</title>

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
/* 버튼 */
button, input[type="button"] {
	padding: 5px 5px;
	border: none;
	border-radius: 5px;
	background-color: #f0f0f0;
	color: black;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

/* 호버 효과 */
button:hover, input[type="button"]:hover {
	background-color: #464A52;
}

/* 클릭 효과 */
button:active, input[type="button"]:active {
	background-color: #3e8e41;
}
</style>
<link rel="stylesheet"
	href="/teamproject/resources/css/styles_layout.css">
<!-- styles_layout.css 파일 링크 -->
<link rel="stylesheet"
	href="/teamproject/resources/css/styles_table.css">
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script>
	function del(f) {
		let idx = f.game_idx.value;
		let url = "gameDelete.do";
		let param = "idx=" + idx;
		sendRequest(url, param, callback, "POST");
	}

	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			if (res == "del") {
				location.href = "gameAdminPage.do?page=${param.page}";
				return;
			} else {
				document.getElementById('errorMessage').innerText = "삭제 실패";
			}
		}
	}

	function registration(f) {
		f.action = "youtubeUrlUpdate.do";
		f.submit();
	}

	function search(f) {
		let searchTitle = f.searchTitle.value;
		location.href = "gameAdminPage.do?searchTitle=" + searchTitle;
	}
</script>
</head>

<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- 헤더 부분 include -->
	<%@ include file="/WEB-INF/views/layout/sidebar.jsp"%>
	<!-- 사이드(좌측) 부분 include -->
	<div>
		<a href="gameList.do">게임 리스트로 이동</a><br> <a
			href="gameInsertForm.do">게임 등록 페이지</a>
	</div>
	<form>
		<input type="text" name="searchTitle" placeholder="게임 제목 검색">
		<input type="button" value="검색" onclick="search(this.form)">
	</form>
	<div class="message" id="errorMessage"></div>
	<table border="1">
		<tr>
			<th>idx</th>
			<th>name</th>
			<th>delete</th>
			<th>youtube url update</th>
		</tr>
		<c:forEach var="l" items="${list}">
			<form>
				<input type="hidden" name="game_idx" value="${l.game_idx}">
				<input type="hidden" name="game_name" value="${l.game_name}">
				<input type="hidden" name="page" value="${param.page}">
				<tr>
					<td>${l.game_idx}</td>
					<td>${l.game_name}</td>
					<td><input type="button" value="삭제" onclick="del(this.form)"></td>
					<td><input name="game_youtube_url"> <input
						type="button" value="등록" onclick="registration(this.form)">
						<c:if test="${l.game_youtube_url == 'N/A'}">*URL등록 필요*</c:if></td>
				</tr>
			</form>
		</c:forEach>
		<tr>
			<td align="center" colspan="4">${pageMenu}</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>총 게임수</th>
			<td>${total}</td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<!-- 푸터 부분 include -->
</body>
</html>
