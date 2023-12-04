<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 정보 및 리뷰</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.table-container {
	margin: 20px;
}

table {
	width: 560px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: center;
}

th {
	background-color: #f5f5f5;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

tr:nth-child(1) th {
	border-top: none;
}

tr:nth-child(odd) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f0f0f0;
}

caption {
	font-size: 24px;
	margin: 10px 0;
}

.aa {
	border-right: 1px solid #ddd;
}

a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
}

input[type="button"] {
	background-color: #FFFFE4;
	color: #000000;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 1em;
	transition: background-color 0.3s;
}

input[type="button"]:hover {
	background-color: #2478FF;
}
</style>

</head>
<body>

	<div class="container">
		<div class="table-container">
			<table>
				<tr>
					<td colspan="2">
						<c:if test="${vo.game_youtube_url != 'N/A'}">
							${vo.game_youtube_url}
						</c:if>
						<c:if test="${vo.game_youtube_url == 'N/A'}">
							등록 대기중
						</c:if>
						</td>
				</tr>
				<tr>
					<th colspan="2" scope="col" class="skeletor">${vo.game_name}</th>
				</tr>
				<tr>
					<th>Platforms</th>
					<td>${vo.game_platforms}</td>
				</tr>
				<tr>
					<th>Genre</th>
					<td>${vo.game_genre}</td>
				</tr>
				<tr>
					<th>Developer</th>
					<td>${vo.game_developer}</td>
				</tr>
				<tr>
					<th>Publisher</th>
					<td>${vo.game_publisher}</td>
				</tr>
				<tr>
					<th>MetaCritic Score</th>
					<td>${vo.game_meta_score}</td>
				</tr>
				<tr>
					<th>User Score</th>
					<td>${vo.game_user_score}/5</td>
				</tr>
			</table>
		</div>

		<div class="table-container">
			<table>
				<caption>리뷰 목록</caption>
				<tr align="center">
					<td class="aa" width="50">작성자</td>
					<td class="aa" width="300">제목</td>
					<td class="aa" width="100">평점</td>
					<td width="200">작성일</td>
				</tr>
				<c:forEach var="review_vo" items="${list}">
					<tr align="center">
						<td>${review_vo.user_nickname }</td>
						<td><a href="review_view.do?idx=${review_vo.review_idx}&game_idx=${vo.game_idx}">
								${review_vo.review_title} </a></td>
						<td>${review_vo.user_score}/5</td>
						<td>${review_vo.date_created}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="right"><input type="button"
						value="리뷰작성"
						onclick="location.href='review_write.do?game_name=${vo.game_name}&idx=${vo.game_idx}'">
						<input type="button" value="리스트로" onclick="location.href='gameList.do'">
						<input type="button" value="홈으로" onclick="location.href='home.do'"></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>
