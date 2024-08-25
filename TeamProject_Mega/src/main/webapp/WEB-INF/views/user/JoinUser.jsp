<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

table {
	width: 100%;
	margin: 50px auto;
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
	font-size: 2em; /* 글자 크기 조절 */
	font-family: 'Arial', sans-serif; /* 글꼴 설정 */
	color: #333; /* 글자 색상 설정 */
	font-weight: bold; /* 글자 두께 설정 */
	margin-bottom: 20px; /* 아래 여백 추가 */
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
	background-color: #45a049;
}
</style>

<script src="/teamproject/resources/js/httpRequest.js"></script>

<script>
	function send_check(f) {
		alert("콜백메서드1 호출!");
		let user_name = f.user_name.value.trim();
		alert("콜백메서드2 호출!");
		let user_pwd = f.user_pwd.value.trim();
		
		let user_nickname = f.user_nickname.value.trim();
		let user_email = f.user_email.value.trim();
		let user_id = f.user_id.value.trim();
		let user_pwdchk = f.user_pwdchk.value.trim();
		alert("콜백메서드3 호출!");
		let user_email2 = f.user_email2.value.trim();
		let input_email = f.direct_input.value;
		

		if (user_id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		alert("콜백메서드4 호출!");
		if (user_pwd == '') {
			alert("비밀번호를 입력하세요");
			return;
		}
		alert("콜백메서드5 호출!");
		if (user_pwdchk == '') {
			alert("비밀번호를 입력하세요")
			return;
		}
		alert("콜백메서드6 호출!");
		if (user_nickname == '') {
			alert("닉네임을 입력하세요");
			return;
		}
		alert("콜백메서드7 호출!");
		if (user_name == '') {
			alert("이름을 입력하세요");
			return;
		}

		if (user_email == '') {
			alert("이메일을 입력하세요");
			return;
		}

		if (user_pwd != user_pwdchk) {
			alert("비밀번호가 일치하지 않습니다");
			return;
		}

		if (f.check1.value != "yes") {
			alert("id중복검사하세요~");
			return;
		}

		if (f.check2.value != "yes") {
			alert("닉네임중복검사하세요~");
			return;
		}
		alert("콜백메서드8 호출!");
		f.action = "join.do?inputEmail="+input_email;
		alert("콜백메서드9 호출!");
		f.submit();
		alert("회원가입이 완료되었습니다");

	}

	//id

	function check_id(f) {
		alert("아이디 중복검사1 호출!");
		let id = f.user_id.value.trim();
		alert("아이디 중복검사2 호출!");
		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		alert("아이디 중복검사3 호출!");
		let url = "checkid.do";
		let param = "user_id=" + id;
		alert("아이디 중복검사4 호출!");
		sendRequest(url, param, checkFn, "post");
	}

	function checkFn() {
		alert("반환!");
		if (xhr.readyState == 4 & xhr.status == 200) {
			alert("반환2");
			let data = xhr.responseText;

			if (data == 'no') {
				alert("이미 사용중인 id입니다");
				return;
			}
			let joingtform = document.getElementById('joingt');
			let check = joingtform.check1.value = "yes";

			alert("사용 가능한 id입니다");
		}
	}

	//닉네임

	function check_nickname(f) {

		let nickname = f.user_nickname.value;

		let url = "checknickname.do";
		let param = "user_nickname=" + nickname;

		sendRequest(url, param, checknicknameFn, "post");
	}

	function checknicknameFn() {

		if (xhr.readyState == 4 & xhr.status == 200) {

			let data = xhr.responseText;

			if (data == 'no') {
				alert("이미 사용중인 닉네임입니다");
				return;
			}

			let joingtform = document.getElementById('joingt');
			let check = joingtform.check2.value = "yes";

			alert("사용 가능한 닉네임입니다");
		}
	}
</script>

<script>
	function checkDirectInput(select) {
		var directInput = document.getElementById("direct-input");
		directInput.style.display = (select.value === "direct") ? "inline-block"
				: "none";
	}
</script>
</head>

<body>
	<form id="joingt" action="join.do" method="post">
		<input type="hidden" name="check1" value="no">
		<input type="hidden" name="check2" value="no">
		<table border="1">
			<caption>회원가입</caption>

			<tr align="center">
				<td>이름</td>
				<td colspan="2"><input name="user_name" size="15"></td>
			</tr>

			<tr align="center">
				<td>이메일</td>
				<td colspan="3"><input class="box" id="domain-txt"
					name="user_email" size="15"> @ <input class="box"
					id="direct-input" name="direct_input" style="display: none;"
					placeholder="도메인 직접 입력" size="15"> <select class="box"
					id="domain-list" name="user_email2"
					onchange="checkDirectInput(this)">
						<option value="">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
						<option value="direct">직접 입력</option>
				</select> <input type="text" id="direct-input" name="direct_email"
					style="display: none;" placeholder="직접 입력"></td>
			</tr>

			<tr align="center">
				<td>아이디</td>
				<td><input name="user_id" size="15"></td>
				<td><input type="button" value="중복검사"
					onclick="check_id(this.form);">
			</tr>

			<tr align="center">
				<td>비밀번호</td>
				<td colspan="2"><input type="password" name="user_pwd"
					size="15"></td>
			</tr>

			<tr align="center">
				<td>비밀번호 확인</td>
				<td colspan="2"><input type="password" name="user_pwdchk"
					size="15"></td>
			<tr align="center">
				<td>닉네임</td>
				<td><input name="user_nickname" size="15"></td>
				<td><input type="button" value="중복검사"
					onclick="check_nickname(this.form);">
			</tr>

			<tr>
				<td colspan="3" align="right">
					<input type="button" value="가입하기" onclick="send_check(this.form);">
					<input type="button" value="뒤로가기" onclick="location.href='home.do'"> <!-- home.do를 초기화면 url로 수정 -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>