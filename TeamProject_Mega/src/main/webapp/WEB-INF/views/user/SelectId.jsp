<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				let name = f.user_name.value.trim();
				let email = f.user_email.value.trim();
				
				if(name == '') {
					alert("이름을 입력하세요")
					return;
				}
				
				if(email == '') {
					alert("이메일을 입력하세요")
					return;
				}
				
				f.action="selectid.do";
				f.submit();
				
			}
		</script>
		
	</head>
	
	<body>
		<!-- 아이디 찾기 페이지 -->
			<form action = "CheckId.jsp" method="post">
				<table border="1">
					<caption>아이디 찾기</caption>
					
					<tr>
						<td>이름</td>
						<td><input name="user_name"></td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td><input name="user_email"></td>
					</tr>
					
					<tr>
						<td colspan="1" align="right">
						<input type="button" value="아이디 찾기" onclick="send(this.form)">
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>