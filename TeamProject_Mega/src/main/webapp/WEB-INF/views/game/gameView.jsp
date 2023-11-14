<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: 0;
	padding: 0;
	width:560px;
	background-color: gray;
}
th {
	background-color: #444444;
}
.skeletor {
  	font-size:32px;
  	color: #aaaaaa;
  	letter-spacing: 3px;
  	text-shadow:
    	1px 1px 0 #fff,
    	0 0 9px #000;
}

</style>
</head>
<body>



	${vo.game_youtube_url}

	<table>
	
		<tr>
			<th colspan="2" scope="col" class="skeletor">${vo.game_name}</th>
		</tr>
		<tr>
			<th>Platforms</th><td>${vo.game_platforms}</td>
		</tr>
		<tr>
			<th>Developer</th><td>${vo.game_developer}</td>
		</tr>
		<tr>
			<th>Publisher</th><td>${vo.game_publisher}</td>
		</tr>
		<tr>
			<th>MetaCritic Score</th><td>${vo.game_meta_score}</td>
		</tr>
		<tr>
			<th>User Score</th><td>${vo.game_user_score} / 5</td>
		</tr>
	</table>

</body>
</html>