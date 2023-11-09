<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	
	<script>
		function gameInsert(f){
			f.submit();
		}
	</script>
	<body>
		<form method="post" action="/gameInsert.do">
			<p>이름 : <input name = "game_name"></p>
			<p>플렛폼 : <input name = "game_platforms"></p>
			<p>장르 : <input name = "game_genre"></p>
			<p>타입 : <input name = "game_type"></p>
			<p>연령등급 : <input name = "game_rating"></p>
			<p>제조사 : <input name = "game_developer"></p>
			<p>배급사 : <input name = "game_publisher"></p>
			<p>출시일 : <input name = "game_release_date"></p>
			<p>이미지경로 : <input name = "game_image_path"></p>
			<p>유튜브URL : <input name = "game_youtube_url"></p>
			<p>MetaCritic점수 : <input name = "game_meta_score"></p>
			<p>사용자후기점수 : <input name = "game_user_score"></p>
		</form>
	</body>
</html>