<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="${vo.game_image_path}" width="550"><br>

	<p>이름 : ${vo.game_name}</p>
	<p>플렛폼 : ${vo.game_platforms}</p>
	<p>장르 : ${vo.game_genre}</p>
	<p>타입 : ${vo.game_type}</p>
	<p>연령등급 : ${vo.game_rating}</p>
	<p>제조사 : ${vo.game_developer}</p>
	<p>배급사 : ${vo.game_publisher}</p>
	<p>출시일 : ${vo.game_release_date}</p>
	<p>이미지경로 : ${vo.game_image_path}</p>
	<p>유튜브URL : ${vo.game_youtube_url}</p>
	<p>MetaCritic점수 : ${vo.game_meta_score}</p>
	<p>사용자후기점수 : ${vo.game_user_score}</p>
</body>
</html>