<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script>
	function selectSearch(f) {
		let select = f.g_select.value;
		let url = "gameSelectSearch.do";
		let param = "select=" + select;
		sendRequest(url, param, callback2, "POST");
	}

	function callback2() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			location.href = "gameList.do";
		}
	}

	function titleSearch(f) {
		if (f.title.value.trim() == "") {
			alert("게임 이름을 입력하세요");
			return;
		}
		f.action = "gameTitleSearch.do";
		f.submit();
	}
</script>
</head>
<body>
	<form>
		<!-- 조건검색(select) -->
		<select name="g_select"
			style="width: 150px; height: 30px; font-size: 15px;">
			<option value="game_genre">장르</option>
			<option value="game_platforms">플렛폼</option>
			<option value="game_developer">제작사</option>
			<option value="game_publisher">배급사</option>
		</select> <input type="button" value="조건 검색" onclick="selectSearch(this.form)">
		<input type="button" value="검색초기화"
			onclick="location.href='gameTitleSearch.do'">

		<!-- 게임이름 검색 -->
		게임이름 <input name="title"
			style="width: 150px; height: 15px; font-size: 14px;"> <input
			type="button" value="검색" onclick="titleSearch(this.form)">

		<!-- 검색 조건 출력 -->
		<c:if test="${not empty selectOption}">
			${selectOption}
		</c:if>
		<c:if test="${not empty param.searchTitle}">
			검색어 : ${param.searchTitle}
		</c:if>

		<!-- 조건 버튼 출력 -->
		<c:if test="${not empty selectList}">
			<c:forEach items="${selectList}" var="s" varStatus="loop">
				<c:forEach var="num" items="${indexNumber}">
					<c:if test="${loop.index == num}">

						<c:out value="${fn:toUpperCase(fn:substring(s, 0, 1))}" />

					</c:if>
				</c:forEach>
				<input type="button"
					onclick="location.href='gameList.do?selectCol=${selectCol}&search=${s}'"
					value="${s}">
			</c:forEach>
		</c:if>
	</form>

	<!-- 검색 결과 & 리스트 출력 -->
	<form>
		<c:if test="${empty list}">
			<th>검색 결과 없음</th>
		</c:if>
	</form>

	<c:forEach var="l" items="${list}" varStatus="loop">
		<c:if test="${loop.index % 5 == 0}">

		</c:if>
		<c:if test="${l.game_image_path == 'N/A' }">
			<img src="/teamproject/resources/game_img/no_file.png"
				class="custom-image">
		</c:if>
		<c:if test="${l.game_image_path != 'N/A' }">
			<img src="${l.game_image_path}" class="custom-image">
		</c:if>

		<a href="gameView.do?idx=${l.game_idx}">${l.game_name}</a>
			Meta Score : ${l.game_meta_score}
			${l.game_publisher}
			Released On : ${l.game_release_date}
			<br>
	</c:forEach>

	<c:if test="${not empty list}">
			${pageMenu}
	</c:if>
</body>
</html>