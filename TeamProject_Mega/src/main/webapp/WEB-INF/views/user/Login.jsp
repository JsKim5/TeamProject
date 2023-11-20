<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		      width: 80%;
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
		      font-size: 24px;
		      margin: 10px 0;
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
		
		<script>
			function send(f) {
				let id = f.id.value.trim();
				let pw = f.pw.value.trim();
				
				if(id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(pw == ''){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				f.submit();
				location.href='home.do';
			}
		</script>
	</head>
	
	<body>
		<form action="login.do" method="post">
			<table border="1" align="center">
					<caption>로그인 페이지</caption>
						<tr>
							<td>아이디</td>
							<td><input name="id"></td>
						</tr>
					
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw"></td>
						</tr>
						
						<tr>
							<td>
							<input type="button" value="로그인" onclick="send(this.form);">
							<%-- <%-- <c:if test="${message == 'error'}">
							<div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
							</div>
							</c:if> --%>
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
			
		</form>
	</body>
</html>