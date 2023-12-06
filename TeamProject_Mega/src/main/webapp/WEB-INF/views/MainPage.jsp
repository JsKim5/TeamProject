<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="/teamproject/resources/js/headerScript.js"></script>

<link rel="stylesheet" href="/teamproject/resources/css/layout_main.css">

<script>
	function send(f) {
		let id = f.user_id.value.trim();
		let pw = f.user_pwd.value.trim();

		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}

		if (pw == '') {
			alert("비밀번호를 입력하세요");
			return;
		}

		f.action = "login.do";
		f.submit();

	}

	function openPopup() {
		document.getElementById("register-popup").style.display = "block";
	}

	function closePopup() {
		document.getElementById("register-popup").style.display = "none";
	}

	function openSearchPopup() {
		document.getElementById("search-popup").style.display = "block";
	}

	function closeSearchPopup() {
		document.getElementById("search-popup").style.display = "none";
	}
</script>

<!-- 메뉴 스타일 -->
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

#header {
	background-color: #333;
	color: white;
	padding: 15px;
	text-align: center;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#menu-container {
	display: flex;
	align-items: center;
}

.menu-item {
	position: relative;
	margin: 0 15px;
}

.submenu {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #444;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	width: 200px;
	border-radius: 0 0 5px 5px;
}

.submenu a {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.submenu a:hover {
	background-color: #555;
}

.menu-item:hover .submenu {
	display: block;
}

#button-container {
	display: flex;
	align-items: center;
}

#search-btn, #register-btn {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 15px;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	cursor: pointer;
	margin-right: 15px;
}

/* 추가: 팝업 스타일 */
#search-popup {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 50px; /* 수정: 팝업 크기 조정 */
	z-index: 2;
}

/* 추가: 팝업 닫기 버튼 스타일 */
#close-popup {
	position: absolute;
	top: 10px;
	right: 10px;
	color: black;
	cursor: pointer;
}

#popup-search-input {
	width: calc(100% - 20px);
	padding: 10px;
	font-size: 16px;
	margin-top: 10px;
	box-sizing: border-box;
}
</style>

<!-- 팝업창 스타일 -->
<style>
/* 팝업 스타일 */
.popup {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.login-form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-table {
	width: 100%;
}

.login-table, .login-th, .login-td {
	border: 1px solid #ddd;
	border-collapse: collapse;
}

.login-th, .login-td {
	padding: 12px;
	text-align: left;
}

.login-th {
	background-color: #f2f2f2;
}

.login-input {
	width: 100%;
	padding: 8px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.login-button {
	background-color: #4caf50;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
}

.login-button:hover {
	background-color: #45a049;
}

.login-link {
	text-decoration: none;
	color: #333;
}

.login-error {
	color: red;
	text-align: center;
	margin-top: 10px;
}

.close-button {
	background-color: #f44336;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 10px auto; /* 중앙으로 이동 */
	cursor: pointer;
	border-radius: 4px;
}

.close-button:hover {
	background-color: #d32f2f;
}
</style>

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
	margin-left: 50px;
	margin-top: 10px;
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
	<p>New Releases</p> 
	<hr>
	<!-- 게임리스트 들어갈 자리 -->
	
	<img src="/teamproject/resources/game_img/elden-ring.png" class="custom-image">
	<p>Elden-Ring</p>
							
	&nbsp;
	<p>Upcoming Games</p>
	<hr>
	<!-- 게임리스트 들어갈 자리 -->
	&nbsp;
	<p>Best Games On</p>
	<hr>
	
	

</body>
</html>