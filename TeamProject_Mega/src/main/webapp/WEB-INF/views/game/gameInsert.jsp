<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 정보 입력</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

table {
	border-collapse: collapse;
	width: 60%;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

input[type="text"], input[type="file"], input[type="button"] {
	padding: 6px 10px;
	margin-bottom: 10px;
}

input[type="file"] {
	padding-top: 3px;
}

input[type="button"] {
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
}

input[type="button"]:hover {
	background-color: #45a049;
}

.form-section {
	margin-bottom: 20px;
}

.form-section h2 {
	margin-bottom: 10px;
}

.form-section table {
	margin: 0;
}

.form-section label {
	display: block;
	margin-bottom: 5px;
}

.form-section input[type="text"], .form-section input[type="file"] {
	width: calc(100% - 24px);
}

.form-section input[type="button"] {
	width: auto;
	margin-top: 10px;
}

.link-container {
	margin-top: 20px;
}

.link-container a {
	text-decoration: none;
	color: blue;
}
</style>
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
	function meta10page() {
		let url = "metacritic10page.do";
		let param = "";
		sendRequest(url, param, meta10Callback, "POST");
	}
	function meta10Callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			alert(res);
		}
	}
</script>
</head>
<body>
	<div class="form-section">
		<h2>게임 정보 가져오기</h2>
		<form method="post">
			<label>게임 이름:</label> <input type="text" name="gameTitle"> <input
				type="button" value="메타크리틱 정보 가져오기" onclick="metaPulling(this.form)">
			<input type="button" value="메타크리틱 TOP 10 페이지 등록"
				onclick="meta10page(this.form)">
		</form>
	</div>

	<div class="form-section">
		<h2>게임 정보 입력</h2>
		<form id="sendForm" method="POST" enctype="multipart/form-data"
			action="gameInsert.do">
			<table>
				<tr>
					<td>이름</td>
					<td><input name="game_name"></td>
				</tr>
				<tr>
					<td>플렛폼</td>
					<td><input name="game_platforms"></td>
				</tr>
				<tr>
					<td>장르</td>
					<td><input name="game_genre"></td>
				</tr>
				<tr>
					<td>타입</td>
					<td><input name="game_type"></td>
				</tr>
				<tr>
					<td>연령등급</td>
					<td><input name="game_rating"></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><input name="game_developer"></td>
				</tr>
				<tr>
					<td>배급사</td>
					<td><input name="game_publisher"></td>
				</tr>
				<tr>
					<td>출시일</td>
					<td><input name="game_release_date"></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="game_img"></td>
				</tr>
				<tr>
					<td>유튜브URL</td>
					<td><input name="game_youtube_url"></td>
				</tr>
				<tr>
					<td>MetaCritic점수</td>
					<td><input name="game_meta_score"></td>
				</tr>
				<tr>
					<td>사용자후기점수</td>
					<td><input name="game_user_score"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="button"
						value="게임 등록" onclick="gameInsert(this.form)"></td>
				</tr>
			</table>
		</form>
	</div>

	<div class="link-container">
		<a href="gameList.do">게임 리스트로 이동</a><br>
		<a href="gameAdminPage.do">게임 관리 페이지</a>
	</div>
</body>
</html>
