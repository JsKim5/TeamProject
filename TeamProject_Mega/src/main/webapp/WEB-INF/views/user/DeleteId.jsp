<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
				alert("del 메서드 실행");
				let pwd = f.user_pwd.value;
				
				if(!confirm("탈퇴 하시겠습니까?") ) {
					return;
				}
				
				if(pwd != ${login.user_pwd}) {
					alert{"비밀번호가 일치하지 않습니다"}
					return;
				}
				
				f.action="delete.do";
				f.submit();
				location.href="home.do";//홈페이지 url로 수정
			}
		</script>
		
	</head>
	
	<body>
		<table>
			<caption>회원 탈퇴</caption>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="user_pwd"></td>
				</tr>
				
				<tr>
					<td>
					<input type = "button" value="탈퇴하기" onclick="send(this.form);">
					</td>
				</tr>
				
				
		</table>
	</body>
</html>