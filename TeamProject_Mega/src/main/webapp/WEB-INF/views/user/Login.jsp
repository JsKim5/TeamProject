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
	            font-family: Arial, sans-serif;
	            background-color: #f4f4f4;
	            margin: 0;
	            display: flex;
	            align-items: center;
	            justify-content: center;
	            height: 100vh;
	        }
	
	        form {
	            background-color: #fff;
	            padding: 20px;
	            border-radius: 8px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	        }
	
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-bottom: 15px;
	        }
	
	        table, th, td {
	            border: 1px solid #ddd;
	        }
	
	        th, td {
	            padding: 10px;
	            text-align: left;
	        }
	
		
			caption {
			    font-size: 2em; /* 글자 크기 조절 */
			    font-family: 'Arial', sans-serif; /* 글꼴 설정 */
			    color: #333; /* 글자 색상 설정 */
			    font-weight: bold; /* 글자 두께 설정 */
			    margin-bottom: 20px; /* 아래 여백 추가 */
			}
			
			
			
	        input[type="text"], input[type="password"] {
	            width: 100%;
	            padding: 8px;
	            margin: 5px 0 15px 0;
	            display: inline-block;
	            border: 1px solid #ccc;
	            box-sizing: border-box;
	            border-radius: 4px;
	        }
	
	        input[type="button"] {
	            background-color: #4caf50;
	            color: white;
	            padding: 10px 20px;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	            margin-right: 10px;
	        }
	
	        input[type="button"]:hover {
	            background-color: #45a049;
	        }
	
	        p {
	            color: red;
	            text-align: center;
	            font-weight: bold;
	        }
	
	        input[type="button"][value="홈으로"] {
	            background-color: #2196F3;
	        }
	
	        input[type="button"][value="홈으로"]:hover {
	            background-color: #0b7dda;
	        }
	    </style>
		
		<script>
			function send(f) {
				let id = f.user_id.value.trim();
				let pw = f.user_pwd.value.trim();
				
				if(id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(pw == ''){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				f.action = "login.do";
				f.submit();
				
				
			}
				
			
		</script>
	</head>
	
	<body>
		<form action="login.do" method="post">
			<table border="1">
					<caption>로그인 페이지</caption>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="user_id"></td>
						</tr>
					
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pwd"></td>
						</tr>
						
						<tr>
							<td colspan="2">
							<input type="button" value="로그인" onclick="send(this.form);">
							<input type="button" value="홈으로" onclick="location.href='home.do'"><!-- home.do를 초기화면 url로 수정 -->
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<input type = "button" value="아이디 찾기" onclick="location.href='selectid_form.do'">
								<input type = "button" value="비밀번호 찾기" onclick="location.href='selectpw_form.do'">
								<input type = "button" value="회원가입" onclick="location.href='join_form.do'">
							</td>
						</tr>
			</table>
			<p align="center" >${loginfail }</p>
		</form>
	</body>
</html>