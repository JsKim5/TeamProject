<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>

<meta charset="UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/teamproject/resources/js/headerScript.js"></script>



<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/teamproject/resources/js/headerScript.js"></script>
<link rel="stylesheet" href="/teamproject/resources/css/layout_main.css">

<!-- GAMES스타일 -->
<style>
h1 {
	color: #4CAF50;
	font-family: 'Arial', sans-serif;
	font-size: 7em;
	font-weight: bold;
	margin-top: 20px;
	margin-left: 50px;
	margin-bottom: 1px;
}

p {
	color: #000;
	font-family: 'Verdana', sans-serif;
	font-size: 1.2em;
	margin-left: 50px;
}

hr {
	border: 1px solid #000; /* 검은색 선 스타일 지정 */
	margin-top: 20px; /* h1과 선 사이의 간격 조절 */
	margin-bottom: 5px; /* 선과 p 사이의 간격 조절 */
}

.custom-image {
	height: 300px;
	width:200px;
	border-radius: 15px;
	margin-left: 1px;
	margin-top: 10px;
}

.main-game-container {
	display: grid;
	grid-template-columns: repeat(5, 1fr); /* Two equal columns */
	gap: 20px; /* Gap between columns */
}

.main-game {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 15px;
	width:220px;

}
.main-detail {
	flex: 1;
	margin-left: 10px;
}

a {
	text-decoration: none;
	color : black;
}
</style>

</head>

<!-- 메인메뉴, 팝업창 -->
<body>
	<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>

	<!-- GAMES -->

	<h1>GAMES</h1>
	<p>Find your next captivating gaming moment</p>
	&nbsp;
	
	<!-- 게임리스트 들어갈 자리 -->
	<p>New Releases</p> 
	<hr>
	
	<div class="main-game-container">
		<c:forEach var="mv" items="${mainList}">
		<c:if test="${mv.main_row_idx == 1 }">
	<div class="main-game">
	<p><img class="custom-image" src="${mv.game_image_path}" ><br>
	<a href="gameView.do?idx=${mv.game_idx}">${mv.game_name}</a></p>
	&nbsp;
	</div>
		</c:if>
		</c:forEach>
	</div>
	
	<p>Upcoming Games</p> 
	<hr>
	
	<div class="main-game-container">
		<c:forEach var="mv" items="${mainList}">
		<c:if test="${mv.main_row_idx == 2 }">
	<div class="main-game">
	<p><img class="custom-image" src="${mv.game_image_path}" ><br>
	<a href="gameView.do?idx=${mv.game_idx}">${mv.game_name}</a></p>
	&nbsp;
	</div>
		</c:if>
		</c:forEach>
	</div>
	
	<p>Best Games on</p> 
	<hr>
	
	<div class="main-game-container">
		<c:forEach var="mv" items="${mainList}">
		<c:if test="${mv.main_row_idx == 3 }">
	<div class="main-game">
	<p><img class="custom-image" src="${mv.game_image_path}" ><br>
	<a href="gameView.do?idx=${mv.game_idx}">${mv.game_name}</a></p>
	&nbsp;
	</div>
		</c:if>
		</c:forEach>
	</div>
</body>
</html>