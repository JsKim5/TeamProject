<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send_check(f) {
				let id = f.user_id.value.trim();
				let pw = f.user_pw.value.trim();
				
				if(id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(pw == ''){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				f.submit();
				
			}
		</script>
	</head>
	
	<body>
		<!-- <form action="login.do" method="post"> -->
			<table border="1" align="center">
					<caption>로그인 페이지</caption>
						<tr>
							<td>아이디</td>
							<td><input  name="user_id"></td>
						</tr>
					
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw"></td>
						</tr>
						
						<tr>
							<td>
							<input type="button" value="로그인" onclick="send_check(this.form);">
							<c:if test="${message == 'error'}">
							<div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
							</div>
							</c:if>
							<input type="button" value="홈으로" onclick="location.href='home.do'"><!-- home.do를 초기화면 url로 수정 -->
							</td>
						</tr>
						
						<tr>
							<td>
							<input type = "button" value="아이디 찾기" onclick="location.href='selectId.do'">
							<input type = "button" value="비밀번호 찾기" onclick="location.href='selectPw.do'">
							<input type = "button" value="회원가입" onclick="location.href='join_Form.do'">
							</td>
						</tr>
			</table>
			
		<!-- </form> -->
	</body>
</html>