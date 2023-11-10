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
		<form method="POST" enctype="multipart/form-data" action="gameInsert.do">
			<p>이름 : <input name = "game_name" value="test"></p>
			<p>플렛폼 : <input name = "game_platforms" value="test"></p>
			<p>장르 : <input name = "game_genre" value="test"></p>
			<p>타입 : <input name = "game_type" value="test"></p>
			<p>연령등급 : <input name = "game_rating" value="test"></p>
			<p>제조사 : <input name = "game_developer" value="test"></p>
			<p>배급사 : <input name = "game_publisher" value="test"></p>
			<p>출시일 : <input name = "game_release_date" value="1999-09-09"></p>
			<p>이미지 : <input type = "file" name = "game_img"></p>
			<p>유튜브URL : <input name = "game_youtube_url" value="test"></p>
			<p>MetaCritic점수 : <input name = "game_meta_score" value="1"></p>
			<p>사용자후기점수 : <input name = "game_user_score" value="1"></p>
			<input type="button" value="등록" onclick="gameInsert(this.form)">
		</form>
	</body>
</html>