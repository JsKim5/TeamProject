<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 관리</title>

<link rel="stylesheet"
	href="/teamproject/resources/css/layout_main.css">
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script src="/teamproject/resources/js/headerScript.js"></script>
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
	<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
	<!-- 헤더 부분 include -->


	<div>
		<a href="gameList.do">게임 리스트로 이동</a><br> <a
			href="gameInsertForm.do">게임 등록 페이지</a><br>
			<a href="testPage.do">test</a>
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
			<th>release date</th>
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
					<td>${l.game_release_date}</td>
					<td><input type="button" value="삭제" onclick="del(this.form)"></td>
					<td><input name="game_youtube_url"> <input
						type="button" value="등록" onclick="registration(this.form)">
						<c:if test="${l.game_youtube_url == 'N/A'}">*URL등록 필요*</c:if></td>
				</tr>
			</form>
		</c:forEach>
		<tr>
			<td align="center" colspan="5">${pageMenu}</td>
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
