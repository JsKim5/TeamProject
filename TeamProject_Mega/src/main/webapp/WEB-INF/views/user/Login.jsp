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
				
				if(user_id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(user_pw == ''){
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
							<td>아이디<td>
							<td><input name="user_id"></td>
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
			</table>
			<table width="195" align="right">
				<tr>
					<td><font size="2"><b>
						<a href = "searchid.jsp">ID찾기</a>
						<a href = "searchpw.jsp">PW찾기</a>
						</b></font>
					</td>
				</tr>
			</table>
		<!-- </form> -->
	</body>
</html>