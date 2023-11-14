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
	width: 200px;
	border-collapse: collapse;
	font-family: Arial, sans-serif;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
	color: #333333;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #e0e0e0;
}

td {
	text-align: center;
}

a{  
	text-decoration:none;
	font-size: 22px;
	color: black;
  	letter-spacing: 3px;
  	}
</style>
</head>
<body>
	<p>
		<a href="gameInsertForm.do">게임 등록 페이지</a>
	<p>
		<c:forEach var="l" items="${list}">

			<img src="${l.game_image_path}" width="200" height="300">
			<br>

			<form method="post">
				<input type="hidden" name="idx" value="${l.game_idx}">
				<table>
					<tr>
						<td><a href="gameView.do?idx=${l.game_idx}">${l.game_name}</a></td>
					</tr>
					<tr>
						<td><input type="button" value="삭제" onclick="del(this.form)"></td>
					</tr>
				</table>

			</form>
		</c:forEach>
</body>
</html>