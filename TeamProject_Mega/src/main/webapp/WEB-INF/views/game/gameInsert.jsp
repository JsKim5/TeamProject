<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script>
	function gameInsert(f) {
		f.submit();
	}
	function metaPulling(f) {
		alert('메서드 실행');
		let gameTitle = f.gameTitle.value;
		let url = "metacritic.do";
		let param = "gameTitle=" + gameTitle;
		sendRequest(url, param, metaCallback, "POST");
	}
	function metaCallback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			alert('콜백메서드 실행');
			let res = xhr.responseText;
			let json = eval("[" + res + "]");
			let form = document.getElementById("sendForm");
			form.game_name.value = json[0].metaData.game_name;
			form.game_platforms.value = json[0].metaData.game_platforms;
			form.game_genre.value = json[0].metaData.game_genre;
			form.game_type.value = json[0].metaData.game_type;
			form.game_rating.value = json[0].metaData.game_rating;
			form.game_developer.value = json[0].metaData.game_developer;
			form.game_publisher.value = json[0].metaData.game_publisher;
			form.game_release_date.value = json[0].metaData.game_release_date;
			//form.game_img.value = json[0].metaData.game_img;
			form.game_youtube_url.value = json[0].metaData.game_youtube_url;
			form.game_meta_score.value = json[0].metaData.game_meta_score;
			form.game_user_score.value = 0;
		}
	}
</script>
<body>
	<form method="post">
		<p>
			게임 이름 : <input name="gameTitle">
		</p>
		<p>
			<input type="button" value="metacritic정보가져오기"
				onclick="metaPulling(this.form)">
		</p>
	</form>
	<br>
	<form id="sendForm" method="POST" enctype="multipart/form-data"
		action="gameInsert.do">
		<p>
			이름 : <input name="game_name" value="test">
		</p>
		<p>
			플렛폼 : <input name="game_platforms" value="test">
		</p>
		<p>
			장르 : <input name="game_genre" value="test">
		</p>
		<p>
			타입 : <input name="game_type" value="test">
		</p>
		<p>
			연령등급 : <input name="game_rating" value="test">
		</p>
		<p>
			제조사 : <input name="game_developer" value="test">
		</p>
		<p>
			배급사 : <input name="game_publisher" value="test">
		</p>
		<p>
			출시일 : <input name="game_release_date" value="1999-09-09">
		</p>
		<p>
			이미지 : <input type="file" name="game_img">
		</p>
		<p>
			유튜브URL : <input name="game_youtube_url" value="test">
		</p>
		<p>
			MetaCritic점수 : <input name="game_meta_score" value="1">
		</p>
		<p>
			사용자후기점수 : <input name="game_user_score" value="1">
		</p>
		<input type="button" value="등록" onclick="gameInsert(this.form)">
	</form>
</body>
</html>