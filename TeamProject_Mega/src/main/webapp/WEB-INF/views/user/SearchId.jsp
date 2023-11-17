<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
				let name = f.s_name.value.trim();
				let rrn1 = f.s_rrn1.value.trim();
				let rrn2 = f.s_rrn2.value.trim();
				
				if(name == '') {
					alert("이름을 입력하세요")
					return;
				}
				
				//앞자리
				if(rrn1 == '') {
					alert("주민등록번호를 입력하세요")
				}
				
				//뒷자리
				if(rrn2 == '') {
					alert("주민등록번호를 입력하세요")
				}
			}
		</script>
		
	</head>
	
	<body>
		<!-- 아이디 찾기 페이지 -->
			<form action = "/project/user/checkid.jsp" method="post" name="checkid">
				<table border="1">
					<caption>아이디 찾기</caption>
					
					<tr>
						<td>이름</td>
						<td><input name="s_name"></td><!-- user_name으로 해야하는지 확인 -->
					</tr>
					
					<tr>
						<td>주민번호</td>
						<td><input name="s_rrn1" maxlength="6"></td>
						<td><input name="s_rrn2" maxlength="7" type="password"></td> <!-- 뒷자리 암호화 방법 -->
					</tr>
					
					<tr>
						<td colspan="1" align="right">
						<input type="button" value="아이디 찾기" onclick="send(this.form)">
						</td>
				</table>
			</form>
	</body>
</html>