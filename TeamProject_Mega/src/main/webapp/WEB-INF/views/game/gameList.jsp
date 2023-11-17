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
		sendRequest(url, param, callback, "POST");
	}

	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			if (res == "del") {
				alert("삭제 성공");
				location.href = "gameList.do";
				return;
			}
			if(res == "searchSelect"){
				alert("select성공");
				
				return;
			}
			
		}
	}
	
	function selectSearch(f){
		let select = f.g_select.value;
		let url = "gameSelectSearch.do";
		let param = "select=" + select;
		sendRequest(url, param, callback, "POST");
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
	<div>
		
			
				<form>
				<table>
					<tr>
						<td>
							<select name = "g_select">
									<option value="game_genre">장르</option>
									<option value="game_platforms">플렛폼</option>
									<option value="game_developer">제작사</option>
									<option value="game_publisher">배급사</option>
							</select>
						</td>
					<td>
						<input type="button" value="조건 검색" onclick="selectSearch(this.form)">
					</td>
					<td>
						<input type="button" value="검색" onclick="">
					</td>
					</tr>
					
					<tr>
						<td>
							<c:forEach var="s" items="${selectList}">
								${s.value}
							</c:forEach>
						</td>
					</tr>
				</table>
				</form>
			
		
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