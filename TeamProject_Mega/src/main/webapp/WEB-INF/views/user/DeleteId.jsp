<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function del() {
				let del_id = document.getElementById("c_pwd").value;
				
				if(!confirm("탈퇴 하시겠습니까?") ) {
					return;
				}
				
				if(del_id != ${vo.user_id}) {
					alert{"비밀번호가 일치하지 않습니다"}
					return;
				}
				
				location.href="home.do";//홈페이지 url로 수정
			}
		</script>
		
	</head>
	
	<body>
		<table>
			<caption>회원 탈퇴</caption>
				
				<tr>
					<td>아이디</td>
					<td><input name="user_id"></td>
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="del_pwd"></td>
				</tr>
				
				<tr>
					<td>
					<input type = "button" value="탈퇴하기" onclick="send(this.form);">
					</td>
				</tr>
				
				
		</table>
	</body>
</html>