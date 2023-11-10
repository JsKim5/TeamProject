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
		function del(f){
			let idx = f.idx.value;
			let url = "gameDelete.do";
			let param = "idx=" + idx;
			sendRequest(url, param, delCallback, "POST");
		}
		
		function delCallback(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let res = xhr.responseText;
				if(res == "no"){
					alert("삭제 실패");
					return;
				}
				alert("삭제 성공");
				location.href = "gameList.do";
			}
		}
	
	</script>
</head>
<body>
	<p>
		<a href="gameInsertForm.do">게임 등록 페이지</a>
	<p>
		<c:forEach var="l" items="${list}">
			<form method="post">
			<p>${l.game_idx}
				- <a href="gameView.do?idx=${l.game_idx}">${l.game_name}</a>
				<input type="hidden" name="idx" value="${l.game_idx}">
				<input type="button" value="삭제" onclick="del(this.form)">
			</p>
			</form>
		</c:forEach>
</body>
</html>