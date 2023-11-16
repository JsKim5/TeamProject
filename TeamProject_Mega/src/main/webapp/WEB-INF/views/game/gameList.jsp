<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script>
	function del(f) {
		let idx = f.idx.value;
		let url = "gameDelete.do";
		let param = "idx=" + idx;
		sendRequest(url, param, delCallback, "POST");
	}

	function delCallback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			if (res == "no") {
				alert("삭제 실패");
				return;
			}
			alert("삭제 성공");
			location.href = "gameList.do";
		}
	}
</script>

<style>
table {
	margin: 0;
	padding: 0;
	border-collapse: collapse;
}

a {
	text-decoration: none;
	color: black;
}

</style>
</head>
<body>
	<div>
		<a href="gameInsertForm.do">게임 등록 페이지</a>
	</div>
	<form method="post">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table border = "1">
		<c:forEach var="l" items="${list}">
			<c:if test="${i%j == 0 }">
			<tr>
			</c:if>
				<td>${l.game_meta_score}</td>
				<td><a href="gameView.do?idx=${l.game_idx}">${l.game_name}</a></td>
				<td><input type="hidden" name="idx" value="${l.game_idx}"><input type="button" value="삭제" onclick="del(this.form)"></td>
			<c:if test="${i%j == j-1 }">
			</tr>
			</c:if>
	    <c:set var="i" value="${i+1 }" />
		</c:forEach>
		<tr>
			<td colspan = "9" align = "center">
				${pageMenu}
			</td>
		</tr>
	</table>
	</form>
</body>
</html>